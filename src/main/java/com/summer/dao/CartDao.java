package com.summer.dao;

import java.util.List;

import com.summer.entity.Cart;

public interface CartDao {

	// 获取某个用户的所有购物车
	public List<Cart> findCartByUserId(int userid);

	// 获取用户的某个商品的购物车
	public Cart findCart(int dressid, int userid);

	// 以购物车id寻找商品
	public Cart findCartByCartId(int id);

	// 删除单个
	public void removeCart(int id);

	// 添加到购物车
	public void addCart(Cart cart);

	// 修改购物车服装数量
	public void updateCart(Cart cart);

}
