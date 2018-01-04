package com.trendset.util.services;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response.Status;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.trend.models.Address;
import com.trend.models.PackageInfo;
import com.trend.models.ShippingRequest;
import com.trend.models.shipping.Dimensions;
import com.trend.models.shipping.Package;
import com.trend.models.shipping.PackageWeight;
import com.trend.models.shipping.Packaging;
import com.trend.models.shipping.Service;
import com.trend.models.shipping.ShipFrom;
import com.trend.models.shipping.Shipper;
import com.trend.models.shipping.UPSSecurity;
import com.trend.models.shipping.UnitOfMeasurement;
import com.trend.models.shipping.UnitOfMeasurement_;
import com.trend.serviceimpl.Config;
import com.trend.utils.Constants;
import com.trend.utils.JerseyClient;
import com.trend.utils.ResponseUtil;

public class ShippingRateService {
	
	private static final Logger LOGGER = Logger.getLogger(ShippingRateService.class);
	
	public String calculate(ShippingRequest shippingRequest)throws Exception {
		String rateRequest = prepareRateRequest(shippingRequest);
		String upsResponse = callUPSService(rateRequest);
		JsonObject jsonObject = new JsonParser().parse(upsResponse).getAsJsonObject();
		JsonObject faultJson = jsonObject.getAsJsonObject("Fault");
		if (faultJson != null) {
			String errorMessage = getErrorMessage(faultJson);
			LOGGER.debug("Error response [ " + errorMessage + " ]");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, errorMessage, Status.BAD_REQUEST));
		}
		return upsResponse;
	}
	
	private String callUPSService(String payload) {
		String response = null;
		if (StringUtils.isNotBlank(payload)) {
			System.out.println("payload = " + payload);
			String url = Config.getInstance().getValue("ups_rate_url");
			response = JerseyClient.post(url, payload);
			LOGGER.debug("Ups shipping response " + response);
		}
		return response;
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
	
	private String prepareRateRequest(ShippingRequest shippingRequest) throws Exception{
		JSONObject rateRequest = new JSONObject();
		Config config = Config.getInstance();
		UPSSecurity upsSecurity = UPSSecurity.get();
		JSONObject rate = new JSONObject();
		rateRequest.put("UPSSecurity", new JSONObject(new Gson().toJson(upsSecurity)));
		rateRequest.put("RateRequest", rate);
		rate.put("Request", new JSONObject().put("TransactionReference",
				new JSONObject().put("CustomerContext", config.getValue("ups_customerContext"))).put("RequestOption", "rate"));
		JSONObject shipment = new JSONObject();
		inclideShipper(shipment);
		includeShipTo(shipment, shippingRequest.getToAddress());
		includeShipFrom(shipment, shippingRequest.getFromAddress());
		includePackage(shipment, shippingRequest.getPackageInfo());
		rate.put("Shipment", shipment);
		rateRequest.put("RateRequest", rate);
		return rateRequest.toString();
	}
	
	public static void main(String[] args) throws Exception{
		 Address toAddress = new Address();
		 toAddress.setAddressLine1("1 middletree ln");
		 toAddress.setCity("Hawthorn woods");
		 toAddress.setZip("60047");
		 toAddress.setState("IL");
		 toAddress.setPhoneNumber("1234567890");
		 toAddress.setFirstName("Alex");
		 toAddress.setLastName("Lamann");
		
		 Address fromAddress = new Address();
		 fromAddress.setAddressLine1("1700 East Main Street APT 121");
		 fromAddress.setCity("KENT");
		 fromAddress.setZip("44240");
		 fromAddress.setState("OH");
		 fromAddress.setPhoneNumber("589-965-8745");
		 fromAddress.setFirstName("yo");
		 fromAddress.setLastName("dan");
		
		 PackageInfo packageInfo = new PackageInfo();
		 packageInfo.setDescription("");
		 packageInfo.setHeight("10");
		 packageInfo.setLength("10");
		 packageInfo.setWidth("10");
		 packageInfo.setWeight("10");
		
		
		 ShippingRequest request = new ShippingRequest();
		 request.setFromAddress(fromAddress);
		 request.setToAddress(toAddress);
		 request.setPackageInfo(packageInfo);
		 String rateRequest = new ShippingRateService().calculate(request);
		 System.out.println(rateRequest);
	}
	
	private void inclideShipper(JSONObject shipmentJson) throws Exception {
		Config config = Config.getInstance();
		Shipper shipper = new Shipper();
		shipper.setShipperNumber(config.getValue("trendstr_shipper_number"));
		shipper.setName(config.getValue("shipper_name"));
		String addressJson = config.getValue("trendstr_address");
		com.trend.models.shipping.Address address = new Gson().fromJson(addressJson, com.trend.models.shipping.Address.class);
		shipper.setAddress(address);
		JSONObject shipperJson = new JSONObject(Constants.GSON.toJson(shipper));
		shipperJson.optJSONObject("Address").put("AddressLine", new JSONArray().put(address.getAddressLine()));
		shipmentJson.put("Shipper", shipperJson);
	}
	
	private void includeShipFrom(JSONObject shipmentJson, Address fromAddress) throws Exception {
		ShipFrom shipFrom = new ShipFrom();
		shipFrom.setName(fromAddress.getFirstName() + " " + fromAddress.getLastName());
		com.trend.models.shipping.Address address = new com.trend.models.shipping.Address();
		address.setAddressLine(fromAddress.getAddressLine1());
		address.setCity(fromAddress.getCity());
		address.setStateProvinceCode(fromAddress.getState());
		address.setPostalCode(fromAddress.getZip());
		address.setCountryCode("US");
		shipFrom.setAddress(address);
		JSONObject shipperFromJson = new JSONObject(Constants.GSON.toJson(shipFrom));
		shipperFromJson.optJSONObject("Address").put("AddressLine", new JSONArray().put(address.getAddressLine()));
		shipmentJson.put("ShipFrom", shipperFromJson);
	}
	
	private void includeShipTo(JSONObject shipmentJson, Address toAddress) throws Exception {
		ShipFrom shipFrom = new ShipFrom();
		shipFrom.setName(toAddress.getFirstName() + " " + toAddress.getLastName());
		com.trend.models.shipping.Address address = new com.trend.models.shipping.Address();
		address.setAddressLine(toAddress.getAddressLine1());
		address.setCity(toAddress.getCity());
		address.setStateProvinceCode(toAddress.getState());
		address.setPostalCode(toAddress.getZip());
		address.setCountryCode("US");
		shipFrom.setAddress(address);
		JSONObject shipperToJson = new JSONObject(Constants.GSON.toJson(shipFrom));
		shipperToJson.optJSONObject("Address").put("AddressLine", new JSONArray().put(address.getAddressLine()));
		shipmentJson.put("ShipTo", shipperToJson);
	}
	
	private void includePackage(JSONObject shipmentJson, PackageInfo packageInfo) throws Exception {
		Package pack = new Package();
		pack.setDescription(packageInfo.getDescription());
		Packaging packaging = new Packaging();
		packaging.setCode("02");
		packaging.setDescription("Rate");
		pack.setPackaging(packaging);
		Dimensions dimensions = new Dimensions();
		dimensions.setHeight(packageInfo.getHeight());
		dimensions.setLength(packageInfo.getLength());
		dimensions.setWidth(packageInfo.getWidth());
		UnitOfMeasurement unitOfMeasurement = new UnitOfMeasurement();
		unitOfMeasurement.setCode("IN");
		dimensions.setUnitOfMeasurement(unitOfMeasurement);
		pack.setDimensions(dimensions);
		PackageWeight packageWeight = new PackageWeight();
		packageWeight.setWeight(packageInfo.getWeight());
		UnitOfMeasurement_ measurement_ = new UnitOfMeasurement_();
		measurement_.setCode("LBS");
		packageWeight.setUnitOfMeasurement(measurement_);
		pack.setPackageWeight(packageWeight);
		Service service = new Service();
		service.setCode("03");
		service.setDescription("Clothing");
		shipmentJson.put("Service", new JSONObject(Constants.GSON.toJson(service)));
		JSONObject packageJSON = new JSONObject(Constants.GSON.toJson(pack).toString());
		packageJSON.put("PackagingType", packageJSON.getJSONObject("Packaging"));
		packageJSON.remove("Packaging");
		shipmentJson.put("Package", packageJSON);
		shipmentJson.put("ShipmentRatingOptions", new JSONObject().put("NegotiatedRatesIndicator", ""));
	}

		

}
