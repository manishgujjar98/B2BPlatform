package com.trend.models;

import java.util.List;

public class ShippingBean {
	
	private String userId;
	
	private List<Shipping> shipping;
	
	private String merchantPercent;

	public String getMerchantPercent() {
		return merchantPercent;
	}

	public void setMerchantPercent(String merchantPercent) {
		this.merchantPercent = merchantPercent;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<Shipping> getShipping() {
		return shipping;
	}

	public void setShipping(List<Shipping> shipping) {
		this.shipping = shipping;
	}
	
	

}
