package com.trend.models;

import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jettison.json.JSONObject;

import com.google.gson.JsonObject;

@XmlRootElement
public class OrderShipment {
	
	private String id ;
	
	private String orderID;
	
	private String trackingID;
	
	private String status;
	
	private String shippingResponse;

	public String getShippingResponse() {
		return shippingResponse;
	}

	public void setShippingResponse(String shippingResponse) {
		this.shippingResponse = shippingResponse;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public String getTrackingID() {
		return trackingID;
	}

	public void setTrackingID(String trackingID) {
		this.trackingID = trackingID;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


}
