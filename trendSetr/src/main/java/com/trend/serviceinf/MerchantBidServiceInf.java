package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.models.MerchantBid;

public interface MerchantBidServiceInf {

	String add(MerchantBid merchantBid);

	String update(MerchantBid merchantBid);

	ArrayList<MerchantBid> retrieve(String merchantBidId);

	ArrayList<MerchantBid> retrieveAll();
	
}
