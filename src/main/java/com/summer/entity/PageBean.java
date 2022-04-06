package com.summer.entity;

import java.util.List;

public class PageBean {
	private int currentPage;
	private int pageSize;
	private int count;
	private int totalPage;
	private List<Dress> dresses;
	// 封装查询条件
	private DressCondition dressCondition;

	public List<Dress> getDresses() {
		return dresses;
	}

	public void setDresses(List<Dress> dresses) {
		this.dresses = dresses;
	}

	public DressCondition getDressCondition() {
		return dressCondition;
	}

	public void setDressCondition(DressCondition dressCondition) {
		this.dressCondition = dressCondition;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

}
