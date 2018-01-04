package com.trend.serviceimpl;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.trend.daoimpl.MerchantBidDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.MerchantBid;
import com.trend.serviceinf.MerchantBidServiceInf;

public class MerchantBidServiceImpl implements MerchantBidServiceInf {
	private Logger logger = Logger.getLogger(MerchantBidServiceImpl.class);
	MerchantBidDaoImpl merchantBidDaoImpl = new MerchantBidDaoImpl();

	public String add(MerchantBid merchantBid) {
		try {
			merchantBidDaoImpl.add(merchantBid);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	public String update(MerchantBid merchantBid) {
		try {
			merchantBidDaoImpl.update(merchantBid);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	public ArrayList<MerchantBid> retrieve(String merchantBidId) {
		ArrayList<MerchantBid> list = new ArrayList<MerchantBid>();
		try {
			list = merchantBidDaoImpl.retrieve(merchantBidId);
			return list;
		} catch (PersistException e) {
			logger.info(e.toString());
			return list;
		}
	}

	public ArrayList<MerchantBid> retrieveAll() {
		ArrayList<MerchantBid> list = new ArrayList<MerchantBid>();
		try {
			list = merchantBidDaoImpl.retrieveAll();
			return list;
		} catch (PersistException e) {
			logger.info(e.toString());
			return list;
		}
	}

}
