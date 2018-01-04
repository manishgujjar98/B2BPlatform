package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;

import com.trend.models.Merchant;
import com.trend.models.ShippingBean;

public interface MerchantDaoInf {
	
	public void add(Merchant merchant) throws PersistException;

	public void update(Merchant merchant) throws PersistException;

	public ArrayList<Merchant> retrieve(String merchantId) throws PersistException;

	public ArrayList<Merchant> retrieveAll() throws PersistException;

	void addShippingMerchantDetails(ShippingBean shippingBean) throws PersistException;

}
