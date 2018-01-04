package com.trend.serviceimpl;

import java.util.ArrayList;
import org.apache.log4j.Logger;
import com.trend.daoimpl.PaymentTypeDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.PaymentType;
import com.trend.serviceinf.PaymentTypeServiceInf;

public class PaymentTypeServiceImpl implements PaymentTypeServiceInf {
	private Logger logger = Logger.getLogger(PaymentTypeServiceImpl.class);
	PaymentTypeDaoImpl paymentTypeDaoImpl = new PaymentTypeDaoImpl();

	public String add(PaymentType paymentType) {
		try{
			paymentTypeDaoImpl.add(paymentType);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		}catch(PersistException e){
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	public String update(PaymentType paymentType) {
		
		try{
			paymentTypeDaoImpl.update(paymentType);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		}catch(PersistException e){
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	public ArrayList<PaymentType> retrieve(String paymentTypeId) {
		ArrayList<PaymentType> list = new ArrayList<PaymentType>();
		try{
			list = paymentTypeDaoImpl.retrieve(paymentTypeId);
			return list;
		}catch(PersistException e){
			logger.info(e.toString());
			return list;
			
		}
	}

	public ArrayList<PaymentType> retrieveAll() {
		ArrayList<PaymentType> list = new ArrayList<PaymentType>();
		try{
			list = paymentTypeDaoImpl.retrieveAll();
			return list;
		}catch(PersistException e){
			logger.info(e.toString());
			return list;
			
		}
	}

}
