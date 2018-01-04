package com.trend.resources;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response.Status;

import org.apache.log4j.Logger;

import com.sun.jersey.spi.resource.Singleton;
import com.trend.models.ShippingRequest;
import com.trend.serviceimpl.StoreLocatorServiceImpl;
import com.trend.utils.Constants;
import com.trend.utils.ResponseUtil;

@Path("/stores")
@Singleton
@Produces(MediaType.APPLICATION_JSON)
public class StoreLocatorController {
	
	private static final Logger LOGGER = Logger.getLogger(StoreLocatorController.class);
	
	@POST
	public String create(ShippingRequest shippingRequest) {
		try {
			if (shippingRequest == null) {
				LOGGER.debug("Shipping request is blank");
				throw new WebApplicationException(
						ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Invalid request", Status.BAD_REQUEST));
			}
			return new StoreLocatorServiceImpl().locate(shippingRequest);
		} catch (Exception e) {
			LOGGER.error("", e);
			if (e instanceof WebApplicationException) {
				throw new WebApplicationException(((WebApplicationException) e).getResponse());
			}
			throw new WebApplicationException(
					ResponseUtil.constructResponse(Constants.FAILURE_STATUS, e.getMessage(), Status.PRECONDITION_FAILED));
		}
	}

}
