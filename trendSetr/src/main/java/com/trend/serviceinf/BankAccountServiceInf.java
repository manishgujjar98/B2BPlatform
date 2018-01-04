package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.enums.MessageEnum;
import com.trend.models.BankAccount;

public interface BankAccountServiceInf {
	
	MessageEnum add(BankAccount bankAccount);

	String update(BankAccount bankAccount);

	ArrayList<BankAccount> retrieve(String bankAccountId);

	ArrayList<BankAccount> retrieveAll();

}
