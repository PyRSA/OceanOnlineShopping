package com.summer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.summer.entity.Comment;
import com.summer.entity.Dress;
import com.summer.entity.PageBean;
import com.summer.service.CommentService;
import com.summer.service.DressService;

@Controller
public class DressController {
	@Autowired
	private DressService dressService;

	public DressService getDressService() {
		return dressService;
	}

	public void setDressService(DressService dressService) {
		this.dressService = dressService;
	}

	@Autowired
	private CommentService commentService;

	public CommentService getCommentService() {
		return commentService;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	@RequestMapping("/page")
	public ModelAndView page(int currentPage, String dressname, String category, double minprice, double maxprice) {
		ModelAndView mv = new ModelAndView();
		// 分页查询，并返回PageBean对象
		try {
			int pageSize = 4;// 暂定每页显示4条
			PageBean pb = dressService.findDressPage(currentPage, pageSize, dressname, category, minprice, maxprice);
			mv.addObject("pb", pb);
			mv.setViewName("list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/showDress")
	public ModelAndView showDress(int id) {
		ModelAndView mv = new ModelAndView();
		Dress dress = dressService.findDressById(id);
		List<Comment> evlist = commentService.findComment(id);
		mv.addObject("dress", dress);
		mv.addObject("evlist", evlist);
		mv.setViewName("dress");
		return mv;
	}

}
