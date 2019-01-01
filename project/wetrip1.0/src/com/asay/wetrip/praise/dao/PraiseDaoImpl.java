package com.asay.wetrip.praise.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.entity.TravelNote;
/**
 * <b>PraiseDaoImpl</b>
 *
 *<p>实现点赞功能的dao层
 *<p>获取所需要变更的游记文章，将其点赞数+1，并返回点赞数
 *   
 * @author 孙亦璇
 * @since 2018年12月17日09:16:39
 * @version v0.0.1
 */

@Repository
@Transactional
public class PraiseDaoImpl {
	@Resource
	private SessionFactory sessionFactory;

	/**
	 * <b>executePraise</b>   
	 * <p>执行点赞操作的方法
	 * <p>点赞后，返回该文章当前的点赞数
	 * 
	 * @param  travelNote 要点赞的文章     
	 * @return int  该篇文章目前的点赞数
	 * @author 孙亦璇
	 * @since 2018年12月17日09:16:39
	 * @version v0.0.1      
	 */
	public int executePraise(TravelNote travelNote) {
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery("update TravelNote set praiseCount=:praiseCount where id=:id");
		q.setParameter("praiseCount", travelNote.getPraiseCount()+1);
		q.setParameter("id", travelNote.getId());
		q.executeUpdate();
		
		return travelNote.getPraiseCount()+1;
	}
}
