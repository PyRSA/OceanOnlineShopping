package com.summer.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.summer.entity.User;
import com.summer.service.UserService;
import com.summer.util.Unicode;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	// 用于访问主页
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	// 用于登录
	@RequestMapping("/login")
	@ResponseBody
	public Object login(HttpSession session, HttpServletResponse response, String username, String password,
			String autologin) {
		System.out.println("username:" + username + " password:" + password);
		User user = userService.login(username, password);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			// 登录成功,存入cookie，以便下次自动登录
			if (user != null) {
				session.setAttribute("user", user);
				if (autologin.equals("true")) {
					Cookie cookie = new Cookie("user", new Unicode().toCookieUnicode(user.getUsername()) + "=="
							+ new Unicode().toCookieUnicode(user.getPassword()));
					cookie.setPath("/");
					cookie.setMaxAge(1000 * 60 * 60 * 24);// 24小时
					response.addCookie(cookie);
				}
				map.put("state", "true");
				map.put("user", user);
			} else {
				map.put("state", "false");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	// 用于退出登录
	@RequestMapping("/logout")
	public void logout(HttpSession session, HttpServletResponse response) throws IOException, ServletException {

		session.removeAttribute("user");
		// 清除cookie
		Cookie cookie = new Cookie("user", "");
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		response.sendRedirect("index");

	}

}
