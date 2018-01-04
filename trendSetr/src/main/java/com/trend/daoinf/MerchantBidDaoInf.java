package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.MerchantBid;

public interface MerchantBidDaoInf {

	
	public void add(MerchantBid merchantBid) throws PersistException;

	public void update(MerchantBid merchantBid) throws PersistException;

	public ArrayList<MerchantBid> retrieve(String merchantBidId) throws PersistException;

	public ArrayList<MerchantBid> retrieveAll() throws PersistException;
}
