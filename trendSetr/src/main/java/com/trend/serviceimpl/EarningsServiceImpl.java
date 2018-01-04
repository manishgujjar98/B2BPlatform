package com.trend.serviceimpl;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.trend.daoimpl.EarningsDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.Earnings;
import com.trend.serviceinf.EarningsServiceInf;

public class EarningsServiceImpl implements EarningsServiceInf {
   EarningsDaoImpl earningsDaoImpl = new EarningsDaoImpl();
   private Logger logger = Logger.getLogger(EarningsServiceImpl.class);
	public String add(Earnings earnings) {
		try{
			earningsDaoImpl.add(earnings);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		}catch(PersistException e){
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}

	}

	public String update(Earnings earnings) {
		try{
			earningsDaoImpl.update(earnings);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		}catch(PersistException e){
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	public ArrayList<Earnings> retrieve(String earningId) {
		
		ArrayList<Earnings> list = new ArrayList<Earnings>();
		try{
			list = earningsDaoImpl.retrieve(earningId);
			return list;
		}catch(PersistException e){
			logger.info(e.toString());
			return list;
		}
	}

	public ArrayList<Earnings> retrieveAll() {
		ArrayList<Earnings> list = new ArrayList<Earnings>();
		try{
			list = earningsDaoImpl.retrieveAll();
			return list;
		}catch(PersistException e){
			logger.info(e.toString());
			return list;
		}
	}

}
