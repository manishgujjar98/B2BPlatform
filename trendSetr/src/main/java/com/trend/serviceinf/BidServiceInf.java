package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.models.Bid;

public interface BidServiceInf {
	
	String add(Bid bid);
	
	String update(Bid bid);

	ArrayList<Bid> retrieve(String bidId);

	ArrayList<Bid> retrieveAll();
}
