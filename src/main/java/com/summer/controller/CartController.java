package com.summer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.summer.entity.Cart;
import com.summer.entity.Dress;
import com.summer.entity.User;
import com.summer.service.CartService;
import com.summer.service.DressService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	@Autowired
	private DressService dressService;

	public DressService getDressService() {
		return dressService;
	}

	public void setDressService(DressService dressService) {
		this.dressService = dressService;
	}

	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	@RequestMapping("/addCart")
	@ResponseBody
	public Object addCart(HttpSession session, int dressid, int bookSum) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("user");
		try {
			System.out.println(user.getId());
			Cart cart = cartService.findCart(dressid, user.getId());
			if (cart != null) {
				// 修改数量
				cart.setBooknum(bookSum + cart.getBooknum());
				cartService.updateCart(cart);
			} else {
				cart = new Cart();
				cart.setBooknum(bookSum);
				cart.setUser(user);
				Dress dress = dressService.findDressById(dressid);
				cart.setDress(dress);
				cartService.addCart(cart);
			}
			map.put("msg", "true");
		} catch (Exception e) {
			map.put("msg", "false");
			e.printStackTrace();
		}
		return map;
	}

	@RequestMapping("/findCart")
	public ModelAndView findCart(HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Cart> cartList = cartService.findCartByUserId(user.getId());
		double sum = 0.0;
		for (Cart cart : cartList) {
			sum += cart.getBooknum() * cart.getDress().getPrice();
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("cartlist", cartList);
		mv.addObject("sum", sum);
		mv.addObject("state", false);
		mv.setViewName("cart");
		return mv;
	}

	// 点击”去结算”后获取要结算的Cart的集合,获取总金额，再跳转到dobuy.jsp
	@RequestMapping("/cartToOrder")
	public ModelAndView cartToOrder(HttpSession session, int ids[]) {
		@SuppressWarnings("unused")
		User user = (User) session.getAttribute("user");
		List<Cart> cartlist = new ArrayList<Cart>();
		Cart cart = new Cart();
		double sum = 0.0;
		for (int i = 0; i < ids.length; i++) {
			cart = cartService.findCartByCartId(ids[i]);
			cartlist.add(cart);
			sum += cart.getBooknum() * cart.getDress().getPrice();
		}
		System.out.println(sum);
		ModelAndView mv = new ModelAndView();
		session.setAttribute("cartlist", cartlist);
		session.setAttribute("sum", sum);

		mv.setViewName("dobuy");
		return mv;
	}

	@RequestMapping("/updateCart")
	public void updateCart(HttpSession session, int cartid, int bookSum) {
		@SuppressWarnings("unused")
		User user = (User) session.getAttribute("user");
		Cart cart = new Cart();
		cart.setId(cartid);
		cart.setBooknum(bookSum);
		cartService.updateCart(cart);
	}

	@RequestMapping("/removeCart")
	@ResponseBody
	public Object removeCart(HttpSession session, int cartid) {
		@SuppressWarnings("unused")
		User user = (User) session.getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			cartService.removeCart(cartid);
			map.put("state", "true");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("state", "false");
		}
		return map;
	}

	@RequestMapping("/removeCartAll")
	@ResponseBody
	public Object removeCartAll(HttpSession session, int[] id) {
		@SuppressWarnings("unused")
		User user = (User) session.getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			for (int i = 0; i < id.length; i++) {
				cartService.removeCart(id[i]);
			}
			map.put("state", "true");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("state", "false");
		}
		return map;
	}

}
