package com.asay.wetrip.entity;


public class CartItem {
	private Product product;//购物车里面放入的商品类型
	private int count;//数量
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}

