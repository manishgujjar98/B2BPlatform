package com.trend.models;

import com.trend.utils.DataLog;

public class ProductVariant extends DataLog{

	private String id;
	private String productId;
	private String skuId;
	private Double price;
	private Double weight;
	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	private String size;
	private String colour;
	private int quantity;
	private int addStock;
	private int removeStock;
	

	public int getRemoveStock() {
		return removeStock;
	}

	public void setRemoveStock(int removeStock) {
		this.removeStock = removeStock;
	}

	public int getAddStock() {
		return addStock;
	}

	public void setAddStock(int addStock) {
		this.addStock = addStock;
	}
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColour() {
		return colour;
	}

	public void setColour(String colour) {
		this.colour = colour;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	

}
