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
import com.trend.models.Transactions;
import com.trend.serviceimpl.TransactionServiceImpl;

public class TransactionResource {
	
	
	TransactionServiceImpl transactionServiceImpl = new TransactionServiceImpl();

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String addTransaction(Transactions transactions) throws PersistException {
		return transactionServiceImpl.add(transactions);
	}

	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateMerchant(Transactions transactions) throws PersistException {

		return transactionServiceImpl.update(transactions);

	}

	@POST
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Transactions> retrieveTransaction(@PathParam("id") String transactionId) throws PersistException {

		return transactionServiceImpl.retrieve(transactionId);

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Transactions> retrieveAllMerchant() throws PersistException {
		return transactionServiceImpl.retrieveAll();
	}


}
