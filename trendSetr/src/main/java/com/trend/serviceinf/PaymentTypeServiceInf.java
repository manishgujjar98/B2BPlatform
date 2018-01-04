package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.models.PaymentType;

public interface PaymentTypeServiceInf {
	
	String add(PaymentType paymentType);

	String update(PaymentType paymentType);

	ArrayList<PaymentType> retrieve(String paymentTypeId);

	ArrayList<PaymentType> retrieveAll();

}
