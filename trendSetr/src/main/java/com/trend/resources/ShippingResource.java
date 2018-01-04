package com.trend.resources;

import java.util.ArrayList;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.trend.exceptions.PersistException;
import com.trend.models.Shipping;
import com.trend.models.ShippingBean;
import com.trend.serviceimpl.MerchantServiceImpl;

@Path("/shipping")
public class ShippingResource {
	
	MerchantServiceImpl merchantService = new MerchantServiceImpl();
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/addMerchantShippingDetails")
	public String addShipping(ShippingBean shippingBean){
		System.out.println("TEST Shipping Settings");
		merchantService.addShippingMerchantDetails(shippingBean);
		return "Success";
	}
	
	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ShippingBean retrieveAllShippingData(@PathParam("id") String userId) throws PersistException {
		System.out.println("***********  "+userId);
		return merchantService.retrieveMerShipDetails(userId);
	}
	
	@GET
	@Path("{orderSize}/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Shipping> retrieveAllShippingSizes(@PathParam("id") String userId) throws PersistException {
		System.out.println("***********  "+userId);
		return merchantService.retrieveAllShippingSizes(userId);
	}
	
	@PUT
	@Path("/updateMSdetails")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateShipping(ShippingBean shippingBean){
		System.out.println("TEST Shipping Settings");
		merchantService.updateShippingMerchantDetails(shippingBean);
		return "Success";
	}
	
	

}
