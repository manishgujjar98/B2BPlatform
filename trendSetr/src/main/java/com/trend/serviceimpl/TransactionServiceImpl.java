package com.trend.serviceimpl;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.trend.daoimpl.TransactionDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.Transactions;
import com.trend.serviceinf.TransactionServiceInf;

public class TransactionServiceImpl implements TransactionServiceInf {
	TransactionDaoImpl transactionDaoImpl = new TransactionDaoImpl();
	private Logger logger = Logger.getLogger(TransactionServiceImpl.class);

	public String add(Transactions transactions) {
		try{
			transactionDaoImpl.add(transactions);
		return MessageEnum.MESSAGE_SUCCESS.getMessage();
	}catch(PersistException e){
		logger.info(e.toString());
		return MessageEnum.MESSAGE_FAILUR.getMessage();
	}
		}

	public String update(Transactions transactions) {
		try{
			transactionDaoImpl.update(transactions);
		return MessageEnum.MESSAGE_SUCCESS.getMessage();
	}catch(PersistException e){
		logger.info(e.toString());
		return MessageEnum.MESSAGE_FAILUR.getMessage();
	}
	}

	public ArrayList<Transactions> retrieve(String transactionId) {
		ArrayList<Transactions> list = new ArrayList<Transactions>();
		try{
			transactionDaoImpl.retrieve(transactionId);
		return list;
	}catch(PersistException e){
		logger.info(e.toString());
		return list;
	}
	}

	public ArrayList<Transactions> retrieveAll() {
	
		ArrayList<Transactions> list = new ArrayList<Transactions>();
		try{
			transactionDaoImpl.retrieveAll();
		return list;
	}catch(PersistException e){
		logger.info(e.toString());
		return list;
	}
	}

}
