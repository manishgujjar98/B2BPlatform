package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.models.Transactions;

public interface TransactionServiceInf {
	
	String add(Transactions tansactions);

	String update(Transactions tansactions);

	ArrayList<Transactions> retrieve(String tansactionId);

	ArrayList<Transactions> retrieveAll();


}
