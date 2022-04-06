package com.summer.entity;

import java.io.Serializable;

public class OrderItem implements Serializable {

	private static final long serialVersionUID = -6618476731780668503L;

	private int id;
	private Order order;
	private Dress dress;
	private int buynum;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Dress getDress() {
		return dress;
	}

	public void setDress(Dress dress) {
		this.dress = dress;
	}

	public int getBuynum() {
		return buynum;
	}

	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}

}
