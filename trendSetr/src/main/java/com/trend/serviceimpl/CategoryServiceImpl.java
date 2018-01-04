package com.trend.serviceimpl;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.trend.daoimpl.CategoryDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.Category;
import com.trend.serviceinf.CategoryServiceInf;

public class CategoryServiceImpl implements CategoryServiceInf {
	
	private Logger logger = Logger.getLogger(CategoryServiceImpl.class);

	CategoryDaoImpl categoryDaoImpl = new CategoryDaoImpl();

	public String add(Category category) {
		try {
			categoryDaoImpl.add(category);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();

		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();

		}
	}

	public String update(Category category) {
		try {
			categoryDaoImpl.update(category);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();

		} catch (Exception e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();

		}
	}

	public ArrayList<Category> retrieve(String categoryName) {

		ArrayList<Category> list = new ArrayList<Category>();
		try {
			list = categoryDaoImpl.retrieve(categoryName);
			return list;
		} catch (PersistException e) {
			logger.info(e.toString());
			return list;
		}

	}

	public ArrayList<Category> retrieveAll() {

		ArrayList<Category> list = new ArrayList<Category>();
		try {
			list = categoryDaoImpl.retrieveAll();
			return list;
		} catch (PersistException e) {
			logger.info(e.toString());
			return list;
		}

	}

}
