package com.asay.wetrip.cart.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asay.wetrip.cart.service.OrderService;
import com.asay.wetrip.entity.UserDetail;

/**
 * 
 * @ClassName: OrderController
 * @Description:处理订单
 * @author: 靳若琪
 * @date: 2018年12月12日 下午4:37:59
 */
@Controller
public class OrderController {
	@Resource
	private SessionFactory sessionFactory;
	@Resource
	private OrderService orderService;
	/**
	 * 
	 * @Title: AddOrder   
	 * @Description:  订单表增加用户 
	 * @param: @param request
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/addorder")
	public String AddOrder(HttpServletRequest request) {		
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("userEmail");
		UserDetail userDetail = new UserDetail();
		userDetail.setEmail(user);
		orderService.addOrder(userDetail);
		System.out.println("插入成功了hhhh");
		return "checkout";
	}

}
