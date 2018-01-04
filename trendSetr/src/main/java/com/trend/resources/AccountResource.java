package com.trend.resources;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.trend.models.AccountSettings;
import com.trend.serviceimpl.AccountServiceImpl;

@Path("/account")
public class AccountResource {
	AccountServiceImpl accountService = new AccountServiceImpl();
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String addAccount(AccountSettings accountSettings){
		System.out.println("TEST Account Settings");
		accountService.addAccount(accountSettings);
		return "Success";
	}

}
