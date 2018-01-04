package com.trend.models;

import java.sql.Date;
import java.util.List;

public class Orders {
	
	private String id;
	public String getMerchantId() {
		return merchantId;
	}
	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}
	private String merchantId;
	private String userId;
	private String addressId;
	private String orderStatus;
	private String totalCost;
	private String creditCost;
	private String totalPayingAmount;
	private Date createdTime;
	private Date modifiedTime;
	//private String productName;
	private List<OrderItems> orderItemList;
	
	public List<OrderItems> getOrderItemList() {
		return orderItemList;
	}
	public void setOrderItemList(List<OrderItems> orderItemList) {
		this.orderItemList = orderItemList;
	}
	private String price;
	private Address address;
	private User user;
	private Product product;
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
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
