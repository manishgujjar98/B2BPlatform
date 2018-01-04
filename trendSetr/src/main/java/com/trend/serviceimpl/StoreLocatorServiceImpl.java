package com.trend.serviceimpl;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response.Status;

import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONObject;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.trend.models.Address;
import com.trend.models.ShippingRequest;
import com.trend.utils.Constants;
import com.trend.utils.JerseyClient;
import com.trend.utils.ResponseUtil;

public class StoreLocatorServiceImpl {
	
	private static final Logger LOGGER = Logger.getLogger(StoreLocatorServiceImpl.class);
	
	/**
	 * 
	 * @param shippingRequest
	 * @return
	 * @throws Exception
	 */
	public String locate(ShippingRequest shippingRequest) throws Exception{
		String request = prepareRequest(shippingRequest);
		System.out.println("request = " + request);
		String upsResponse = JerseyClient.post(Config.getInstance().getValue("ups_store_locate_url"), request);
		JsonObject jsonObject = new JsonParser().parse(upsResponse).getAsJsonObject();
		JsonObject faultJson = jsonObject.getAsJsonObject("Fault");
		if (faultJson != null) {
			String errorMessage = getErrorMessage(faultJson);
			LOGGER.debug("Error response [ " + errorMessage + " ]");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, errorMessage, Status.BAD_REQUEST));
		}
		return upsResponse;
	}
	
	public static void main(String[] args) throws Exception {
		 Address fromAddress = new Address();
		 fromAddress.setAddressLine1("1700 East Main Street APT 121");
		 fromAddress.setCity("KENT");
		 fromAddress.setZip("44240-5809");
		 fromAddress.setState("OH");
		 fromAddress.setPhoneNumber("589-965-8745");
		 fromAddress.setFirstName("yo");
		 fromAddress.setLastName("dan");
		 ShippingRequest request = new ShippingRequest();
		 request.setFromAddress(fromAddress);
		 String response = new StoreLocatorServiceImpl().locate(request);
		 System.out.println("response = " + response);
	}
	
	/**
	 * 
	 */
	private String prepareRequest(ShippingRequest shippingRequest) throws Exception{
		Address address = shippingRequest.getFromAddress();
		JSONObject storeLocatorRequest = new JSONObject();
		JSONObject locatorRequest = new JSONObject();
		Config config = Config.getInstance();
		JSONObject accessRequest = new JSONObject();
		accessRequest.put("Username", config.getValue("ups_username"));
		accessRequest.put("Password", config.getValue("ups_password"));
		accessRequest.put("AccessLicenseNumber", config.getValue("ups_license"));
		storeLocatorRequest.put("AccessRequest", accessRequest);
		storeLocatorRequest.put("LocatorRequest", locatorRequest);
		JSONObject request = new JSONObject();
		request.put("RequestAction", "Locator").put("RequestOption", "1").put("TransactionReference", new JSONObject().put("CustomerContext", config.getValue("ups_customerContext")));
		locatorRequest.put("Request", request);
		JSONObject originAddress = new JSONObject();
		locatorRequest.put("OriginAddress", originAddress);
		originAddress.put("PhoneNumber", address.getPhoneNumber());
		JSONObject addressKeyFormat = new JSONObject();
		originAddress.put("AddressKeyFormat", addressKeyFormat);
		addressKeyFormat.put("AddressLine", address.getAddressLine1()).put("PoliticalDivision2", address.getCity()).put("PoliticalDivision1", address.getState());
		addressKeyFormat.put("PostcodePrimaryLow", address.getZip()).put("CountryCode", "US");
		locatorRequest.put("Translate", new JSONObject().put("Locale", "en_US"));
		locatorRequest.put("UnitOfMeasurement", new JSONObject().put("Code", "MI"));
		JSONObject locationSearchCriteria  = new JSONObject();
		locatorRequest.put("LocationSearchCriteria", locationSearchCriteria);
		JSONObject searchOption = new JSONObject();
		searchOption.put("OptionType", new JSONObject().put("Code", "01"));
		searchOption.put("OptionCode", new JSONObject().put("Code", "002"));
		locationSearchCriteria.put("SearchOption", searchOption);
		locationSearchCriteria.put("MaximumListSize", "5").put("SearchRadius", "50");
		return storeLocatorRequest.toString();
	}
	
	private String getErrorMessage(JsonObject faultJson) {
		String error = null;
		try {
			if (faultJson != null) {
				JsonObject errors = faultJson.getAsJsonObject("detail").getAsJsonObject("Errors");
				if (errors != null) {
					JsonObject primaryError = errors.getAsJsonObject("ErrorDetail").getAsJsonObject("PrimaryErrorCode");
					if (primaryError != null) {
						error = primaryError.get("Description").toString();
					}
				}
			}
		} catch (Exception e) {
			LOGGER.error("Error getting error string", e);
		}
		return error;

	}

}
