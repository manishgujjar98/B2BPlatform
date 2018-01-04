package com.trend.models;

import java.sql.Date;

public class OrderItems {
	
  private String orderItemId;
  private String orderStatus;
  private String productPrice;
  private String  quantity;
  private Date createdTime;
  private Date modifiedTime;
  private Product product;;
  
  
  
public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
public String getOrderItemId() {
	return orderItemId;
}
public void setOrderItemId(String orderItemId) {
	this.orderItemId = orderItemId;
}
public String getOrderStatus() {
	return orderStatus;
}
public void setOrderStatus(String orderStatus) {
	this.orderStatus = orderStatus;
}
public String getProductPrice() {
	return productPrice;
}
public void setProductPrice(String productPrice) {
	this.productPrice = productPrice;
}
public String getQuantity() {
	return quantity;
}
public void setQuantity(String quantity) {
	this.quantity = quantity;
}
public Date getCreatedTime() {
	return createdTime;
}
public void setCreatedTime(Date createdTime) {
	this.createdTime = createdTime;
}
public Date getModifiedTime() {
	return modifiedTime;
}
public void setModifiedTime(Date modifiedTime) {
	this.modifiedTime = modifiedTime;
}

}
