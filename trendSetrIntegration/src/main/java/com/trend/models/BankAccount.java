package com.trend.models;

public class BankAccount extends DataLog{
	
	private String id;
	private String userId; 
	private String bankName;
	private String accountNumber;
	private String routingNumber;
	private String name;
	private Boolean defaultAccount;
	
	
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
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getRoutingNumber() {
		return routingNumber;
	}
	public void setRoutingNumber(String routingNumber) {
		this.routingNumber = routingNumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getDefaultAccount() {
		return defaultAccount;
	}
	public void setDefaultAccount(Boolean defaultAccount) {
		this.defaultAccount = defaultAccount;
	}
	
	

}
