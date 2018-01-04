package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.Earnings;

public interface EarningsDaoInf {
	
	public void add(Earnings earnings) throws PersistException;

	public void update(Earnings earnings) throws PersistException;

	public ArrayList<Earnings> retrieve(String earningId) throws PersistException;

	public ArrayList<Earnings> retrieveAll() throws PersistException;
	

}
