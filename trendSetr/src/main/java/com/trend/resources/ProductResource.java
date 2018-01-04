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

import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.Category;
import com.trend.models.Product;
import com.trend.serviceimpl.ProductServiceImpl;

@Path("/products")
public class ProductResource {

	ProductServiceImpl productServiceImpl = new ProductServiceImpl();

	@POST
	@Path("/addproduct")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MessageEnum addProduct(Product product) throws PersistException{
		System.out.println("ADD PRODUCT : "+ product.getProductVariantList().toString());
		return productServiceImpl.add(product);

	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MessageEnum updateProduct(Product product) throws PersistException {

		return productServiceImpl.update(product);
	}
	
	@GET
	@Path("{product}/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Product> retrieveProduct(@PathParam("id") String productId) throws PersistException {
		return productServiceImpl.retrieve(productId);

	}

	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Product> retrieveAllProduct(@PathParam("id") String userId) throws PersistException {
		System.out.println("***********  "+userId);
		return productServiceImpl.retrieveAll(userId);
	}
	
	@GET
	@Path("{product}/{category}/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Category> retrieveGenderCategory(@PathParam("id") String genderID) throws PersistException {
		return productServiceImpl.retrieveGenderCategory(genderID);

	}
	
}
