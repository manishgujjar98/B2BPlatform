package com.trend.resources;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.trend.models.Orders;
import com.trend.serviceimpl.OrderServiceImpl;
import com.trend.serviceimpl.ProductServiceImpl;

@Path("/order")
public class OrderResource {

	ProductServiceImpl productServiceImpl = new ProductServiceImpl();
	OrderServiceImpl orderServiceImpl = new OrderServiceImpl();

	
	@GET
	@Path("{marchantId}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Orders> retrieveOrders(@PathParam("marchantId") String marchantId) {
		System.out.println("Order List Data");
		return orderServiceImpl.retrieveOrders(marchantId);
	}
	
	@GET
	 @Path("{orderInfo}/{orderId}")
	 @Produces(MediaType.APPLICATION_JSON)
	 public List<Orders> retrieveOrder(@PathParam("orderId") String orderId) {
	  System.out.println("Order Data");
	  return orderServiceImpl.retrieveOrder(orderId);
	 }

}
