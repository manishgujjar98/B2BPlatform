package com.trend.models;

import java.util.HashSet;
import java.util.Set;

public class ShippingRequest {
	
	private String id;
	
	private Address fromAddress;
	
	private Address toAddress;
	
	private PackageInfo packageInfo;
	
	private Set<String> productIds;
	
	private String orderID;
	
	private String merchantID;
	
	private PickUP pickUP;
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Address getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(Address fromAddress) {
		this.fromAddress = fromAddress;
	}

	public Address getToAddress() {
		return toAddress;
	}

	public void setToAddress(Address toAddress) {
		this.toAddress = toAddress;
	}

	public PackageInfo getPackageInfo() {
		return packageInfo;
	}

	public void setPackageInfo(PackageInfo packageInfo) {
		this.packageInfo = packageInfo;
	}

	public Set<String> getProductIds() {
		if(productIds == null){
			productIds = new HashSet<>();
		}
		return productIds;
	}

	public void setProductIds(Set<String> productIds) {
		this.productIds = productIds;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public String getMerchantID() {
		return merchantID;
	}

	public void setMerchantID(String merchantID) {
		this.merchantID = merchantID;
	}
	
	public PickUP getPickUP() {
		return pickUP;
	}

	public void setPickUP(PickUP pickUP) {
		this.pickUP = pickUP;
	}

	public static class PickUP {
		private String closeTime;
		private String readyTime;
		private String pickupDate;
		private String quantity;
		
		public String getCloseTime() {
			return closeTime;
		}
		public void setCloseTime(String closeTime) {
			this.closeTime = closeTime;
		}
		public String getReadyTime() {
			return readyTime;
		}
		public void setReadyTime(String readyTime) {
			this.readyTime = readyTime;
		}
		public String getPickupDate() {
			return pickupDate;
		}
		public void setPickupDate(String pickupDate) {
			this.pickupDate = pickupDate;
		}
		public String getQuantity() {
			return quantity;
		}
		public void setQuantity(String quantity) {
			this.quantity = quantity;
		}
	}

}
