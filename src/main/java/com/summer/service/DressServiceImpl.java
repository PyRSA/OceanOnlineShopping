package com.summer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.dao.DressDao;
import com.summer.entity.Dress;
import com.summer.entity.DressCondition;
import com.summer.entity.PageBean;

@Service("dressService")
public class DressServiceImpl implements DressService {
	@Autowired
	private DressDao dressDao;

	public DressDao getDressDao() {
		return dressDao;
	}

	public void setDressDao(DressDao dressDao) {
		this.dressDao = dressDao;
	}

	@Override
	public Dress findDressById(int id) {
		return dressDao.findDressById(id);
	}

	@Override
	public PageBean findDressPage(int currentPage, int pageSize, String dressname, String category, double minprice,
			double maxprice) {
		PageBean pb = new PageBean();
		pb.setCurrentPage(currentPage);
		pb.setPageSize(pageSize);
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("dressname", dressname);
			map.put("category", category);
			map.put("minprice", minprice);
			map.put("maxprice", maxprice);
			int count = dressDao.findDressCount(map);// 得到总记录数
			pb.setCount(count);
			int totalPage = (int) Math.ceil(count * 1.0 / pageSize); // 求出总页数
			pb.setTotalPage(totalPage);
			map.put("startRow", (currentPage - 1) * pageSize);
			map.put("pageSize", pageSize);
			List<Dress> dresses = dressDao.findDressPage(map);
			pb.setDresses(dresses);
			DressCondition dressCondition = new DressCondition(dressname, minprice, maxprice, category);
			System.out.println("dressCondition里面的category:" + dressCondition.getCategory());
			pb.setDressCondition(dressCondition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pb;

	}

	@Override
	public void updateDress(Dress dress) {
		dressDao.updateDress(dress);

	}
}
