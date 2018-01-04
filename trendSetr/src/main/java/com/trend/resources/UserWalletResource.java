package com.trend.resources;

import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.trend.exceptions.PersistException;
import com.trend.models.UserWallet;
import com.trend.serviceimpl.UserWalletServiceImpl;
@Path("/userwallets")
public class UserWalletResource {

	
UserWalletServiceImpl userWalletServiceImpl = new UserWalletServiceImpl();
	
	
	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<UserWallet> retrieveUserWallet(@PathParam("id") String userWalletId) throws PersistException {

		return userWalletServiceImpl.retrieve(userWalletId);

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<UserWallet> retrieveAllUserWallet() throws PersistException {
		return userWalletServiceImpl.retrieveAll();
	}

}
