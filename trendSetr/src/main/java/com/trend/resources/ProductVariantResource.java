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
import com.trend.models.ProductVariant;
import com.trend.serviceimpl.ProductVariantServiceImpl;

@Path("/productvariants")
public class ProductVariantResource {

	ProductVariantServiceImpl productVariantServiceImpl = new ProductVariantServiceImpl();

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String addProductVariant(ProductVariant productVariant) throws PersistException {
		return productVariantServiceImpl.add(productVariant);

	}
	
	
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateProductVariant(ProductVariant productVariant) throws PersistException {
		return productVariantServiceImpl.update(productVariant);

	}
	
	
	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<ProductVariant> retrieveProductVariant(@PathParam("id") String productVariantId) throws PersistException {
		return productVariantServiceImpl.retrieve(productVariantId);

	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<ProductVariant> retrieveAllProductVariant() throws PersistException {
		return productVariantServiceImpl.retrieveAll();

	}

}
