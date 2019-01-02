package com.asay.wetrip.collect.dao;

import java.sql.Timestamp;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.entity.CollectTravel;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.entity.UserDetail;
import com.asay.wetrip.entity.Users;

/**
 *  *   * @ClassName:  CollectDaoImpl     * @Description:收藏功能  * @author:倪泽苒
 *  * @date:   2018年12月5日 上午8:59:11  
 */
@Repository
@Transactional
public class CollectDaoImpl {
	@Resource
	private SessionFactory sessionFactory;

	// 根据id查游记
	public TravelNote findTravelById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from TravelNote tn where tn.id=:id").setParameter("id", id);
		return (TravelNote) q.list().get(0);
	}

	/**
	 * <b>isCollect</b>   
	 * <p>
	 * 查询游记是否已被收藏
	 * <p>
	 * 若用户未登录，返回false；若用户已收藏，则返回true；未收藏返回false
	 * 
	 * @param travelNote 游记
	 * @param userDetail  用户信息   
	 * @return Boolean 用户是否已经收藏   
	 * @author 孙亦璇
	 * @date 2018年12月17日下午9:01:55
	 * @version v0.0.1
	 */
	public Boolean isCollect(TravelNote travelNote, UserDetail userDetail) {
		if (userDetail == null) {
			return false;
		}
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from CollectTravel where travelNote=:travelNote and userDetail = :userDetail");
		q.setParameter("travelNote", travelNote);
		q.setParameter("userDetail", userDetail);
		if (q.uniqueResult() != null) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * <b>addCollectNote</b>   
	 *
	 * <p>添加收藏的方法
	 *
	 * <p>获得游记和用户详情，将数据插入收藏表中，实现收藏
	 * @param userDetail  用户详情
	 * @param travelNote  游记    
	 * @return void
	 * 
	 * @author 孙亦璇
	 * @date 2018年12月17日20:57:11
	 * @version v0.0.1
	 */
	public void addCollectNote(UserDetail userDetail, TravelNote travelNote) {
		Session session = this.sessionFactory.getCurrentSession();
		CollectTravel collectTravel = new CollectTravel();
		collectTravel.setCollectTime(new Timestamp(System.currentTimeMillis()));
		collectTravel.setStatus("收藏");
		collectTravel.setTravelNote(travelNote);
		collectTravel.setUserDetail(userDetail);

		session.save(collectTravel);
	}

	/**
	 * <b>removeCollectNote</b>   
	 *
	 * <p>删除收藏的方法
	 *
	 * <p>获得游记和用户详情，将数据从收藏表中删除
	 * @param userDetail  用户详情
	 * @param travelNote  游记    
	 * @return void
	 * 
	 * @author 孙亦璇
	 * @date 2018年12月17日21:04:50
	 * @version v0.0.1
	 */
	public void removeCollectNote(UserDetail userDetail, TravelNote travelNote) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session
				.createQuery("delete from CollectTravel where userDetail = :userDetail and travelNote = :travelNote");
		q.setParameter("userDetail", userDetail);
		q.setParameter("travelNote", travelNote);
		q.executeUpdate();
	}

}
