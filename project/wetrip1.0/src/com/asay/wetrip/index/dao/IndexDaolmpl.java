package com.asay.wetrip.index.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.asay.wetrip.entity.Topic;
import com.asay.wetrip.entity.TravelNote;
/**
 * 
 * @ClassName:  IndexDaolmpl   
 * @Description:首页相关功能查询 
 * @author: 倪泽苒 户子超
 * @date:   2018年12月3日 上午10:35:16
 */
@Repository
public class IndexDaolmpl {
@Resource
private SessionFactory sessionFactory;
//热门说说查询
public TravelNote findShort(String city,int pageNumshort) {
	Session session=sessionFactory.getCurrentSession();
	Query q=session.createQuery("from TravelNote tn where tn.islong=0 and tn.city=:city order by tn.praiseCount desc").setParameter("city", city);
	q.setFirstResult(pageNumshort-1);
	q.setMaxResults(1);
	return (TravelNote) q.uniqueResult();
}
//说说的长度查询
public int countTravelByTopic(String city) {
	Session session=this.sessionFactory.getCurrentSession();
	Query q=session.createQuery("select count(id) from TravelNote where islong=0 and city=:city ").setParameter("city", city);	
	long count=(Long) q.uniqueResult();
	return (int)count;
}
//长文章查询,前六个
public List<TravelNote> findLong(String city ){
	Session session=this.sessionFactory.getCurrentSession();
	Query q=session.createQuery("from TravelNote tn where tn.islong=1 and tn.city=:city order by tn.praiseCount desc").setParameter("city", city);
	q.setFirstResult(0);
	q.setMaxResults(6);
	return q.list();
}

}

