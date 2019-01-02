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
 * @ClassName:  ProductDaoImpl   
 * @Description:按价格和热度查询商品，并分页表示
 * @author: 靳若琪
 * @date:   2018年12月3日 下午2:17:00
 */
@Repository
public class ProductDaoImpl {
	@Resource
	private SessionFactory sessionFactory;

	/**
	 * 
	 * @Title: findAll   
	 * @Description: 按照价格升序的方式查询所有商品
	 * @param: @return      
	 * @return: List<Product>      
	 * @throws
	 */
	public List<Product> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		Query q1 = session.createQuery("from Product order by price");
		return q1.list();
	}
	
	/**
	 * 
	 * @Title: findByPage   
	 * @Description: 按页数查询价格排序商品
	 * @param: @param pageNum
	 * @param: @param pageSize
	 * @param: @return      
	 * @return: List<Product>      
	 * @throws
	 */
	public List<Product> findByPage(int pageNum, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q2 = session.createQuery("from Product order by price");
		q2.setFirstResult((pageNum - 1) * pageSize);
		q2.setMaxResults(pageSize);
		return q2.list();
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
		Session session = this.sessionFactory.getCurrentSession();
		Long count = (Long) session.createQuery("select count(*) from Product").uniqueResult();
		return count.intValue();
	}
	/**
	 * 
	 * @Title: findAll2   
	 * @Description:按热度查询商品信息  
	 * @param: @return      
	 * @return: List<Product>      
	 * @throws
	 */
	public List<Product> findAll2() {
		Session session = this.sessionFactory.getCurrentSession();
		Query q3 = session.createQuery(
				"select p from Product p,OrderDetail o where p.id=o.productId group by o.productId order by sum(order_Count) desc");
		return q3.list();
	}
	/**
	 * 
	 * @Title: findByPage2   
	 * @Description: 按页数查询热度排序商品
	 * @param: @param pageNum
	 * @param: @param pageSize
	 * @param: @return      
	 * @return: List<Product>      
	 * @throws
	 */
	public List<Product> findByPage2(int pageNum, int pageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q4 = session.createQuery(
				"select p from Product p,OrderDetail o where p.id=o.productId group by o.productId order by sum(order_Count) desc");
		q4.setFirstResult((pageNum - 1) * pageSize);
		q4.setMaxResults(pageSize);
		return q4.list();
	}

}
