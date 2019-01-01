package com.asay.wetrip.cart.service;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.cart.dao.OrderDao;
import com.asay.wetrip.entity.UserDetail;

/**
 * 
 * @ClassName: OrderService  
 * @Description:订单的service层  
 * @author: 靳若琪
 * @date:   2018年12月12日 下午4:31:40
 */
@Service
@Transactional(readOnly=false)
public class OrderService {
	@Resource
	private OrderDao orderDao;
	public void addOrder(UserDetail userDetail) {
		this.orderDao.addOrder(userDetail);
	}
}
