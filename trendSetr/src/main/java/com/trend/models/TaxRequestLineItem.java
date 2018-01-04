package com.trend.models;

public class TaxRequestLineItem {
	private int id;
    private int quantity;
    private String product_tax_code;
    private double unit_price;
    private int discount;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getProduct_tax_code() {
		return product_tax_code;
	}
	public void setProduct_tax_code(String product_tax_code) {
		this.product_tax_code = product_tax_code;
	}
	public double getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
    

}
