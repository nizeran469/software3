package com.asay.wetrip.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="wt_product")
public class Product {
//	@Column(name="product_id")
	private int id;
	
	private String name;

	private String description;
	private String pic;
	private double price;
	private double discount;
	private String how_use;
	//产品表和订单表 一对多
	private Set<Orders> orders=new HashSet<Orders>(0);	

	@Id
	@Column(name="product_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="product_name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name="product_description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	@ManyToMany
	@JoinTable(name="wt_order_detail",joinColumns=@JoinColumn(name="product_id"),inverseJoinColumns=@JoinColumn(name="order_id"))
	public Set<Orders> getOrders() {
		return orders;
	}
	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}
	@Column(name="product_pic")
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	@Column(name="product_how_use")
	public String getHow_use() {
		return how_use;
	}
	public void setHow_use(String how_use) {
		this.how_use = how_use;
	}

}
