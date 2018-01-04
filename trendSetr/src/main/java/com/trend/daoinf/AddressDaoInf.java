package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.Address;


public interface AddressDaoInf {
	
	public void add(Address address) throws PersistException;

	public void update(Address address) throws PersistException;

	public ArrayList<Address> retrieve(String addressId) throws PersistException;

	ArrayList<Address> retrieveAll(String userId);

	void delete(String addressIdList) throws PersistException;
	

}
