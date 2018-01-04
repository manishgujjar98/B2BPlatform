package com.trend.models;

import java.sql.Date;

public class MerchantBid {
	
	private String id ;
	private String userId;
	private String bidId;
	private Double bidPrice;
	private Boolean bidApproval;
	private Date biddedOn;
	private Date approvedOn;
	private String merchantBidImage;
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
	public String getBidId() {
		return bidId;
	}
	public void setBidId(String bidId) {
		this.bidId = bidId;
	}
	public Double getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(Double bidPrice) {
		this.bidPrice = bidPrice;
	}
	public Boolean getBidApproval() {
		return bidApproval;
	}
	public void setBidApproval(Boolean bidApproval) {
		this.bidApproval = bidApproval;
	}
	public Date getBiddedOn() {
		return biddedOn;
	}
	public void setBiddedOn(Date biddedOn) {
		this.biddedOn = biddedOn;
	}
	public Date getApprovedOn() {
		return approvedOn;
	}
	public void setApprovedOn(Date approvedOn) {
		this.approvedOn = approvedOn;
	}
	public String getMerchantBidImage() {
		return merchantBidImage;
	}
	public void setMerchantBidImage(String merchantBidImage) {
		this.merchantBidImage = merchantBidImage;
	}
	
	

}
