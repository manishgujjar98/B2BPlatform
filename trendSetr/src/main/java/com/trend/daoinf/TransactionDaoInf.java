package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.Transactions;

public interface TransactionDaoInf {
	
	public void add(Transactions transctions) throws PersistException;

	public void update(Transactions transctions) throws PersistException;

	public ArrayList<Transactions> retrieve(String transactionId) throws PersistException;

	public ArrayList<Transactions> retrieveAll() throws PersistException;


}
