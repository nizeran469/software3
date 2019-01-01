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
 * @ClassName:  ProductHotController   
 * @Description:按照商品热度查询商品并展示
 * @author:靳若琪
 * @date:   2018年12月3日 下午2:46:20
 */
@Controller
public class ProductHotController {

	@Resource
	private ProductServiceImpl productServiceImpl;

	@RequestMapping("/producthot")
	public String producthot(HttpServletRequest request,
			@RequestParam(value = "pageNum", required = false) String pageNum) {
		int pageType = 1;
		request.setAttribute("pagetype", pageType);
		List<Product> list2 = this.productServiceImpl.list2();
		request.getServletContext().setAttribute("product", list2);
		// 1获取页码
		int num = 0;
		if (pageNum == null || pageNum.equals("")) {

			num = 1;
		} else {
			num = Integer.parseInt(pageNum);
		}
		int count2 = this.productServiceImpl.findCountByPage();
		List<Product> list4 = this.productServiceImpl.list2(num, 6);
		Page<Product> p = new Page<Product>(num, 3);
		p.setList(list4);
		p.setTotalCount(count2);
		request.getServletContext().setAttribute("page", p);
		return "product";
	}
}
