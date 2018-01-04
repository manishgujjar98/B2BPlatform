package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.models.UserWallet;

public interface UserWalletServiceInf {
	
	ArrayList<UserWallet> retrieve(String userWalletId);

	ArrayList<UserWallet> retrieveAll();

}
