package com.trend.models;

import com.trend.utils.DataLog;

public class Earnings extends DataLog{
	
	private String id;
	private String userId;
	private Double amount;
	private String earnedFrom; 
	private String productId;
	private Double earnedShare;
	
	
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
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getEarnedFrom() {
		return earnedFrom;
	}
	public void setEarnedFrom(String earnedFrom) {
		this.earnedFrom = earnedFrom;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public Double getEarnedShare() {
		return earnedShare;
	}
	public void setEarnedShare(Double earnedShare) {
		this.earnedShare = earnedShare;
	}


}
