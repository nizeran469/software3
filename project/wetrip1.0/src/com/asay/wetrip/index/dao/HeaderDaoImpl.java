package com.asay.wetrip.index.dao;

import java.util.List;

import javax.annotation.Resource;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.asay.wetrip.entity.Tags;

@Repository
public class HeaderDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public List<Tags> findAll(){
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Tags tag where tag.parentTag = null");
		return q.list();
	}
}








