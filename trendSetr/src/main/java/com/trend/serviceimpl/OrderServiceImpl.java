package com.trend.serviceimpl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.trend.daoimpl.AddressDaoImpl;
import com.trend.daoimpl.OrderDaoImpl;
import com.trend.models.Orders;
import com.trend.serviceinf.OrderServiceInf;

public class OrderServiceImpl implements OrderServiceInf {

	private Logger logger = Logger.getLogger(OrderServiceImpl.class);
	AddressDaoImpl addressDaoImpl = new AddressDaoImpl();
	OrderDaoImpl orderDaoImpl = new OrderDaoImpl();

	public ArrayList<Orders> retrieveOrders(String merchanId) {
		ArrayList<Orders> list = new ArrayList<Orders>();
		list = orderDaoImpl.getOrders(merchanId);
		return list;
	}

	public List<Orders> retrieveOrder(String orderId) {

		List<Orders> list = new ArrayList<Orders>();
		list = orderDaoImpl.getOrder(orderId);
		return list;
	}

}
