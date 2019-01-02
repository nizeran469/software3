package com.asay.wetrip.product.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.entity.Product;
import com.asay.wetrip.product.dao.GoodDao;

/**
 * 
 * @ClassName: GoodService
 * @Description:根据id查询商品的service层
 * @author: 靳若琪
 * @date: 2018年12月9日 下午2:33:21
 */
@Service
@Transactional(readOnly = true)
public class GoodService {

	@Resource
	private GoodDao goodDao;
	/**
	 * 
	 * @Title: list   
	 * @Description:按照id查找的商品的列表   
	 * @param: @param id
	 * @param: @return      
	 * @return: List<Product>      
	 * @throws
	 */
	public List<Product> list(String id) {
		return this.goodDao.findById2(id);
	}

	/**
	 * 
	 * @Title: listById   
	 * @Description: 按照id查找的商品的对象  
	 * @param: @param id
	 * @param: @return      
	 * @return: Product      
	 * @throws
	 */
	public Product listById(String id) {
		return this.goodDao.findById(id);
	}
}
