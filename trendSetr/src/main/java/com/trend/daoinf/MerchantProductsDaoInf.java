package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.MerchantProducts;

public interface MerchantProductsDaoInf {
	
	public void add(MerchantProducts merchantProducts) throws PersistException;

//	public void update(MerchantProducts merchantProducts) throws PersistException;

	public ArrayList<MerchantProducts> retrieve(MerchantProducts merchantProducts) throws PersistException;

	public ArrayList<MerchantProducts> retrieveAll() throws PersistException;

}
