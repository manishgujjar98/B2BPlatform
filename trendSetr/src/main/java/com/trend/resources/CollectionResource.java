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
import com.trend.models.Collection;
import com.trend.serviceimpl.CollectionServiceImpl;

@Path("/collections")
public class CollectionResource {

	CollectionServiceImpl collectionServiceImpl =  new CollectionServiceImpl();
	
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String addUser(Collection collection) {
		return collectionServiceImpl.add(collection);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateCollection(Collection collection) {
		return collectionServiceImpl.update(collection);
	}


	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Collection> retrieveCategory(@PathParam("id") String collectionId) throws PersistException {

		return collectionServiceImpl.retrieve(collectionId);

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Collection> retrieveAllCategory() throws PersistException {

		return collectionServiceImpl.retrieveAll();

	}
	
	
}
