package com.asay.wetrip.report.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.entity.TravelNote;

/**
 * <b>ReportDaoImpl</b>
 *
 *<p>实现举报功能的dao层
 *<p>获取所需要变更的游记文章，将其被举报的次数+1
 * @author: 孙亦璇
 * @date: 2018年12月4日 下午9:51:50
 * @version v0.0.1  
 */
@Repository
@Transactional
public class ReportDaoImpl {
	@Resource
	private SessionFactory sessionFactory;


	/**
	 * <b>executePraise</b>   
	 * <p>执行举报操作的方法
	 * 
	 * @param  travelNote 要举报的文章     
	 * @author 孙亦璇
	 * @date: 2018年12月4日 下午9:51:50
	 * @version v0.0.1      
	 */
	public void executeReport(TravelNote travelNote) {
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("update TravelNote set reportcount=:reportcount where id=:id");
		q.setParameter("reportcount", travelNote.getReportcount() + 1);
		q.setParameter("id", travelNote.getId());
		q.executeUpdate();
	}

}
