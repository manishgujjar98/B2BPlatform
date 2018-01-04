package com.trend.serviceimpl;

import com.trend.daoimpl.AccountDaoImpl;
import com.trend.exceptions.PersistException;
import com.trend.models.AccountSettings;

public class AccountServiceImpl {
	
	AccountDaoImpl accountDao = new AccountDaoImpl();

	public String addAccount(AccountSettings accountSettings) {
		try {
			accountDao.addAccount(accountSettings);
		} catch (PersistException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

}
