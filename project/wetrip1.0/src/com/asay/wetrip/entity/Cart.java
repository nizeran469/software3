package com.asay.wetrip.entity;

import java.util.HashMap;

public class Cart {
	// 一个属性来存商品
	private HashMap<Integer, CartItem> container = new HashMap<Integer, CartItem>();

	public HashMap<Integer, CartItem> getContainer() {
		return container;
	}

	public void setContainer(HashMap<Integer, CartItem> container) {
		this.container = container;
	}

	// 添加商品到购物车
	public void add(Product p, int num) {
		System.out.println(num);
		//如果已经存在，直接在加该商品数量
		if (container.containsKey(p.getId())) {
			int count = container.get(p.getId()).getCount() + num;
			container.get(p.getId()).setCount(count);
		} else {//不存在该商品，创建
			CartItem ci = new CartItem();
			ci.setProduct(p);
			ci.setCount(num);
			container.put(p.getId(), ci);
		}
	}

	// 购物车删除商品
	public void remove(Product p) {
		container.remove(p.getId());
	}

	// 购物车更改商品数量
	public void update(Product p, int num) {
		if(num>container.get(p.getId()).getCount()) {
			int count = num;
			container.get(p.getId()).setCount(count);
		}else {
			int count = num;
			container.get(p.getId()).setCount(count);
		}
		
	}
}
