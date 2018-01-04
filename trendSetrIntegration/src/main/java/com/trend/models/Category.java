package com.trend.models;

public class Category extends DataLog{

	private String id;
	private String categoryName;
	private String parentId;
	private String description;
	private String menImage;
	private String womenImage;
	
	public String getMenImage() {
		return menImage;
	}

	public void setMenImage(String menImage) {
		this.menImage = menImage;
	}

	public String getWomenImage() {
		return womenImage;
	}

	public void setWomenImage(String womenImage) {
		this.womenImage = womenImage;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
