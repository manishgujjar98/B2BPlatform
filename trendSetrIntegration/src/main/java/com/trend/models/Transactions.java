package com.trend.models;

import java.sql.Date;
import java.util.ArrayList;

public class Transactions {

	private String id;
	private String userId;
	private String sourceId;
	private String sourceType;
	private String type;
	private String destinationId;
	private String destinationType;
	private String status;
	private ArrayList<Object> statusResponse;
	private Date transactionDate;
	private Double amount;
	
	public String getDestinationId() {
		return destinationId;
	}
	public void setDestinationId(String destinationId) {
		this.destinationId = destinationId;
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
	public String getSourceId() {
		return sourceId;
	}
	public void setSourceId(String sourceId) {
		this.sourceId = sourceId;
	}
	public String getSourceType() {
		return sourceType;
	}
	public void setSourceType(String sourceType) {
		this.sourceType = sourceType;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDestinationType() {
		return destinationType;
	}
	public void setDestinationType(String destinationType) {
		this.destinationType = destinationType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public ArrayList<Object> getStatusResponse() {
		return statusResponse;
	}
	public void setStatusResponse(ArrayList<Object> statusResponse) {
		this.statusResponse = statusResponse;
	}
	public Date getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	
	
	
}
