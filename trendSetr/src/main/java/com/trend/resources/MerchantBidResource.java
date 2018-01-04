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
import com.trend.models.MerchantBid;
import com.trend.serviceimpl.MerchantBidServiceImpl;

public class MerchantBidResource {
	
	MerchantBidServiceImpl merchantBidServiceImpl = new MerchantBidServiceImpl();
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String addMerchantBid(MerchantBid merchantBid) throws PersistException {
		return merchantBidServiceImpl.add(merchantBid);
	}

	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateMerchantBid(MerchantBid merchantBid) throws PersistException {
		return merchantBidServiceImpl.update(merchantBid);
	}

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<MerchantBid> retrieveAllMerchantBid() throws PersistException {
		return merchantBidServiceImpl.retrieveAll();
	}
	
	
	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<MerchantBid> retrieveMerchantBid(@PathParam("id") String merchantBidId) throws PersistException {
		return merchantBidServiceImpl.retrieve(merchantBidId);

	}


}
