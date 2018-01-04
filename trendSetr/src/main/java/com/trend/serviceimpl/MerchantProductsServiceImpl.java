package com.trend.serviceimpl;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.trend.daoimpl.MerchantProductsDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.MerchantProducts;
import com.trend.serviceinf.MerchantProductsServiceInf;

public class MerchantProductsServiceImpl implements MerchantProductsServiceInf {
	MerchantProductsDaoImpl merchantProductsDaoImpl = new MerchantProductsDaoImpl();
	private final Logger logger = Logger.getLogger(MerchantProductsServiceImpl.class);

	public String add(MerchantProducts merchantProducts) {
		try{
			merchantProductsDaoImpl.add(merchantProducts);
		return MessageEnum.MESSAGE_SUCCESS.getMessage();
		}catch(PersistException e){
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	/*public String update(MerchantProducts merchantProducts) {
		try{
			merchantProductsDaoImpl.update(merchantProducts);
		return MessageEnum.MESSAGE_SUCCESS.getMessage();
		}catch(PersistException e){
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}*/

	public ArrayList<MerchantProducts> retrieve(MerchantProducts merchantProducts) {
		ArrayList<MerchantProducts> list = new ArrayList<MerchantProducts>();
		try{
		list = merchantProductsDaoImpl.retrieve(merchantProducts);
		return list;
	  }catch(PersistException e){
		  logger.info(e.toString());
		  return list;
	  }
	}
	public ArrayList<MerchantProducts> retrieveAll() {
		
		ArrayList<MerchantProducts> list = new ArrayList<MerchantProducts>();
		try{
		list = merchantProductsDaoImpl.retrieveAll();
		return list;
	  }catch(PersistException e){
		  logger.info(e.toString());
		  return list;
	  }
	}

}
