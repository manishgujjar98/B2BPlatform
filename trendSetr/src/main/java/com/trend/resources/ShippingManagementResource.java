package com.trend.resources;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.trend.models.Address;

@Path("/address")
public class ShippingManagementResource {
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("validate")
	public String addAccount(Address address){
		return "Success";
	}

}
