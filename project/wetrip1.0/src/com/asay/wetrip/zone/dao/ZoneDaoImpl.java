package com.asay.wetrip.zone.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.asay.wetrip.entity.CollectTravel;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.entity.UserDetail;

/**
 * 
 * @ClassName:  ZoneDaoImpl   
 * @Description:TODO(实现个人空间页的相关查询功能的dao层)   
 * @author: 户子超
 * @date:   2018年12月10日 下午2:23:48
 */
@Repository
@Transactional
public class ZoneDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	/**
	 * 
	 * @Title: findTravelByUsername   
	 * @Description: TODO(根据用户昵称分页查询该用户写的所有正常状态的游记并按时间排序,并根据是否为登录用户判断展示游记的状态类型)   
	 * @param: @param pageNum  个人空间页页码
	 * @param: @param pageSize 个人空间页每页显示的游记个数
	 * @param: @param username 用户昵称
	 * @param: @return   返回得到的游记列表   
	 * @return: List<TravelNote>      
	 * @throws
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<TravelNote> findTravelByUsername(int pageNum, int pageSize,String username,String loginUsername, String date){
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from TravelNote t where t.userDetail=:userDetail and status='公开' order by t.publishtime desc");
		Query q1=session.createQuery("from TravelNote t where t.userDetail=:userDetail and status='公开'or status='仅自己可见' order by t.publishtime desc");
		Query q2=session.createQuery("from UserDetail  where username=:username").setParameter("username",loginUsername);
		Query q3=session.createQuery("from UserDetail  where username=:username").setParameter("username",username);
		
		UserDetail userDetail = (UserDetail) q2.uniqueResult();
		UserDetail userDetail2 = (UserDetail) q3.uniqueResult();
		q.setParameter("userDetail",userDetail2);	
		q1.setParameter("userDetail",userDetail);	
		
		List<TravelNote> travelList=new ArrayList<TravelNote>();
		
		if(username.equals(loginUsername)) {
			travelList=(List<TravelNote>)q1.list();
		}	
		else {
			travelList=(List<TravelNote>)q.list();	
		}
		 List<TravelNote> list= new ArrayList<TravelNote>();
		 for(TravelNote t :travelList) {
			 Date publishDate=t.getPublishtime();
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			 String s=(sdf.format(publishDate)).substring(0, date.length());
			if(s.equals(date)) {
				list.add(t);
			}
		 }
		  
		 List<TravelNote> travelNoteList=new ArrayList<TravelNote>();
		 if((pageSize*(pageNum-1))+pageSize<=list.size())
		 {
		 
			 travelNoteList=list.subList(pageSize*(pageNum-1), (pageSize*(pageNum-1))+pageSize);
		 }
		 else {
			 travelNoteList=list.subList(pageSize*(pageNum-1),list.size());
		 }
		
		return travelNoteList;			
		
	}
	
	/**
	 * 
	 * @Title: countTravelByUsername   
	 * @Description: TODO(查询该 用户访问的个人空间显示游记总数，并根据是否为登录用户判断展示游记的状态类型)  
	 * @param: @param username
	 * @param: @param loginUsername
	 * @param: @param date
	 * @param: @return      
	 * @return: int      
	 * @throws
	 */
	public int countTravelByUsername(String username,String loginUsername,String date) {
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from TravelNote t where t.userDetail=:userDetail and status='公开' order by t.publishtime desc");
		Query q1=session.createQuery("from TravelNote t where t.userDetail=:userDetail and status='公开' or status='仅自己可见' order by t.publishtime desc");
		Query q2=session.createQuery("from UserDetail  where username=:username").setParameter("username",loginUsername);
		Query q3=session.createQuery("from UserDetail  where username=:username").setParameter("username",username);
		
		UserDetail userDetail = (UserDetail) q2.uniqueResult();
		UserDetail userDetail2 = (UserDetail) q3.uniqueResult();
		q.setParameter("userDetail",userDetail2);	
		q1.setParameter("userDetail",userDetail);	
		
		List<TravelNote> travelList=new ArrayList<TravelNote>();
		
		if(username.equals(loginUsername)) {
			travelList=(List<TravelNote>)q1.list();
		}	
		else {
			travelList=(List<TravelNote>)q.list();	
		}
		 List<TravelNote> list= new ArrayList<TravelNote>();
		 for(TravelNote t :travelList) {
			 Date publishDate=t.getPublishtime();
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			 String s=(sdf.format(publishDate)).substring(0, date.length());
			if(s.equals(date)) {
				list.add(t);
			}
		 }
		return list.size();
	}
	
	
	/**
	 * 
	 * @Title: findCollectTravel   
	 * @Description: TODO(查询该用户收藏的文章集合，并分页显示)   
	 * @param: @param pageNum   收藏文章页码
	 * @param: @param pageSize  收藏部分每页显示的标题数
	 * @param: @param username  用户昵称
	 * @param: @return  返回得到的收藏列表     
	 * @return: List<CollectTravel>      
	 * @throws
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<CollectTravel> findCollectTravel(int pageNum, int pageSize,String username){
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from CollectTravel c where c.userDetail=:userDetail and status='收藏' order by c.collectTime desc");
		Query q2=session.createQuery("from UserDetail  where username=:username").setParameter("username",username);
		UserDetail userDetail = (UserDetail) q2.uniqueResult();
		q.setParameter("userDetail",userDetail);	
		q.setFirstResult(pageSize*(pageNum-1));
		q.setMaxResults(pageSize);
		
		return q.list();
	}
	
	/**
	 * 
	 * @Title: countCollectTravel   
	 * @Description: TODO(查询用户收藏的游记的总数)   
	 * @param: @param username
	 * @param: @return      
	 * @return: int      
	 * @throws
	 */
	@SuppressWarnings("rawtypes")
	public int countCollectTravel(String username){
		long collectCount=0;
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("select count(id) from CollectTravel c where c.userDetail=:userDetail and status='收藏'");
		Query q2=session.createQuery("from UserDetail  where username=:username").setParameter("username",username);
		UserDetail userDetail = (UserDetail) q2.uniqueResult();
		q.setParameter("userDetail",userDetail);					
		collectCount=(long)q.list().get(0);
		return (int)collectCount;
		
	}
	
	
	/**
	 * 
	 * @Title: findTravelTime   
	 * @Description: TODO(实现zone页的时间归档功能，查询游记的发布时间，并按照年和月分类)   
	 * @param: @param username
	 * @param: @return      
	 * @return: List      
	 * @throws
	 */
	@SuppressWarnings("rawtypes")
	public List<String> findTravelTime(String username) {
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("select publishtime from TravelNote t where t.userDetail=:userDetail order by publishtime");
		Query q2=session.createQuery("from UserDetail  where username=:username").setParameter("username",username);
		UserDetail userDetail = (UserDetail) q2.uniqueResult();
		q.setParameter("userDetail",userDetail);
		
		List<String> dateList= new ArrayList<String>();
		List<String> list=q.list();
		
		for(int i=0;i<list.size();i++) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String s=sdf.format(list.get(i));
			dateList.add(s);
		}
		
		HashSet<String> h = new HashSet<String>(dateList);   
		dateList.clear();   
		dateList.addAll(h);  
		return dateList;
		
	}
	
	
	public void deleteTravel(int travelId){
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("update TravelNote t set t.status='已删除' where t.id=:id");
		q.setParameter("id", travelId);
		q.executeUpdate();
	}
	/**
	 * 
	 * @Title: findUserDetailByUsername   
	 * @Description: TODO(通过用户名获取用户详情)   
	 * @param: @param username
	 * @param: @return      
	 * @return: UserDetail      
	 * @throws
	 */
	public UserDetail findUserDetailByUsername(String username){
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from UserDetail  where username=:username").setParameter("username",username);
		return (UserDetail) q.uniqueResult();
	}
	
	
}
