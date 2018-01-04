package com.trend.serviceinf;

import java.util.ArrayList;


import com.trend.models.Merchant;
import com.trend.models.ShippingBean;

public interface MerchantServiceInf {
	
	String add(Merchant merchant);

	String update(Merchant merchant);

	ArrayList<Merchant> retrieve(String merchantId);

	ArrayList<Merchant> retrieveAll();

	String addShippingMerchantDetails(ShippingBean shippingBean);


}
