package com.asay.wetrip.detail.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.entity.Comment;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.entity.UserDetail;
import com.asay.wetrip.entity.Users;
/**
 * 
 * @ClassName:  DetailDaoImpl   
 * @Description:TODO(这里用一句话描述这个类的作用)   
 * @author: Administrator
 * @date:   2018年12月10日 上午9:04:44
 */
@Repository
@Transactional
public class DetailDaoImpl {
@Resource
private SessionFactory sessionFactory;
/**
 * 
 * @Title: findTravelById   
 * @Description:根据id查询游记
 * @param: @param id
 * @param: @return      
 * @return: TravelNote      
 * @throws
 */
public TravelNote findTravelById(int id) {
	Session session=this.sessionFactory.getCurrentSession();
	Query q=session.createQuery("from TravelNote tn where tn.id=:id").setParameter("id", id);
	return (TravelNote)q.uniqueResult();
}
/**
 * 
 * @Title: findTravelByWritter   
 * @Description: 某作者下热度的前3篇游记  
 * @param: @param users    
 * @return: List<TravelNote>      
 * @throws
 */
public List<TravelNote> findTravelByWritter(UserDetail userDetail){
	Session session=this.sessionFactory.getCurrentSession();
	Query q=session.createQuery("from TravelNote tn where tn.userDetail=:userDetail order by tn.praiseCount desc").setParameter("userDetail", userDetail);
	q.setFirstResult(0);
	q.setMaxResults(3);
	return q.list();
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
	Session session=this.sessionFactory.getCurrentSession();
	Query q=session.createQuery("from Comment c where c.travelNote=:travelNote order by c.commentTime desc").setParameter("travelNote", travelNote);
	return q.list();
}
/**
 * 
 * @Title: addComment   
 * @Description: 数据库插入该条评论
 * @param: @param comment      
 * @return: void      
 * @throws
 */
public void addComment(Comment comment ) {
	Session session=this.sessionFactory.getCurrentSession();
	session.save(comment);
}
public Comment findCommentById(int id ) {
	Session session=this.sessionFactory.getCurrentSession();
	Query q=session.createQuery("from Comment c where c.id=:id").setParameter("id", id);
	return (Comment)q.uniqueResult();
}
}
