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
import com.trend.models.PaymentType;
import com.trend.serviceimpl.PaymentTypeServiceImpl;

@Path("/paymenttypes")
public class PaymentTypeResource {
	PaymentTypeServiceImpl paymentTypeServiceImpl = new PaymentTypeServiceImpl();

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String addPaymentType(PaymentType paymentType) throws PersistException {

		return paymentTypeServiceImpl.add(paymentType);

	}

	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String updatePaymentType(PaymentType paymentType) throws PersistException {

		return paymentTypeServiceImpl.update(paymentType);

	}

	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<PaymentType> retrievePaymentType(@PathParam("id") String paymentTypeId) throws PersistException {

		return paymentTypeServiceImpl.retrieve(paymentTypeId);

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<PaymentType> retrieveAllPaymentType() throws PersistException {

		return paymentTypeServiceImpl.retrieveAll();

	}

}
