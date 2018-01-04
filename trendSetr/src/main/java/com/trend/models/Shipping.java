package com.trend.models;

public class Shipping {
	
	private String id;
	
	private String title;
	
	private String lenght;
	
	private String width;
	
	private String height;
	
	public String getMerchant_percent() {
		return merchant_percent;
	}

	public void setMerchant_percent(String merchant_percent) {
		this.merchant_percent = merchant_percent;
	}

	private String merchant_percent;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLenght() {
		return lenght;
	}

	public void setLenght(String lenght) {
		this.lenght = lenght;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}
	
	

}
