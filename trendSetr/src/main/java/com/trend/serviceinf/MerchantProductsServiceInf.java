package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.models.MerchantProducts;

public interface MerchantProductsServiceInf {

	String add(MerchantProducts merchantProducts);

/*	String update(MerchantProducts merchantProducts);*/

	ArrayList<MerchantProducts> retrieve(MerchantProducts merchantProducts);

	ArrayList<MerchantProducts> retrieveAll();

}
