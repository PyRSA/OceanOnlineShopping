package com.summer.service;

import com.summer.entity.User;

public interface UserService {

	// 用户登录
	public User login(String username, String password);

}
