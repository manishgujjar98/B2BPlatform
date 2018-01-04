package com.trend.serviceimpl;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.trend.daoimpl.UserWalletDaoImpl;
import com.trend.exceptions.PersistException;
import com.trend.models.UserWallet;
import com.trend.serviceinf.UserWalletServiceInf;

public class UserWalletServiceImpl implements UserWalletServiceInf {

	UserWalletDaoImpl userWalletDaoImpl = new UserWalletDaoImpl();
	private Logger logger = Logger.getLogger(UserWalletServiceImpl.class);
	
	public ArrayList<UserWallet> retrieve(String userWalletId) {
		ArrayList<UserWallet> list = new ArrayList<UserWallet>();
		try{
		list = userWalletDaoImpl.retrieve(userWalletId);
		return list;
	  }catch(PersistException e){
		  logger.info(e.toString());
		  return list;
	  }
	}

	public ArrayList<UserWallet> retrieveAll() {
		
		ArrayList<UserWallet> list = new ArrayList<UserWallet>();
		try{
		list = userWalletDaoImpl.retrieveAll();
		return list;
	  }catch(PersistException e){
		  logger.info(e.toString());
		  return list;
	  }
	}

}
