package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.models.Orders;

public interface OrderServiceInf {

	ArrayList<Orders> retrieveOrders(String merchantId);


}
