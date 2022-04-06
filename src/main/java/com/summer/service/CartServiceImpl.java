package com.summer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.dao.CartDao;
import com.summer.entity.Cart;

@Service("cartService")
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cartDao;

	public CartDao getCartDao() {
		return cartDao;
	}

	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public List<Cart> findCartByUserId(int id) {
		// TODO Auto-generated method stub
		return cartDao.findCartByUserId(id);
	}

	@Override
	public Cart findCart(int products_id, int user_id) {
		// TODO Auto-generated method stub
		return cartDao.findCart(products_id, user_id);
	}

	@Override
	public void removeCart(int id) {
		cartDao.removeCart(id);

	}

	@Override
	public void addCart(Cart cart) {
		cartDao.addCart(cart);

	}

	@Override
	public Cart findCartByCartId(int id) {
		// TODO Auto-generated method stub
		return cartDao.findCartByCartId(id);
	}

	@Override
	public void updateCart(Cart cart) {
		cartDao.updateCart(cart);

	}

}
