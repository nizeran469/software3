package com.asay.wetrip.cart.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.asay.wetrip.entity.Orders;
import com.asay.wetrip.entity.UserDetail;

/**
 * 
 * @ClassName:  OrderDao  
 * @Description:添加订单
 * @author: 靳若琪
 * @date:   2018年12月10日 下午4:34:02
 */
@Repository
public class OrderDao {
	@Resource
	private SessionFactory sessionFactory;
	/**
	 * 
	 * @Title: addOrder   
	 * @Description:向订单表中增加信息  
	 * @param: @param userDetail      
	 * @return: void      
	 * @throws
	 */
	public void addOrder(UserDetail userDetail) {
		Session session=sessionFactory.getCurrentSession();
		Orders order=new Orders();
		order.setUserDetail(userDetail);
		order.setStatus("待发货");
		session.save(order);
	}
}
