package com.trend.serviceimpl;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.trend.daoimpl.BidDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.Bid;
import com.trend.serviceinf.BidServiceInf;

public class BidServiceImpl implements BidServiceInf {

	private Logger logger = Logger.getLogger(BidServiceImpl.class);
	
	BidDaoImpl bidDaoImpl =  new BidDaoImpl();
	
	public String add(Bid bid) {
		try {
			bidDaoImpl.addBid(bid); 
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
			
		}
		
	}
	
	public String update(Bid bid) {
		try {
			bidDaoImpl.update(bid);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();

		} catch (Exception e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();

		}
	}

	public ArrayList<Bid> retrieve(String bidId) {

		ArrayList<Bid> list = new ArrayList<Bid>();
		try {
			list = bidDaoImpl.retrieve(bidId);
			return list;
		} catch (PersistException e) {
			logger.info(e.toString());
			return list;
		}

	}

	public ArrayList<Bid> retrieveAll() {

		ArrayList<Bid> list = new ArrayList<Bid>();
		try {
			list = bidDaoImpl.retrieveAll();
			return list;
		} catch (PersistException e) {
			logger.info(e.toString());
			return list;
		}

	}




}
