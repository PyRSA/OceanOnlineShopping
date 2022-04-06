package com.summer.entity;

import java.io.Serializable;

public class DressCondition implements Serializable {

	private static final long serialVersionUID = 6950777891059126401L;

	private String dressname;
	private double minprice;
	private double maxprice;
	private String category;

	public DressCondition() {
	}

	public DressCondition(String dressname, double minprice, double maxprice, String category) {
		super();

		this.dressname = dressname;
		this.minprice = minprice;
		this.maxprice = maxprice;
		this.category = category;
	}

	public String getDressname() {
		return dressname;
	}

	public void setDressname(String dressname) {
		this.dressname = dressname;
	}

	public double getMinprice() {
		return minprice;
	}

	public void setMinprice(double minprice) {
		this.minprice = minprice;
	}

	public double getMaxprice() {
		return maxprice;
	}

	public void setMaxprice(double maxprice) {
		this.maxprice = maxprice;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
