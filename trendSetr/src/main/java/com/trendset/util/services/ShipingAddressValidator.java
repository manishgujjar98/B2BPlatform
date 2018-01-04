package com.trendset.util.services;

import com.google.gson.JsonObject;
import com.trend.models.Address;
import com.trend.serviceimpl.Config;
import com.trend.utils.Constants;
import com.trend.utils.JerseyClient;

public class ShipingAddressValidator {
	
	
	public String validateAddress(Address address){
		String addressValidationRequest = prepareUPSAddressValidationRequest(address);
		String response = JerseyClient.post(Config.getInstance().getValue("ups_addressValidationURL"), addressValidationRequest);
		System.out.println(response);
		return response;
	}
	
	
	/**
	 * 
	 * @param address
	 * @return
	 */
	private String prepareUPSAddressValidationRequest(Address address){
		Config config = Config.getInstance();
		JsonObject upsSecurity = new JsonObject();
		JsonObject usernameToken = new JsonObject();
		usernameToken.addProperty("Username", config.getValue("ups_username"));
		usernameToken.addProperty("Password", config.getValue("ups_password"));
		upsSecurity.add("UsernameToken", usernameToken);
		JsonObject serviceAccessToken = new JsonObject();
		serviceAccessToken.addProperty("AccessLicenseNumber", config.getValue("ups_license"));
		upsSecurity.add("ServiceAccessToken", serviceAccessToken);
		
		JsonObject upsRequest = new JsonObject();
		JsonObject xavRequest = new JsonObject();
		xavRequest.addProperty("MaximumListSize", "10");
		xavRequest.add("AddressKeyFormat", buildAddressJson(address));
		JsonObject request = new JsonObject();
		request.addProperty("RequestOption", "1");
		JsonObject transactionReference = new JsonObject();
		request.add("TransactionReference", transactionReference);
		transactionReference.addProperty("CustomerContext", config.getValue("ups_customerContext"));
		xavRequest.add("Request", request);
		upsRequest.add("UPSSecurity", upsSecurity);
		upsRequest.add("XAVRequest", xavRequest);
		return upsRequest.toString();
	}
	
	public static void main(String[] args) {
		ShipingAddressValidator shipingManagementService = new ShipingAddressValidator();
		Address address = new Address();
		address.setAddressLine1("1705 n 1st street, apt#7b, utopian apartments");
		address.setCity("KINGSVILLE");
		address.setZip("25613");
		address.setState("HI");
		System.out.println(Constants.GSON.toJson(address));
		shipingManagementService.validateAddress(address);
	}
	
	private JsonObject buildAddressJson(Address address){
		Config config = Config.getInstance();
		JsonObject addressJson = new JsonObject();
		addressJson.addProperty("ConsigneeName", config.getValue("ups_consigneeName"));
		addressJson.addProperty("CountryCode", "US");
		addressJson.addProperty("AddressLine", address.getAddressLine1());
		addressJson.addProperty("PoliticalDivision2", address.getCity());
		addressJson.addProperty("PoliticalDivision1", address.getState());
		addressJson.addProperty("PostcodePrimaryLow", address.getZip());
		return addressJson;
	}
}
