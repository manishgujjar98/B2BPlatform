package com.trend.resources;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.codehaus.jettison.json.JSONException;

import com.sun.istack.logging.Logger;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.TaxjarException;
import com.trend.models.Address;
import com.trend.models.TaxRequestBean;
import com.trend.serviceimpl.MerchantServiceImpl;
import com.trend.serviceimpl.TaxServiceImpl;
import com.trend.serviceinf.TaxService;

@Path("/tax")
public class TaxResource {
	// private TaxService taxService;

	TaxServiceImpl taxService = new TaxServiceImpl();

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/taxForOrder")
	public com.taxjar.model.taxes.TaxResponse getTaxCal(TaxRequestBean taxRequest) throws JSONException, com.taxjar.exception.TaxjarException {
		System.out.println("TEST Tax Resource"+taxRequest.getAmount());
		
		return taxService.getTax(taxRequest);

	}
}
