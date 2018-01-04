package com.trend.models;

import java.util.ArrayList;

import com.trend.utils.DataLog;

public class Merchant extends DataLog{
	private String id;
	private String userId;
	private String storeName;
	private String uploadImage;
	private String profileImage;
	private String bannerImage;
	ArrayList<Object> priorities;
	ArrayList<Object> aboutImages;
	private String story;
	private String mission;
	

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public String getMission() {
		return mission;
	}

	public void setMission(String mission) {
		this.mission = mission;
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

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getUploadImage() {
		return uploadImage;
	}

	public void setUploadImage(String uploadImage) {
		this.uploadImage = uploadImage;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getBannerImage() {
		return bannerImage;
	}

	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}

	public ArrayList<Object> getPriorities() {
		return priorities;
	}

	public void setPriorities(ArrayList<Object> priorities) {
		this.priorities = priorities;
	}

	public ArrayList<Object> getAboutImages() {
		return aboutImages;
	}

	public void setAboutImages(ArrayList<Object> aboutImages) {
		this.aboutImages = aboutImages;
	}

	
	
}
