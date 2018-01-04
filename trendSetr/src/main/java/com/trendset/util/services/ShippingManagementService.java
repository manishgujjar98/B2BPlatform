package com.trendset.util.services;

import javax.ws.rs.WebApplicationException;
/*import org.json.simple.JSONValue;*/
import javax.ws.rs.core.Response.Status;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.trend.models.Address;
import com.trend.models.PackageInfo;
import com.trend.models.ShippingRequest;
import com.trend.models.ShippingRequest.PickUP;
import com.trend.models.shipping.BillShipper;
import com.trend.models.shipping.Dimensions;
import com.trend.models.shipping.LabelImageFormat;
import com.trend.models.shipping.LabelSpecification;
import com.trend.models.shipping.Package;
import com.trend.models.shipping.PackageWeight;
import com.trend.models.shipping.Packaging;
import com.trend.models.shipping.PaymentInformation;
import com.trend.models.shipping.Phone;
import com.trend.models.shipping.Request;
import com.trend.models.shipping.Service;
import com.trend.models.shipping.ShipFrom;
import com.trend.models.shipping.ShipTo;
import com.trend.models.shipping.Shipment;
import com.trend.models.shipping.ShipmentCharge;
import com.trend.models.shipping.ShipmentRequest;
import com.trend.models.shipping.Shipper;
import com.trend.models.shipping.TransactionReference;
import com.trend.models.shipping.UPSSecurity;
import com.trend.models.shipping.UPSShippingRequest;
import com.trend.models.shipping.UnitOfMeasurement;
import com.trend.models.shipping.UnitOfMeasurement_;
import com.trend.serviceimpl.Config;
import com.trend.utils.Constants;
import com.trend.utils.JerseyClient;
import com.trend.utils.ResponseUtil;

/**
 * 
 * @author Ravi
 *
 */
public class ShippingManagementService {

	private static final Logger LOGGER = Logger.getLogger(ShippingManagementService.class);

