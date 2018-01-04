package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.BankAccount;

public interface BankAccountDaoInf {
	
	public void add(BankAccount bankAccount) throws PersistException;

	public void update(BankAccount bankAccount) throws PersistException;

	public ArrayList<BankAccount> retrieve(String bankAccountId) throws PersistException;

	public ArrayList<BankAccount> retrieveAll() throws PersistException;
	

}
