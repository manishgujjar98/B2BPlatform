package com.trend.serviceimpl;

import java.sql.Connection;
import java.util.Collection;
import java.util.UUID;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response.Status;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONObject;

import com.google.gson.JsonObject;
import com.trend.daoimpl.OrderShippingDAO;
import com.trend.daoimpl.ShippingProductsDAO;
import com.trend.models.OrderShipment;
import com.trend.models.ShippingRequest;
import com.trend.utils.Constants;
import com.trend.utils.DBHelper;
import com.trend.utils.ResponseUtil;
import com.trendset.util.services.ShippingManagementService;

public class ShippingServiceImpl {

	private static final Logger LOGGER = Logger.getLogger(ShippingServiceImpl.class);

	/**
	 * 
	 * @param shippingRequest
	 * @return
	 * @throws Exception
	 */
	public OrderShipment createShipment(ShippingRequest shippingRequest) throws Exception {
		validateShipmentRequest(shippingRequest);
		ShippingManagementService service = new ShippingManagementService();
		String shippingResult = service.ship(shippingRequest);
		OrderShipment orderShipment = new OrderShipment();
		orderShipment.setId(UUID.randomUUID().toString());
		orderShipment.setStatus("shipment_created");
		orderShipment.setOrderID(shippingRequest.getOrderID());
		String trackingID = getTrackingNumber(shippingResult);
		orderShipment.setTrackingID(trackingID);
		orderShipment.setShippingResponse(shippingResult);
		saveShipping(orderShipment, shippingRequest.getProductIds());
		LOGGER.debug("Twst method");
		return orderShipment;
	}

	/**
	 * 
	 * @param shippingID
	 * @param orderID
	 * @return
	 */
	public String trackShipment(String shippingID, String orderID) {
		if(StringUtils.isAnyBlank(shippingID, orderID)){
			LOGGER.debug("shippingID [ " + shippingID + " ] or orderID [ " + orderID + " ] is empty");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Shipping Id or Order Id is empty", Status.BAD_REQUEST));
		}
		OrderShippingDAO orderShippingDAO = new OrderShippingDAO();
		OrderShipment orderShipment = orderShippingDAO.get(shippingID, orderID);
		if(orderShipment == null){
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Invalid Shipping ID", Status.BAD_REQUEST));
		}
		String trackID = orderShipment.getTrackingID();
		return new ShippingManagementService().trackShipment(trackID);
	}
	
	
	public String pickUP(ShippingRequest shippingRequest) throws Exception {
		String orderID = shippingRequest.getOrderID();
		String shippingID = shippingRequest.getId();
		if(StringUtils.isAnyBlank(shippingID, orderID)){
			LOGGER.debug("shippingID [ " + shippingID + " ] or orderID [ " + orderID + " ] is empty");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Shipping Id or Order Id is empty", Status.BAD_REQUEST));
		}
		OrderShippingDAO orderShippingDAO = new OrderShippingDAO();
		OrderShipment orderShipment = orderShippingDAO.get(shippingID, orderID);
		if(orderShipment == null){
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Invalid Shipping ID", Status.BAD_REQUEST));
		}
		return new ShippingManagementService().pickUpShipment(shippingRequest);
		
	}
	

	/**
	 * 
	 * @param shippingResponse
	 * @return
	 */
	private String getTrackingNumber(String shippingResponse) {
		String trackingNumber = null;
		try {
			if (StringUtils.isNotBlank(shippingResponse)) {
				JSONObject shippingResultJson = new JSONObject(shippingResponse);
				trackingNumber = shippingResultJson.getJSONObject("ShipmentResponse").getJSONObject("ShipmentResults")
						.getString("ShipmentIdentificationNumber");
				LOGGER.debug("trackingNumber [ " + trackingNumber + " ]");
			}
			return trackingNumber;
		} catch (Exception e) {
			LOGGER.error("Error fetching tracking Number", e);
		}
		return trackingNumber;
	}

	/**
	 * 
	 * @param orderShipment
	 * @param productIds
	 * @throws Exception
	 */
	public void saveShipping(OrderShipment orderShipment, Collection<String> productIds) throws Exception {
		Connection connection = null;
		try {
			connection = DBHelper.getConn();
			connection.setAutoCommit(false);
			new OrderShippingDAO().save(connection, orderShipment);
			new ShippingProductsDAO().save(connection, orderShipment.getId(), productIds);
			connection.commit();

		} finally {
			DbUtils.closeQuietly(connection);
		}
	}

	/**
	 * 
	 * @param shippingRequest
	 */
	private void validateShipmentRequest(ShippingRequest shippingRequest) {
		if (shippingRequest.getFromAddress() == null || shippingRequest.getToAddress() == null) {
			LOGGER.debug("Address is blank");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS,
					"Address Cannot Be Blank", Status.BAD_REQUEST));
		}
		/*if (StringUtils.isBlank(shippingRequest.getMerchantID())) {
			LOGGER.debug("Merchant ID is blank");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS,
					"Merchant ID Is Empty", Status.BAD_REQUEST));
		}
		if (shippingRequest.getProductIds() == null) {
			LOGGER.debug("shipping products are empty");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS,
					"Products Are Mandatory For Shipping", Status.BAD_REQUEST));
		}*/
	}

}
