package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.UserWallet;

public interface UserWalletDaoInf {
	
	public void addUpdate(String userId,Double earningAmount,String id) throws PersistException;

	public ArrayList<UserWallet> retrieve(String userWalletId) throws PersistException;

	public ArrayList<UserWallet> retrieveAll() throws PersistException;
	

}
