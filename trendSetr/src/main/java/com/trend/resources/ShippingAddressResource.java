package com.trend.resources;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response.Status;

import org.apache.log4j.Logger;

import com.trend.models.Address;
import com.trend.utils.Constants;
import com.trend.utils.ResponseUtil;
import com.trendset.util.services.ShipingAddressValidator;

@Path("shipping/address")
public class ShippingAddressResource {
	
	private static final Logger LOGGER = Logger.getLogger(ShippingAddressResource.class);
	
	@POST
	public String create(Address address) {
		try {
			return new ShipingAddressValidator().validateAddress(address);
		}catch (Exception e) {
			LOGGER.error("", e);
			if (e instanceof WebApplicationException) {
				throw new WebApplicationException(((WebApplicationException) e).getResponse());
			}
			throw new WebApplicationException(
					ResponseUtil.constructResponse(Constants.FAILURE_STATUS, e.getMessage(), Status.PRECONDITION_FAILED));
		}
	}

}
