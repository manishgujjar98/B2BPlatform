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
import com.trend.models.Category;
import com.trend.serviceimpl.CategoryServiceImpl;

@Path("/categories")
public class CategoryResource {
	CategoryServiceImpl categoryServiceImpl = new CategoryServiceImpl();

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String addCategory(Category category) throws PersistException {

		return categoryServiceImpl.add(category);

	}

	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateCategory(Category category) throws PersistException {

		return categoryServiceImpl.update(category);

	}

	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Category> retrieveCategory(@PathParam("id") String categoryName) throws PersistException {

		return categoryServiceImpl.retrieve(categoryName);

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Category> retrieveAllCategory() throws PersistException {

		return categoryServiceImpl.retrieveAll();

	}

}
