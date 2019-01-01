package com.asay.wetrip.detail.service;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.detail.dao.DetailDaoImpl;
import com.asay.wetrip.entity.Comment;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.entity.UserDetail;
import com.asay.wetrip.entity.Users;
/**
 * 
 * @ClassName:  DetailServiceImpl   
 * @Description:TODO(这里用一句话描述这个类的作用)   
 * @author:倪泽苒
 * @date:   2018年12月10日 上午9:11:31
 */
@Service
@Transactional
public class DetailServiceImpl {
@Resource
private DetailDaoImpl detailDaoImpl;
/**
 * 
 * @Title: findTravelById   
 * @Description: 根据id查询游记
 * @param: @param id
 * @param: @return      
 * @return: TravelNote      
 * @throws
 */
public TravelNote findTravelById(int id) {
	return this.detailDaoImpl.findTravelById(id);
}
/**
 * 
 * @Title: findTravelByWritter   
 * @Description: 某作者下热度的前3篇游记   
 * @param: @param userDetail
 * @param: @return      
 * @return: List<TravelNote>      
 * @throws
 */
public List<TravelNote> findTravelByWritter(UserDetail userDetail){
	return this.detailDaoImpl.findTravelByWritter(userDetail);
}
/**
 * 
 * @Title: findComment   
 * @Description: 评论按时间排序，返回评论list 
 * @param: @param travelNote
 * @param: @return      
 * @return: List<Comment>      
 * @throws
 */
public List<Comment> findComment(TravelNote travelNote){
	return this.detailDaoImpl.findComment(travelNote);
}
/**
 * 
 * @Title: addComment   
 * @Description: 添加评论和回复 
 * @param: @param content
 * @param: @param user
 * @param: @param travelid      
 * @return: void      
 * @throws
 */
public void addComment(String content,UserDetail userDetail,int travelid,String parentId) {

//根据id查comment,根据id查travel		
		Comment comment=new Comment();
		comment.setCommentTime(new Timestamp(System.currentTimeMillis()));
//如果是回复，则查找父评论并set，是评论则无parentid		
	if(parentId != null) {
			comment.setParentComment(this.detailDaoImpl.findCommentById( Integer.parseInt(parentId)) );
	}
		comment.setCommentContent(content);
		comment.setTravelNote(this.findTravelById(travelid));
		comment.setUserDetail(userDetail);
		this.detailDaoImpl.addComment(comment);
	
	
}

}
