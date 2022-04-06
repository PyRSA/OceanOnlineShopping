package com.summer.dao;

import com.summer.entity.Order;
import com.summer.entity.OrderItem;

public interface OrdersDao {

	// 改变订单状态-管理员
	public void updateOrder(Order order);

	// 新建订单
	public void addOrder(Order order);

	// 新建订单明细项
	public void addOrderItem(OrderItem orderItem);

	// 订单id寻找
	public Order findOrderById(int id);

}
