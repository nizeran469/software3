package com.asay.wetrip.cart.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asay.wetrip.entity.Cart;
import com.asay.wetrip.entity.Product;
import com.asay.wetrip.product.service.GoodService;
/**
 * 
 * @ClassName:  CartController   
 * @Description:对购物车进行操作
 * @author: 靳若琪
 * @date:   2018年12月10日 下午2:26:52
 */
@Controller
public class CartController {
	@Resource
	private GoodService goodService;
	/**
	 * 
	 * @Title: addCart   
	 * @Description:加入购物车  
	 * @param: @param request
	 * @param: @param num
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/addcart")
	public String addCart(HttpServletRequest request, @RequestParam int num) {
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("userEmail");
		/* 如果用户未登录跳转到登录页 */
		if (user == null) {
			return "login";
		}
		/* 如果用户已经登录，查询购物车 */
		if (user != null) {
			// 获取到产品的id号判断是否为空，不为空则根据id查询产品，获取到产品的信息，放到购物车里面
			String id = request.getParameter("id");
			// 判断是否为空
			if (id != null && !id.equals("")) {
				Product p = goodService.listById(id);// 根据产品的id号得到产品的数据
				Object obj = session.getAttribute("cart");
				// 当前购物车为空
				Cart cart = null;
				if (obj == null) {// 如果没有购物车，先创建一个购物车
					cart = new Cart();
				} else {
					cart = (Cart) obj;
				}
				cart.add(p, num);// 往购物车里面放上自己要买的东西
				session.setAttribute("cart", cart);// 更新一下自己购物车
			}
		}
		return "forward:/cart";
	}

	/**
	 * 
	 * @Title: removeCart   
	 * @Description: 删除购物车的某一商品  
	 * @param: @param request
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/removecart")
	public String removeCart(HttpServletRequest request) {
		System.out.println("删除");
		HttpSession session = request.getSession();
			// 获取到产品的id号判断是否为空，不为空则根据id查询商品，获取到商品的信息，放到购物车里面
			String id = request.getParameter("id");
			// 判断是否为空
			if (id != null && !id.equals("")) {
				Product p = goodService.listById(id);// 根据产品的id号得到产品的数据
				Object obj = session.getAttribute("cart");
				Cart cart =(Cart) obj;
				cart.remove(p);// 往购物车里面放上自己要买的东西
				session.setAttribute("cart", cart);// 更新一下自己购物车
			}
		return "forward:/cart";
	}
	@ResponseBody
	@RequestMapping(value="/updatecart",method=RequestMethod.POST)
	public String updateCart(HttpServletRequest request) {
		System.out.println("更新了");
		HttpSession session = request.getSession();
		// 获取到产品的id号判断是否为空，不为空则根据id查询商品，获取到商品的信息，放到购物车里面
		String id = request.getParameter("id");
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("获取到的数量："+num);
		// 判断是否为空
		if (id != null && !id.equals("")) {
			Product p = goodService.listById(id);// 根据产品的id号得到产品的数据
			Object obj = session.getAttribute("cart");
			Cart cart = (Cart) obj;
			cart.update(p, num);// 往购物车里面放上自己要买的东西
			session.setAttribute("cart", cart);// 更新一下自己购物车
		}
		return "forward:/cart";
	}
	/**
	 * 
	 * @Title: checkOut   
	 * @Description: 查询购物车的全部商品并展示  
	 * @param: @param request
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/cart")
	// 购物车的列表展示页
	public String checkOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("userEmail");

		/* 如果用户未登录跳转到登录页 */
		if (user == null) {
			return "login";
		}else {
			return "cart";
		}
	}

}
