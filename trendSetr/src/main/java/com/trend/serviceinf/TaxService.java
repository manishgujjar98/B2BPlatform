package com.trend.serviceinf;

import com.taxjar.model.taxes.TaxResponse;
import com.trend.exceptions.TaxjarException;
import com.trend.models.TaxRequest;
import com.trend.models.TaxRequestBean;

public interface TaxService {
	TaxResponse getTax(TaxRequestBean taxrequest) throws TaxjarException;
}
