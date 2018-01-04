package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.models.ProductVariant;

public interface ProductVariantServiceInf {
	
	String add(ProductVariant productVariant);

	String update(ProductVariant productVariant);

	ArrayList<ProductVariant> retrieve(String productVariantId);

	ArrayList<ProductVariant> retrieveAll();

}
