package com.trend.models;

import java.util.ArrayList;

import com.trend.utils.DataLog;



public class Collection extends DataLog{

	private String id;
	private String name;
	private String bannerImage;
	private ArrayList<Object> priorityList;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBannerImage() {
		return bannerImage;
	}
	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}
	public ArrayList<Object> getPriorityList() {
		return priorityList;
	}
	public void setPriorityList(ArrayList<Object> priorityList) {
		this.priorityList = priorityList;
	}
	
	
	
	
}
