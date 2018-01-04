package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.Bid;

public interface BidDaoInf {
	
	public void addBid(Bid bid) throws PersistException;
	
	public void update(Bid bid) throws PersistException;

	public ArrayList<Bid> retrieve(String bidId) throws PersistException;

	public ArrayList<Bid> retrieveAll() throws PersistException;
}
