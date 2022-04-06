package com.summer.dao;

import java.util.List;
import java.util.Map;

import com.summer.entity.Dress;

public interface DressDao {
	// 以id获取服装
	public Dress findDressById(int id);

	// 获取所有时装并分页
	public List<Dress> findDressPage(Map<String, Object> map);

	public void updateDress(Dress dress);

	public int findDressCount(Map<String, Object> map);

}
