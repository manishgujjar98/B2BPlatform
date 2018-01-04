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
import com.trend.models.Earnings;
import com.trend.serviceimpl.EarningsServiceImpl;

@Path("/earnings")
public class EarningsResource {

	EarningsServiceImpl earningsServiceImpl = new EarningsServiceImpl();

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String addEarnings(Earnings earnings) throws PersistException {

		return earningsServiceImpl.add(earnings);

	}

	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateEarnings(Earnings earnings) throws PersistException {

		return earningsServiceImpl.update(earnings);

	}

	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Earnings> retrieveEarnings(@PathParam("id") String earningId) throws PersistException {

		return earningsServiceImpl.retrieve(earningId);

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Earnings> retrieveAllEarnings() throws PersistException {

		return earningsServiceImpl.retrieveAll();

	}
}
