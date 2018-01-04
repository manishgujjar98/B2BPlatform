package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.PaymentType;

public interface PaymentTypeDaoInf {
	
	
	public void add(PaymentType paymentType) throws PersistException;

	public void update(PaymentType paymentType) throws PersistException;

	public ArrayList<PaymentType> retrieve(String paymentTypeId) throws PersistException;

	public ArrayList<PaymentType> retrieveAll() throws PersistException;

}
