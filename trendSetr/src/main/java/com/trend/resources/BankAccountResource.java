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

import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.BankAccount;
import com.trend.serviceimpl.BankAccountServiceImpl;



@Path("/bankaccounts")
public class BankAccountResource {
	BankAccountServiceImpl bankAccountServiceImpl = new BankAccountServiceImpl();

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MessageEnum addBankAccount(BankAccount bankAccount) throws PersistException {
		System.out.println("Add Bank Acc");
		return bankAccountServiceImpl.add(bankAccount);

	}

	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateBankAccount(BankAccount bankAccount) throws PersistException {

		return bankAccountServiceImpl.update(bankAccount);

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<BankAccount> retrieveAllBankAccount() throws PersistException {

		return bankAccountServiceImpl.retrieveAll();

	}

	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ArrayList<BankAccount> retrieveBankAccount(@PathParam("id") String bankAccountId) throws PersistException {

		return bankAccountServiceImpl.retrieve(bankAccountId);

	}

}
