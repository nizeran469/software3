package com.asay.wetrip.product.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.entity.Product;
import com.asay.wetrip.product.dao.ProductDaoImpl;
/**
 * 
 * @ClassName:  ProductServiceImpl   
 * @Description:查询商品的service层  
 * @author: 靳若琪
 * @date:   2018年12月3日 下午2:42:07
 */
@Service
@Transactional(readOnly = true)
public class ProductServiceImpl {
	@Resource
	private ProductDaoImpl productDaoImpl;
	
    /**
     * 
     * @Title: list   
     * @Description:按照价格升序的方式查询所有商品  
     * @param: @return      
     * @return: List<Product>      
     * @throws
     */
	public List<Product> list() {
		return this.productDaoImpl.findAll();
	}
	/**
	 * 
	 * @Title: list   
	 * @Description: 按页数查询价格排序商品
	 * @param: @param pageNum
	 * @param: @param pageSize
	 * @param: @return      
	 * @return: List<Product>      
	 * @throws
	 */
	public List<Product> list(int pageNum, int pageSize) {
		return this.productDaoImpl.findByPage(pageNum, pageSize);
	}
	/**
	 * 
	 * @Title: findCountByPage   
	 * @Description: 商品数量  
	 * @param: @return      
	 * @return: int      
	 * @throws
	 */
	public int findCountByPage() {
		return this.productDaoImpl.findCountByPage();
	}
	/**
	 * 
	 * @Title: list2   
	 * @Description:按照热度高到低的方式查询所有商品  
	 * @param: @return      
	 * @return: List<Product>      
	 * @throws
	 */
	public List<Product> list2() {
		return this.productDaoImpl.findAll2();
	}
	/**
	 * 
	 * @Title: list2   
	 * @Description: 按页数查询热度排序商品  
	 * @param: @param pageNum
	 * @param: @param pageSize
	 * @param: @return      
	 * @return: List<Product>      
	 * @throws
	 */
	public List<Product> list2(int pageNum, int pageSize) {
		return this.productDaoImpl.findByPage2(pageNum, pageSize);
	}
}
