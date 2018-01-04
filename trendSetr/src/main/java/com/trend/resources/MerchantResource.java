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
import com.trend.models.Merchant;
import com.trend.serviceimpl.MerchantServiceImpl;

@Path("/merchants")
public class MerchantResource {

	MerchantServiceImpl merchantServiceImpl = new MerchantServiceImpl();

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String addMerchant(Merchant merchant) throws PersistException {
		return merchantServiceImpl.add(merchant);
	}

	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateMerchant(Merchant merchant) throws PersistException {

		return merchantServiceImpl.update(merchant);

	}

	@POST
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Merchant> retrieveMerchant(@PathParam("id") String merchantId) throws PersistException {

		return merchantServiceImpl.retrieve(merchantId);

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Merchant> retrieveAllMerchant() throws PersistException {
		return merchantServiceImpl.retrieveAll();
	}

}
