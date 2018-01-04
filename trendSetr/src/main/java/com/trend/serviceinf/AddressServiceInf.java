package com.trend.serviceinf;

import java.util.ArrayList;

import org.codehaus.jettison.json.JSONException;

import com.trend.enums.MessageEnum;
import com.trend.models.Address;


public interface AddressServiceInf {
	
	MessageEnum add(Address address) throws JSONException;

	String update(Address address);

	ArrayList<Address> retrieve(String addressId);

	MessageEnum delete(String addressIdList);

	ArrayList<Address> retrieveAll(String userId);


}
