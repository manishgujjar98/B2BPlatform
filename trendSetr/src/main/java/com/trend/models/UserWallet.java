package com.trend.models;

import com.trend.utils.DataLog;

public class UserWallet extends DataLog{
	private String id;
	private String userId;
	private Double totalEarnings;
	
	
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
	public Double getTotalEarnings() {
		return totalEarnings;
	}
	public void setTotalEarnings(Double totalEarnings) {
		this.totalEarnings = totalEarnings;
	}
	
}
