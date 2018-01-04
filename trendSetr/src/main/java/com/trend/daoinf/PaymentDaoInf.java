package com.trend.daoinf;

import com.trend.exceptions.PersistException;
import com.trend.models.Payment;

public interface PaymentDaoInf {

	public String addPaymentInfo(Payment payment) throws PersistException;

}
