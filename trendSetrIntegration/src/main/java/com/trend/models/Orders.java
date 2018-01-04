package com.trend.models;

import java.sql.Date;

public class Orders {
	
	private String id;
	private String userId;
	private String addressId;
	private String orderStatus;
	private String totalCost;
	private String creditCost;
	private String totalPayingAmount;
	private Date createdTime;
	private Date modifiedTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAddressId() {
		return addressId;
	}
	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(String totalCost) {
		this.totalCost = totalCost;
	}
	public String getCreditCost() {
		return creditCost;
	}
	public void setCreditCost(String creditCost) {
		this.creditCost = creditCost;
	}
	public String getTotalPayingAmount() {
		return totalPayingAmount;
	}
	public void setTotalPayingAmount(String totalPayingAmount) {
		this.totalPayingAmount = totalPayingAmount;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public Date getModifiedTime() {
		return modifiedTime;
	}
	public void setModifiedTime(Date modifiedTime) {
		this.modifiedTime = modifiedTime;
	}
	

}
