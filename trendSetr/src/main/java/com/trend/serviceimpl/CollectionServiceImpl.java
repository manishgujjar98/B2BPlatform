package com.trend.serviceimpl;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.trend.daoimpl.CollectionDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.Collection;
import com.trend.serviceinf.CollectionServiceInf;

public class CollectionServiceImpl implements CollectionServiceInf {
    private Logger logger = Logger.getLogger(CollectionServiceImpl.class);
	CollectionDaoImpl collectionDaoImpl = new CollectionDaoImpl();
	
	public String add(Collection collection) {
		try {
			collectionDaoImpl.add(collection); 
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
			
		}
		
	}

	public String update(Collection collection) {
		try {
			collectionDaoImpl.update(collection); 
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	public String delete(Collection collection) {
		return null;
	}
	
	
	
	public ArrayList<Collection> retrieve(String collectionId){
		ArrayList<Collection> list = new ArrayList<Collection>();
		try{
			list = collectionDaoImpl.retrieve(collectionId); 
		}catch(PersistException e ){
			logger.info(e.toString());
		}
		return list;
	}
	public ArrayList<Collection> retrieveAll(){
		ArrayList<Collection> list = new ArrayList<Collection>();
		try{
			list = collectionDaoImpl.retrieveAll(); 
		}catch(PersistException e ){
			logger.info(e.toString());
		}
		return list;
	}
	

}