	/**
	 * 
	 * @param shippingRequest
	 * @return
	 */
	public String ship(ShippingRequest shippingRequest) {
		String upsShippingRequest = prepapreShipmentRequest(shippingRequest);
		String upsResponse = callUPSService(upsShippingRequest);
		JsonObject jsonObject = new JsonParser().parse(upsResponse).getAsJsonObject();
		System.out.println("Information:" + jsonObject.toString());
		JsonObject faultJson = jsonObject.getAsJsonObject("Fault");
		if (faultJson != null) {
			String errorMessage = getErrorMessage(faultJson);
			LOGGER.debug("Error response [ " + errorMessage + " ]");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, errorMessage, Status.BAD_REQUEST));
		}
		return jsonObject.toString();
		//return ((Object)jsonObject);
	}

	/**
	 * 
	 * @param trackingID
	 * @return
	 */
	public String trackShipment(String trackingID) {
		String shipmentTrackResponse = null;
		LOGGER.debug("trackingID [ " + trackingID + " ]");
		if (StringUtils.isBlank(trackingID)) {
			LOGGER.debug("Tracking ID is blank");
			throw new WebApplicationException(
					ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Tracking Number Does Not Exist", Status.NOT_ACCEPTABLE));
		}
		String upsTrackingRequest = prepareTrackShipmentRequest(trackingID);
		if (StringUtils.isNotBlank(upsTrackingRequest)) {
			shipmentTrackResponse = JerseyClient.post(Config.getInstance().getValue("ups_tracking_url"), upsTrackingRequest);
			LOGGER.debug("shipment tracking response " + shipmentTrackResponse);
			JsonObject jsonObject = new JsonParser().parse(shipmentTrackResponse).getAsJsonObject();
			JsonObject faultJson = jsonObject.getAsJsonObject("Fault");
			if (faultJson != null) {
				String errorMessage = getErrorMessage(faultJson);
				LOGGER.debug("Error response [ " + errorMessage + " ]");
				throw new WebApplicationException(
						ResponseUtil.constructResponse(Constants.FAILURE_STATUS, errorMessage, Status.BAD_REQUEST));
			}

		}
		return shipmentTrackResponse;
	}

	/**
	 * 
	 * @param shippingRequest
	 * @return
	 * @throws Exception
	 */
	public String pickUpShipment(ShippingRequest shippingRequest) throws Exception {
		String pickUpRequest = preparePickUpRequest(shippingRequest);
		String pickupResponse = JerseyClient.post(Config.getInstance().getValue("ups_pickup_url"), pickUpRequest);
		LOGGER.debug("pickup Response  " + pickupResponse);
		JsonObject jsonObject = new JsonParser().parse(pickupResponse).getAsJsonObject();
		JsonObject faultJson = jsonObject.getAsJsonObject("Fault");
		if (faultJson != null) {
			String errorMessage = getErrorMessage(faultJson);
			LOGGER.debug("Error response [ " + errorMessage + " ]");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, errorMessage, Status.BAD_REQUEST));
		}
		return pickupResponse;

	}

	/**
	 * 
	 * @param shippingRequest
	 * @return
	 * @throws Exception
	 */
	private String preparePickUpRequest(ShippingRequest shippingRequest) throws Exception {
		Address fromAddress = shippingRequest.getFromAddress();
		PickUP pickUP = shippingRequest.getPickUP();
		JSONObject pickupRequest = new JSONObject();
		Config config = Config.getInstance();
		UPSSecurity upsSecurity = UPSSecurity.get();
		JSONObject pickupCreationRequest = new JSONObject();
		pickupRequest.put("UPSSecurity", new JSONObject(new Gson().toJson(upsSecurity)));
		pickupRequest.put("PickupCreationRequest", pickupCreationRequest);
		JSONObject PickupAddress = new JSONObject();
		pickupCreationRequest.put("Request", new JSONObject().put("TransactionReference",
				new JSONObject().put("CustomerContext", config.getValue("ups_customerContext"))));
		pickupCreationRequest.put("RatePickupIndicator", "Y").put("TaxInformationIndicator", "Y");
		pickupCreationRequest.put("PickupDateInfo", new JSONObject().put("CloseTime", pickUP.getCloseTime())
				.put("ReadyTime", pickUP.getReadyTime()).put("PickupDate", pickUP.getPickupDate()));
		PickupAddress.put("CompanyName", fromAddress.getCompanyName()).put("ContactName", fromAddress.getContactName())
				.put("AddressLine", fromAddress.getAddressLine1()).put("City", fromAddress.getCity())
				.put("StateProvince", fromAddress.getState()).put("PostalCode", fromAddress.getZip()).put("CountryCode", "US")
				.put("ResidentialIndicator", "N").put("Phone", new JSONObject().put("Number", fromAddress.getPhoneNumber()));
		pickupCreationRequest.put("PickupAddress", PickupAddress);
		pickupCreationRequest.put("AlternateAddressIndicator", "N");
		pickupCreationRequest.put("PickupPiece", new JSONObject().put("ServiceCode", "003").put("Quantity", pickUP.getQuantity())
				.put("DestinationCountryCode", "US").put("ContainerCode", "01"));
		pickupCreationRequest.put("OverweightIndicator", "N").put("PaymentMethod", "05");
		return pickupRequest.toString();
	}
	
	public static void main(String[] args) throws Exception {
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
		 fromAddress.setZip("44240-5809");
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
		ShippingManagementService managementService = new ShippingManagementService();
		PickUP pickUP = new PickUP();
		pickUP.setCloseTime("1700");
		pickUP.setReadyTime("1000");
		pickUP.setPickupDate("20160524");
		pickUP.setQuantity("1");
		request.setPickUP(pickUP);
		String pickupRequest  = managementService.preparePickUpRequest(request);
		System.out.println(pickupRequest);
	}


	private String prepareTrackShipmentRequest(String trackingID) {
		JsonParser jsonParser = new JsonParser();
		UPSSecurity upsSecurity = UPSSecurity.get();
		JsonObject upsSecurityJson = jsonParser.parse(new Gson().toJson(upsSecurity)).getAsJsonObject();
		JsonObject upsTrackRequest = new JsonObject();
		upsTrackRequest.add("UPSSecurity", upsSecurityJson);
		JsonObject request = new JsonObject();
		request.addProperty("RequestOption", "1");
		JsonObject transactionReference = new JsonObject();
		request.add("TransactionReference", transactionReference);
		transactionReference.addProperty("CustomerContext", Config.getInstance().getValue("ups_customerContext"));
		JsonObject trackRequest = new JsonObject();
		trackRequest.addProperty("InquiryNumber", trackingID);
		trackRequest.add("Request", request);
		upsTrackRequest.add("TrackRequest", trackRequest);
		return upsTrackRequest.toString();
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

	/**
	 * 
	 * @param shippingRequest
	 */
	private String prepapreShipmentRequest(ShippingRequest shippingRequest) {
		Config config = Config.getInstance();
		UPSShippingRequest upsShippingRequest = new UPSShippingRequest();
		upsShippingRequest.setUPSSecurity(UPSSecurity.get());
		ShipmentRequest upsShipmentRequest = new ShipmentRequest();
		Request request = new Request();
		upsShipmentRequest.setRequest(request);
		request.setRequestOption("validate");
		TransactionReference reference = new TransactionReference();
		reference.setCustomerContext(config.getValue("shipping_context"));
		request.setTransactionReference(reference);
		upsShipmentRequest.setRequest(request);
		Shipment shipment = new Shipment();
		includeShipFrom(shipment, shippingRequest.getFromAddress());
		includeShipTo(shipment, shippingRequest.getToAddress());
		includeShipper(shipment);
		includePackage(shipment, shippingRequest.getPackageInfo());
		includeLabel(upsShipmentRequest);
		upsShipmentRequest.setShipment(shipment);
		upsShippingRequest.setShipmentRequest(upsShipmentRequest);
		return new Gson().toJson(upsShippingRequest);

	}

	/**
	 * 
	 * @param shipment
	 * @param fromAddress
	 */
	private void includeShipFrom(Shipment shipment, Address fromAddress) {
		ShipFrom shipFrom = new ShipFrom();
		shipFrom.setName(fromAddress.getFirstName() + " " + fromAddress.getLastName());
		Phone phone = new Phone();
		phone.setNumber(fromAddress.getPhoneNumber());
		shipFrom.setPhone(phone);
		com.trend.models.shipping.Address address = new com.trend.models.shipping.Address();
		address.setAddressLine(fromAddress.getAddressLine1());
		address.setCity(fromAddress.getCity());
		address.setStateProvinceCode(fromAddress.getState());
		address.setPostalCode(fromAddress.getZip());
		address.setCountryCode("US");
		shipFrom.setAddress(address);
		shipment.setShipFrom(shipFrom);
	}

	/**
	 * 
	 * @param shipment
	 * @param toAddress
	 */
	private void includeShipTo(Shipment shipment, Address toAddress) {
		ShipTo shipTo = new ShipTo();
		shipTo.setName(toAddress.getFirstName() + " " + toAddress.getLastName());
		Phone phone = new Phone();
		phone.setNumber(toAddress.getPhoneNumber());
		shipTo.setPhone(phone);
		com.trend.models.shipping.Address address = new com.trend.models.shipping.Address();
		address.setAddressLine(toAddress.getAddressLine1());
		address.setCity(toAddress.getCity());
		address.setStateProvinceCode(toAddress.getState());
		address.setPostalCode(toAddress.getZip());
		address.setCountryCode("US");
		shipTo.setAddress(address);
		shipment.setShipTo(shipTo);
	}

	/**
	 * 
	 * @param shipment
	 */
	private void includeShipper(Shipment shipment) {
		Config config = Config.getInstance();
		shipment.setDescription(config.getValue("shipment_desc"));
		Shipper shipper = new Shipper();
		shipment.setShipper(shipper);
		shipper.setShipperNumber(config.getValue("trendstr_shipper_number"));
		shipper.setName(config.getValue("shipper_name"));
		shipper.setTaxIdentificationNumber(config.getValue("tax_identification_number"));
		String addressJson = config.getValue("trendstr_address");
		com.trend.models.shipping.Address address = new Gson().fromJson(addressJson, com.trend.models.shipping.Address.class);
		shipper.setAddress(address);
		Phone phone = new Phone();
		phone.setNumber(config.getValue("trendstr_Phone"));
		shipper.setPhone(phone);
		shipment.setShipper(shipper);
	}

	/**
	 * 
	 * @param shipment
	 * @param packageInfo
	 */
	private void includePackage(Shipment shipment, PackageInfo packageInfo) {
		Package pack = new Package();
		pack.setDescription(packageInfo.getDescription());
		Packaging packaging = new Packaging();
		packaging.setCode("02");
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
		shipment.setPackage(pack);
		Service service = new Service();
		service.setCode("03");
		service.setDescription("Ground");
		PaymentInformation paymentInformation = new PaymentInformation();
		shipment.setPaymentInformation(paymentInformation);
		ShipmentCharge shipmentCharge = new ShipmentCharge();
		paymentInformation.setShipmentCharge(shipmentCharge);
		shipmentCharge.setType("01");
		BillShipper billShipper = new BillShipper();
		shipmentCharge.setBillShipper(billShipper);
		billShipper.setAccountNumber(Config.getInstance().getValue("trendstr_shipper_number"));
		shipment.setService(service);
	}

	/**
	 * 
	 * @param shipmentRequest
	 */
	private void includeLabel(ShipmentRequest shipmentRequest) {
		LabelSpecification labelSpecification = new LabelSpecification();
		LabelImageFormat labelImageFormat = new LabelImageFormat();
		labelImageFormat.setCode("GIF");
		labelImageFormat.setDescription("GIF");
		labelSpecification.setLabelImageFormat(labelImageFormat);
		shipmentRequest.setLabelSpecification(labelSpecification);
		System.out.println("Hello your format: "+shipmentRequest.getLabelSpecification().getLabelImageFormat().getCode());
	}

	private String callUPSService(String payload) {
		String response = null;
		if (StringUtils.isNotBlank(payload)) {
			System.out.println("payload = " + payload);
			String url = Config.getInstance().getValue("ups_shippingURL");
			response = JerseyClient.post(url, payload);
			LOGGER.debug("Ups shipping response " + response);
		}
		return response;
	}

}
