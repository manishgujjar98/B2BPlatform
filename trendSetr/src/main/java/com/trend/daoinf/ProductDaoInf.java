package com.trend.daoinf;

import java.util.ArrayList;
import java.util.List;

import com.trend.exceptions.PersistException;
import com.trend.models.Product;

public interface ProductDaoInf {

	public void add(Product product) throws PersistException;

	public void update(Product product) throws PersistException;

	public ArrayList<Product> retrieve(String productId) throws PersistException;

	public ArrayList<Product> retrieveAll(String UserId) throws PersistException;
	
	public List<Product> get(List<String> productIds) throws Exception;

}
