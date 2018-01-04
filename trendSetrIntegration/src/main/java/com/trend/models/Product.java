package com.trend.models;

import java.util.ArrayList;

public class Product extends DataLog {
	private String id;
	private String name;
	private String categoryId;
	private String description;
	private String subcategoryId;
	private String categoryName; // This is for Database Query from categories table
	private String gender;
	private ProductImages productImages;
	private ProductVariant productVariant;
	private ArrayList<MerchantProducts> merchantProductList;
	private ArrayList<ProductVariant> productVariantList;
	private ArrayList<ProductImages> productImagesList;

	public ProductImages getProductImages() {
		return productImages;
	}

	public void setProductImages(ProductImages productImages) {
		this.productImages = productImages;
	}

	public ProductVariant getProductVariant() {
		return productVariant;
	}

	public void setProductVariant(ProductVariant productVariant) {
		this.productVariant = productVariant;
	}

	public ArrayList<ProductImages> getProductImagesList() {
		return productImagesList;
	}

	public void setProductImagesList(ArrayList<ProductImages> productImagesList) {
		this.productImagesList = productImagesList;
	}

	public ArrayList<ProductVariant> getProductVariantList() {
		return productVariantList;
	}

	public void setProductVariantList(ArrayList<ProductVariant> productVariantList) {
		this.productVariantList = productVariantList;
	}

	public ArrayList<MerchantProducts> getMerchantProductList() {
		return merchantProductList;
	}

	public void setMerchantProductList(ArrayList<MerchantProducts> merchantProductList) {
		this.merchantProductList = merchantProductList;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

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

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSubcategoryId() {
		return subcategoryId;
	}

	public void setSubcategoryId(String subcategoryId) {
		this.subcategoryId = subcategoryId;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}
