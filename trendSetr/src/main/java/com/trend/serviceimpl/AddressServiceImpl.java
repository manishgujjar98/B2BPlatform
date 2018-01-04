package com.trend.serviceimpl;

import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.trend.daoimpl.AddressDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.Address;
import com.trend.serviceinf.AddressServiceInf;
import com.trendset.util.services.ShipingAddressValidator;

public class AddressServiceImpl implements AddressServiceInf {

	private Logger logger = Logger.getLogger(AddressServiceImpl.class);
	AddressDaoImpl addressDaoImpl = new AddressDaoImpl();

	public MessageEnum add(Address address) throws JSONException{
		try {
			Address updateAddress = new Address(); 
			String addrStr = new ShipingAddressValidator().validateAddress(address);
			JSONObject jsonObj = new JSONObject(addrStr);
			JSONObject jObj1 = (JSONObject) jsonObj.get("XAVResponse");
			JSONObject canObj = (JSONObject) jObj1.get("Candidate");
			JSONObject addObj = (JSONObject) canObj.get("AddressKeyFormat");
			JSONArray addList = new JSONArray();
			Object obj = addObj.get("AddressLine");
			if(obj instanceof JSONArray)
				addList = (JSONArray) obj;
			JSONObject resObj = (JSONObject) jObj1.get("Response");
			JSONObject customerObj = (JSONObject) resObj.get("TransactionReference");
			updateAddress.setFirstName(customerObj.getString("CustomerContext"));
			if(addList.length() ==2){
			  updateAddress.setAddressLine1(addList.get(0).toString());
			  updateAddress.setAddressLine2(addList.get(1).toString());
			}else {
				updateAddress.setAddressLine1(addObj.getString("AddressLine"));
			}
			 
			
			updateAddress.setCity(addObj.getString("PoliticalDivision2"));
			updateAddress.setState(addObj.getString("PoliticalDivision1"));
			updateAddress.setZip(addObj.getString("PostcodePrimaryLow"));
			updateAddress.setCountry(addObj.getString("CountryCode"));
			updateAddress.setUserId(address.getUserId());
			updateAddress.setFirstName(address.getFirstName());
			updateAddress.setPhoneNumber(address.getPhoneNumber());
			addressDaoImpl.add(address);
			return MessageEnum.MESSAGE_SUCCESS;
		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR;
		}
	}

	public String update(Address address) {
		try {
			addressDaoImpl.update(address);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();

		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	public ArrayList<Address> retrieve(String addressId) {
		ArrayList<Address> list = new ArrayList<Address>();
		try {
			list = addressDaoImpl.retrieve(addressId);
			return list;
		} catch (PersistException e) {
			logger.info(e.toString());
			return list;
		}

	}

	

	@Override
	public MessageEnum delete(String addressIdList) {
		try{
			addressDaoImpl.delete(addressIdList);
			return MessageEnum.MESSAGE_SUCCESS;

		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR;
		}
	}

	@Override
	public ArrayList<Address> retrieveAll(String userId) {
		ArrayList<Address> list = new ArrayList<Address>();
		try {
			list = addressDaoImpl.retrieveAll(userId);
			return list;
		} catch (PersistException e) {
			logger.info(e.toString());
			return list;
		}
		
	}

}
