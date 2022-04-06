package com.summer.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.summer.entity.Order;
import com.summer.service.OrdersService;

@Controller
public class PayController {

	@Autowired
	private OrdersService orderService;

	public OrdersService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrdersService orderService) {
		this.orderService = orderService;
	}

	@RequestMapping("/pay")
	public ModelAndView pay(int orderid) throws IOException {
		Order order = orderService.findOrderById(orderid);
		order.setPaystate(1);
		orderService.updateOrder(order);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("paysuccess");
		return mv;
	}

}
