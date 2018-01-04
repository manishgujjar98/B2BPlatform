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

import org.codehaus.jettison.json.JSONException;

import com.trend.enums.MessageEnum;
import com.trend.models.Address;
import com.trend.serviceimpl.AddressServiceImpl;

@Path("/addresses")
public class AddressResource {

	AddressServiceImpl addressServiceImpl = new AddressServiceImpl();

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MessageEnum addAddress(Address address) throws JSONException  {
		return addressServiceImpl.add(address);
	}

	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateAddress(Address address)  {
		return addressServiceImpl.update(address);
	}

	
	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Address> retrieveAddress(@PathParam("id") String addressId) {
		return addressServiceImpl.retrieve(addressId);

	}
	
	@GET
	@Path("{address}/{userId}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Address> retrieveAllAddress(@PathParam("userId") String userId)  {
		return addressServiceImpl.retrieveAll(userId);
	}
	
	@GET
	@Path("{address}/{deleteList}/{aIdList}")
	@Produces(MediaType.APPLICATION_JSON)
	public MessageEnum deleteAddress(@PathParam("aIdList") String aIdList) {
		System.out.println("DELETE Address List ID's : "+ aIdList );
		return addressServiceImpl.delete(aIdList);

	}


}
