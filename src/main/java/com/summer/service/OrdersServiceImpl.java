package com.summer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.summer.dao.OrdersDao;
import com.summer.entity.Order;
import com.summer.entity.OrderItem;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersService {
	@Autowired
	private OrdersDao ordersDao;

	public OrdersDao getOrdersDao() {
		return ordersDao;
	}

	public void setOrdersDao(OrdersDao ordersDao) {
		this.ordersDao = ordersDao;
	}

	@Override
	public void updateOrder(Order order) {
		ordersDao.updateOrder(order);
	}

	@Override
	public void addOrder(Order order) {
		ordersDao.addOrder(order);
	}

	@Override
	public void addOrderItem(OrderItem orderItem) {
		ordersDao.addOrderItem(orderItem);
	}

	@Override
	public Order findOrderById(int id) {
		return ordersDao.findOrderById(id);
	}

}
