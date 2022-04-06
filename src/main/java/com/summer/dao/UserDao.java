package com.summer.dao;

import com.summer.entity.User;

public interface UserDao {
	// 以用户名及密码寻找用户
	public User findUser(String username, String password);
}
