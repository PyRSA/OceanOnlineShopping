package com.summer.service;

import java.util.List;

import com.summer.entity.Comment;

public interface CommentService {
	public List<Comment> findComment(int dressid);
}
