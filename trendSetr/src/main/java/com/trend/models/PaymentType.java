package com.trend.models;

import java.util.ArrayList;

import com.trend.utils.DataLog;

public class PaymentType extends DataLog{
	private String id;
	private String userId;
	private String cardName;
	private String cardNumber;
	private String expirationDate;
	private String cardType;
	ArrayList<Object> billingAddress;
	
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
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public ArrayList<Object> getBillingAddress() {
		return billingAddress;
	}
	public void setBillingAddress(ArrayList<Object> billingAddress) {
		this.billingAddress = billingAddress;
	}
	

}
