package com.trend.serviceimpl;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.trend.daoimpl.ProductVariantDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.ProductVariant;
import com.trend.serviceinf.ProductVariantServiceInf;

public class ProductVariantServiceImpl implements ProductVariantServiceInf{
	
	private Logger logger = Logger.getLogger(ProductVariantServiceImpl.class);
	ProductVariantDaoImpl productVariantDaoImpl = new ProductVariantDaoImpl();
	
	public String add(ProductVariant productVariant){
		try{
			productVariantDaoImpl.add(productVariant);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		}catch(PersistException e){
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	public String update(ProductVariant productVariant){
		try{
			productVariantDaoImpl.update(productVariant);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		}catch(PersistException e){
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	public ArrayList<ProductVariant> retrieve(String productVariantId){
		ArrayList<ProductVariant> list = new ArrayList<ProductVariant>();
		try {
			list = productVariantDaoImpl.retrieve(productVariantId);
			return list;
		} catch (PersistException e) {
			logger.info(e.toString());
			return list;
		}
		
	}

	public ArrayList<ProductVariant> retrieveAll(){
		ArrayList<ProductVariant> list = new ArrayList<ProductVariant>();
		try {
			list = productVariantDaoImpl.retrieveAll();
			return list;
		} catch (PersistException e) {
			logger.info(e.toString());
			return list;
		}
	}

}

