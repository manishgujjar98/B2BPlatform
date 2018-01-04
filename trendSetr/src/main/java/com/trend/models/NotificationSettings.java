package com.trend.models;

public class NotificationSettings {
 
	private boolean dailyPerformance;
	private boolean accountChanges;
	private boolean trendSetrPromos;
	private boolean customerDirectMessages;
	private String userId;
	
	public boolean isDailyPerformance() {
		return dailyPerformance;
	}
	public void setDailyPerformance(boolean dailyPerformance) {
		this.dailyPerformance = dailyPerformance;
	}
	public boolean isAccountChanges() {
		return accountChanges;
	}
	public void setAccountChanges(boolean accountChanges) {
		this.accountChanges = accountChanges;
	}
	public boolean isTrendSetrPromos() {
		return trendSetrPromos;
	}
	public void setTrendSetrPromos(boolean trendSetrPromos) {
		this.trendSetrPromos = trendSetrPromos;
	}
	public boolean isCustomerDirectMessages() {
		return customerDirectMessages;
	}
	public void setCustomerDirectMessages(boolean customerDirectMessages) {
		this.customerDirectMessages = customerDirectMessages;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
}
