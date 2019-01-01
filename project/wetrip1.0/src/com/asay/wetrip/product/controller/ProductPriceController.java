package com.asay.wetrip.product.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asay.wetrip.entity.Page;
import com.asay.wetrip.entity.Product;
import com.asay.wetrip.product.service.ProductServiceImpl;
/**
 * 
 * @ClassName:  ProductAllController   
 * @Description:按价格查询所有商品  
 * @author: 靳若琪
 * @date:   2018年12月3日 下午2:57:59
 */
@Controller
public class ProductPriceController {
	@Resource
	private ProductServiceImpl productServiceImpl;

	@RequestMapping("/productprice")
	public String productprice(HttpServletRequest request,
			@RequestParam(value = "pageNum", required = false) String pageNum) {
		int pageType = 2;
		request.setAttribute("pagetype", pageType);
		List<Product> list = this.productServiceImpl.list();
		request.getServletContext().setAttribute("product", list);
		// 1获取页码
		int num = 0;
		if (pageNum == null || pageNum.equals("")) {

			num = 1;
		} else {
			num = Integer.parseInt(pageNum);
		}
		// 2根据页码查询相关数据
		int count2 = this.productServiceImpl.findCountByPage();
		List<Product> list3 = this.productServiceImpl.list(num, 6);
		Page<Product> p = new Page<Product>(num, 3);
		p.setList(list3);
		p.setTotalCount(count2);
		request.getServletContext().setAttribute("page", p);
		return "product";
	}
}
