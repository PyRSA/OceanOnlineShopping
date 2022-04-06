package com.summer.service;

import com.summer.entity.Order;
import com.summer.entity.OrderItem;

public interface OrdersService {

	// 改变订单状态
	public void updateOrder(Order order);

	// 新建订单
	public void addOrder(Order order);

	// 新建订单项
	public void addOrderItem(OrderItem orderItem);

	// 订单id寻找
	public Order findOrderById(int id);
}
