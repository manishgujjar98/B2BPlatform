package com.trend.resources;

import java.util.ArrayList;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.trend.exceptions.PersistException;
import com.trend.models.MerchantProducts;
import com.trend.serviceimpl.MerchantProductsServiceImpl;

@Path("/merchantproducts")
public class MerchantProductsResource {
	
	
	MerchantProductsServiceImpl merchantProductsServiceImpl = new MerchantProductsServiceImpl();
	
	
	@GET
	@Path("/retrievemerchantproducts")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ArrayList<MerchantProducts> retrieveMerchantProducts(MerchantProducts merchantProducts) throws PersistException {

		return merchantProductsServiceImpl.retrieve(merchantProducts);

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<MerchantProducts> retrieveAllMerchantProducts() throws PersistException {
		return merchantProductsServiceImpl.retrieveAll();
	}

}
