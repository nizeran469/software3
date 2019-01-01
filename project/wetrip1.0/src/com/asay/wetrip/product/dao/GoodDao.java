package com.asay.wetrip.product.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.asay.wetrip.entity.Product;

/**
 * 
 * @ClassName: GoodDao
 * @Description:根据id查询商品的dao层
 * @author: 靳若琪
 * @date: 2018年12月9日 下午2:32:03
 */
@Repository
public class GoodDao {

	@Resource
	private SessionFactory sessionFactory;

	/**
	 * 
	 * @Title: findById2   
	 * @Description:按照id查找的商品的列表
	 * @param: @param id
	 * @param: @return      
	 * @return: List<Product>      
	 * @throws
	 */
	public List<Product> findById2(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Product where id='" + id + "'");
//		q.setParameter(0,"id");
		return q.list();

	}

	/**
	 * 
	 * @Title: findById   
	 * @Description: 按照id查找的商品的对象   
	 * @param: @param id
	 * @param: @return      
	 * @return: Product      
	 * @throws
	 */
	public Product findById(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where id ='" + id + "'");
		Product product = (Product) query.uniqueResult();
		return product;
	}
}
