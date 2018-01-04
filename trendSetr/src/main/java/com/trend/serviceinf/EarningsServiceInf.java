package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.models.Earnings;

public interface EarningsServiceInf {
	
	String add(Earnings earnings);

	String update(Earnings earnings);

	ArrayList<Earnings> retrieve(String earningId);

	ArrayList<Earnings> retrieveAll();


}
