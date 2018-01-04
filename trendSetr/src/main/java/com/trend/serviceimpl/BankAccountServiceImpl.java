package com.trend.serviceimpl;

import java.util.ArrayList;
import org.apache.log4j.Logger;
import com.trend.daoimpl.BankAccountDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.BankAccount;
import com.trend.serviceinf.BankAccountServiceInf;

public class BankAccountServiceImpl implements BankAccountServiceInf {
	private Logger logger = Logger.getLogger(BankAccountServiceImpl.class);
	BankAccountDaoImpl bankAccountDaoImpl = new BankAccountDaoImpl();

	public MessageEnum add(BankAccount bankAccount) {
		try{
			bankAccountDaoImpl.add(bankAccount);
			return MessageEnum.MESSAGE_SUCCESS;
		}catch(PersistException e){
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR;
		}

	}

	public String update(BankAccount bankAccount) {
		
		try{
			bankAccountDaoImpl.update(bankAccount);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		}catch(PersistException e){
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}

	}

	public ArrayList<BankAccount> retrieve(String bankAccountId) {
		ArrayList<BankAccount> list = new ArrayList<BankAccount>();
		try{
			list = bankAccountDaoImpl.retrieve(bankAccountId);
			return list;
		}catch(PersistException e){
			logger.info(e.toString());
			return list;
		}

	}

	public ArrayList<BankAccount> retrieveAll() {
		
		ArrayList<BankAccount> list = new ArrayList<BankAccount>();
		try{
			list = bankAccountDaoImpl.retrieveAll();
			return list;
		}catch(PersistException e){
			logger.info(e.toString());
			return list;
		}

	}

}
