package com.summer.service;

import com.summer.entity.Dress;
import com.summer.entity.PageBean;

public interface DressService {
	// 以id获取服装
	public Dress findDressById(int id);

	// 获取所有服装并分页
	public PageBean findDressPage(int currentPage, int pageSize, String dressname, String category, double minprice,
			double maxprice);

	public void updateDress(Dress dress);

}
