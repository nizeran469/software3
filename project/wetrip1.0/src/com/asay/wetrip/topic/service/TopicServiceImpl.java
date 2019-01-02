package com.asay.wetrip.topic.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.entity.Topic;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.topic.dao.TopicDaoImpl;

/**
 * 
 * @ClassName:  TopicServiceImpl   
 * @Description:涉及今日话题的查询service层  
 * @author: 户子超   倪泽苒
 * @date:   2018年12月12日 下午2:45:03
 */
@Service
@Transactional(readOnly=true)
public class TopicServiceImpl {
	@Resource
	private TopicDaoImpl topicDaoImpl;
/**
 * 	
 * @Title: findTravelByTopic   
 * @Description:根据话题找参与今日话题的游记（分页），参数是当前页码，以及页容量，游记id
 * @param: @param pageNum
 * @param: @param pageSize
 * @param: @param topicId
 * @param: @return      
 * @return: List<TravelNote>      
 * @throws
 */
	public List<TravelNote> findTravelByTopic(int pageNum, int pageSize,int topicId){
		return this.topicDaoImpl.findTravelByTopic(pageNum, pageSize, topicId);		
	}
	//根据话题找参与今日话题的游记	
			public TravelNote findTravelByTopic(int pageNum,int topicId){
				return this.topicDaoImpl.findTravelByTopic(pageNum, topicId);		
			}
/**
 * 	
 * @Title: countTravel   
 * @Description:计数多少游记参与今日话题	
 * @param: @param topicId
 * @param: @return      
 * @return: int      
 * @throws
 */
	public int countTravel(int topicId) {
		return topicDaoImpl.countTravelByTopic(topicId);
	}
/**
 * 	
 * @Title: findTopicById   
 * @Description: 根据id找今日话题内容
 * @param: @param topicId
 * @param: @return      
 * @return: Topic      
 * @throws
 */
	public Topic findTopicById(int topicId) {
		return this.topicDaoImpl.findTopicById(topicId);
	}
/**
 * 	
 * @Title: findTopicWeeks   
 * @Description: 查询前六日的话题 
 * @param: @param topicId
 * @param: @return      
 * @return: List<Topic>      
 * @throws
 */
public List<Topic> findTopicWeeks(int topicId){
	List<Topic> topicList=new ArrayList();
	for(int i=1;i<=6&&topicId-i>0;i++) {
		
		topicList.add(this.topicDaoImpl.findTopicById(topicId-i));
	}
	return topicList;
}
public Topic getTodayTopic() {
	return topicDaoImpl.getTodayTopic();
}
}
