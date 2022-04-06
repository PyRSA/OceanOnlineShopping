package com.summer.entity;

import java.io.Serializable;

public class Cart implements Serializable {

	private static final long serialVersionUID = -1100631021984688987L;

	private int id;
	private User user;
	private Dress dress;
	private int booknum;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Dress getDress() {
		return dress;
	}

	public void setDress(Dress dress) {
		this.dress = dress;
	}

	public int getBooknum() {
		return booknum;
	}

	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
}
