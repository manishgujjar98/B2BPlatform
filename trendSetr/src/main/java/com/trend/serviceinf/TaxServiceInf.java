package com.trend.serviceinf;

import org.codehaus.jettison.json.JSONException;

import com.taxjar.exception.TaxjarException;
import com.taxjar.model.taxes.TaxResponse;
import com.trend.exceptions.PersistException;
import com.trend.models.TaxRequestBean;

public interface TaxServiceInf {
	public TaxResponse getTax(TaxRequestBean taxRequest) throws PersistException, JSONException, TaxjarException;
	
}
