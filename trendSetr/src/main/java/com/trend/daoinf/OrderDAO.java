package com.trend.daoinf;

import java.util.List;

import com.trend.exceptions.PersistException;
import com.trend.models.Orders;


public interface OrderDAO {

	public List<Orders> getOrders(String userID) throws PersistException;

}
