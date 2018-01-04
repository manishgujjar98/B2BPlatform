package com.trend.models;

import java.util.List;


public class TaxRequestBean {
	private TaxRequestAddress address;
	private List<TaxRequestLineItem> lineItems;
	private Double amount;
	private Double shipping;
	
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public Double getShipping() {
		return shipping;
	}
	public void setShipping(Double shipping) {
		this.shipping = shipping;
	}
	public TaxRequestAddress getAddress() {
		return address;
	}
	public void setAddress(TaxRequestAddress address) {
		this.address = address;
	}
	public List<TaxRequestLineItem> getLineItems() {
		return lineItems;
	}
	public void setLineItems(List<TaxRequestLineItem> lineItems) {
		this.lineItems = lineItems;
	}

}
