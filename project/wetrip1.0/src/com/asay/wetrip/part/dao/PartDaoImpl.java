package com.asay.wetrip.part.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.asay.wetrip.entity.TagTravelNote;
import com.asay.wetrip.entity.Tags;
import com.asay.wetrip.entity.TravelNote;

/**
 * 
 * @ClassName:  PartDaoImpl   
 * @Description:TODO 分区页相关查询功能的实现  
 * @author: 户子超
 * @date:   2018年12月5日 上午8:50:47
 */
@Repository
public class PartDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	
	/**
	 * 
	 * @Title: ListSort   
	 * @Description: TODO 将获取的游记 list按时间排序  
	 * @param: @param list
	 * @param: @return      
	 * @return: List<TravelNote>      
	 * @throws
	 */
	 private static List<TravelNote> ListSort(List<TravelNote> list) {
	        Collections.sort(list, new Comparator<TravelNote>() {
	            @Override
	            public int compare(TravelNote o1, TravelNote o2) {
	               
	                try {
	                    Date dt1 = o1.getPublishtime();
	                    Date dt2 = o2.getPublishtime();
	                    if (dt1.getTime() < dt2.getTime()) {
	                        return 1;
	                    } else if (dt1.getTime() > dt2.getTime()) {
	                        return -1;
	                    } else {
	                        return 0;
	                    }
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	                return 0;
	            }
	        });
	        return list;
	    }
	

	/**
	 * 
	 * @Title: findTravelByTag   
	 * @Description: TODO 通过获取的分类标签按时间查询该标签下的所有游记 并分页
	 * @param: @param pageNum  页数
	 * @param: @param pageSize 每页数量
	 * @param: @param tagName  父类标签名
	 * @param: @return   返回获取的游记列表    
	 * @return: List<TravelNote>      
	 * @throws
	 */
	@SuppressWarnings("static-access")
	public List<TravelNote> findTravelByTag(int pageNum, int pageSize ,String tagName){
		Session session=this.sessionFactory.getCurrentSession();
		
		Query q=session.createQuery("from Tags t where t.tagName=:tagName");
		q.setParameter("tagName", tagName);
		Tags tag=(Tags)q.uniqueResult();
		Query q2=session.createQuery("from TagTravelNote t where t.tags=:tag");
		q2.setParameter("tag", tag);
		
		List<TagTravelNote> tagTravelNote=(List<TagTravelNote>)q2.getResultList();
		List<TravelNote> list = new ArrayList<TravelNote>();
		
		for(TagTravelNote i:tagTravelNote ) {
			TravelNote travelNote= i.getTravelNote();
			if(travelNote.getStatus().equals("公开")) {
				list.add(travelNote);
			}
		}
		List<TravelNote> list2=ListSort(list);
		List<TravelNote> travelNoteList=new ArrayList<TravelNote>();
		if((pageNum-1)*pageSize+pageSize<list2.size()) {
			travelNoteList=list2.subList((pageNum-1)*pageSize, (pageNum-1)*pageSize+pageSize);
		}
		else {
			travelNoteList=list2.subList((pageNum-1)*pageSize, list2.size());
		}
		
		this.ListSort(travelNoteList);
		
		return  travelNoteList;
			
		}
	
	
	
	
	
	/**
	 * 
	 * @Title: CountTravelByTag   
	 * @Description: TODO  查询该分类标签下的游记总数  
	 * @param: @param tagName  分类标签名
	 * @param: @return  返回得到的游记总数    
	 * @return: int      
	 * @throws
	 */
	public int CountTravelByTag(String tagName){
		int count=0;
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Tags t where t.tagName=:tagName");
		q.setParameter("tagName", tagName);
		Tags tag=(Tags) q.list().get(0);
	
		Set<TagTravelNote> tagTravelNote=tag.getTagTravelNote();
		List<TravelNote> list = new ArrayList<TravelNote>();
		
		for(TagTravelNote i:tagTravelNote ) {
			TravelNote travelNote= i.getTravelNote();
			if(travelNote.getStatus().equals("公开")) {
				list.add(travelNote);
			}
		}
		count=list.size();
		
		return count;
	}
	
	
	/**
	 * 
	 * @Title: findTags   
	 * @Description: TODO 查询 分类标签下的个子标签并按热度排序
	 * @param: @param tagPageNum 标签下的换一批页码
	 * @param: @param pageSize 每页容量
	 * @param: @param tagName 分类标签(即父标签)名字
	 * @param: @return 返回查询到的标签列表     
	 * @return: List<Tags>      
	 * @throws
	 */
	public List<Tags> findTags(int tagPageNum, int pageSize ,String tagName){
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Tags t where t.tagName=:tagName");
		q.setParameter("tagName", tagName);
		
		Tags tag=(Tags) q.uniqueResult();
		Query q2=session.createQuery("from Tags t where t.parentTag=:tag order by tagCount desc");
		q2.setParameter("tag", tag);
		q2.setFirstResult(pageSize*(tagPageNum-1));
		q2.setMaxResults(pageSize);
		
		return q2.list();
	
	}
	
	public int countTags(String tagName) {
		
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Tags t where t.tagName=:tagName");
		q.setParameter("tagName", tagName);
		
		Tags tag=(Tags) q.uniqueResult();
		Query q2=session.createQuery(" from Tags t where t.parentTag=:tag");
		q2.setParameter("tag", tag);
		int count=q2.list().size();
		return count;
	}
	
}
