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
import com.trend.models.Bid;
import com.trend.serviceimpl.BidServiceImpl;


@Path("/biding")
public class BidResource {

	BidServiceImpl bidServiceImpl =new BidServiceImpl();
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String addBid(Bid bid) {
		return bidServiceImpl.add(bid);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateBid(Bid bid) throws PersistException {

		return bidServiceImpl.update(bid);

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Bid> retrieveAllBid() throws PersistException {

		return bidServiceImpl.retrieveAll();

	}

	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ArrayList<Bid> retrieveBid(@PathParam("id") String bidId) throws PersistException {

		return bidServiceImpl.retrieve(bidId);

	}
	
}
