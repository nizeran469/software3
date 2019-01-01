package com.asay.wetrip.part.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.entity.Tags;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.part.dao.PartDaoImpl;

/**
 * 
 * @ClassName:  PartServiceImpl   
 * @Description:TODO 实现分区页面相关查询功能 的service层 
 * @author: 户子超
 * @date:   2018年12月5日 上午9:05:43
 */
@Service
@Transactional(readOnly=true)
public class PartServiceImpl {
	@Resource
	private PartDaoImpl partDaoImpl;
	
	/***
	 * 
	 * @Title: ListSort   
	 * @Description: TODO 将list按点赞数排序
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
                    int p1=o1.getPraiseCount();
                    int p2=o2.getPraiseCount();
                    if (p1 < p2) {
                        return 1;
                    } else if (p1 >p2) {
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
	 * @Title: listTravelByTag   
	 * @Description: TODO  得到dao层查到的按时间排序的游记列表  
	 * @param: @param pageNum  页码
	 * @param: @param pageSize 每页游记数量
	 * @param: @param tagName  分类标签名
	 * @param: @return  返回得到的游记列表    
	 * @return: List<TravelNote>      
	 * @throws
	 */
	public List<TravelNote> listTravelByTagSortByTime(int pageNum, int pageSize, String tagName){
		return this.partDaoImpl.findTravelByTag(pageNum, pageSize, tagName);
	}
	
	/**
	 * 
	 * @Title: listTravelByTag   
	 * @Description: TODO  得到dao层查到的按热度排序的游记列表  
	 * @param: @param pageNum  页码
	 * @param: @param pageSize 每页游记数量
	 * @param: @param tagName  分类标签名
	 * @param: @return  返回得到的游记列表    
	 * @return: List<TravelNote>      
	 * @throws
	 */
	public List<TravelNote> listTravelByTagSortByPraise(int pageNum, int pageSize, String tagName){
		List<TravelNote> list=this.partDaoImpl.findTravelByTag(pageNum, pageSize, tagName);
		return ListSort(list);
	}
	
	/**
	 * 
	 * @Title: countTravelByTag   
	 * @Description: TODO 得到dao层查到的游记总数
	 * @param: @param tagName  分类标签名
	 * @param: @return 返回游记数量     
	 * @return: int      
	 * @throws
	 */
	public int countTravelByTag(String tagName) {
		return this.partDaoImpl.CountTravelByTag(tagName);
	}
	
	/**
	 * 
	 * @Title: findTags   
	 * @Description: TODO(得到dao层查到的父标签下的按热度排序的子标签)   
	 * @param: @param TagPageNum
	 * @param: @param pageSize
	 * @param: @param tagName
	 * @param: @return      
	 * @return: List<Tags>      
	 * @throws
	 */
	public List<Tags> findTags(int TagPageNum, int pageSize ,String tagName){
		return this.partDaoImpl.findTags(TagPageNum, pageSize, tagName);
	}
	
	public int countTags(String tagName) {
		return this.partDaoImpl.countTags(tagName);
	}
	
}