package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.ProductVariant;

public interface ProductVariantDaoInf {
	
	public void add(ProductVariant productVariant) throws PersistException;

	public void update(ProductVariant productVariant) throws PersistException;

	public ArrayList<ProductVariant> retrieve(String productVariantId) throws PersistException;

	public ArrayList<ProductVariant> retrieveAll() throws PersistException;


}
