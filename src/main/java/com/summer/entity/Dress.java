package com.summer.entity;

import java.io.Serializable;

public class Dress implements Serializable {

	private static final long serialVersionUID = 8643930429795668297L;

	private int dressid;
	private String dressname;
	private double price;
	private String category;
	private int quantity;
	private String imgurl;
	private String description;
	private int sales;

	public int getDressid() {
		return dressid;
	}

	public void setDressid(int dressid) {
		this.dressid = dressid;
	}

	public String getDressname() {
		return dressname;
	}

	public void setDressname(String dressname) {
		this.dressname = dressname;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

}
