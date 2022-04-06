package com.summer.service;

import java.util.List;

import com.summer.entity.Cart;

public interface CartService {

	// 获取用户的所有购物车
	public List<Cart> findCartByUserId(int userid);

	// 寻找购物车
	public Cart findCart(int dressid, int userid);

	// 以购物车id查的购物车
	public Cart findCartByCartId(int id);

	// 删除单个购物车
	public void removeCart(int id);

	// 添加到购物车
	public void addCart(Cart cart);

	// 修改购物车服装数量
	public void updateCart(Cart cart);

}
