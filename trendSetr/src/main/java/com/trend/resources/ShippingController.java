package com.trend.resources;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response.Status;

import org.apache.log4j.Logger;

import com.sun.jersey.spi.resource.Singleton;
import com.trend.models.OrderShipment;
import com.trend.models.ShippingRequest;
import com.trend.serviceimpl.ShippingServiceImpl;
import com.trend.utils.Constants;
import com.trend.utils.ResponseUtil;
import com.trendset.util.services.ShippingRateService;

@Path("/orders/{orderId}/shippings")
@Singleton
@Produces(MediaType.APPLICATION_JSON)
public class ShippingController {

	private static final Logger LOGGER = Logger.getLogger(ShippingController.class);

	/**
	 * Service to create a new shipping for an order
	 * 
	 * @return
	 */
	@POST
	@Path("/rate")
	public String create(@PathParam("orderId") String orderId, ShippingRequest shippingRequest) {
		try {
			if (shippingRequest == null) {
				LOGGER.debug("Shipping request is blank");
				throw new WebApplicationException(
						ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Invalid request", Status.BAD_REQUEST));
			}
			shippingRequest.setOrderID(orderId);
			return new ShippingRateService().calculate(shippingRequest);
		} catch (Exception e) {
			LOGGER.error("", e);
			if (e instanceof WebApplicationException) {
				throw new WebApplicationException(((WebApplicationException) e).getResponse());
			}
			throw new WebApplicationException(
					ResponseUtil.constructResponse(Constants.FAILURE_STATUS, e.getMessage(), Status.PRECONDITION_FAILED));
		}
	}
	
	@POST
	public OrderShipment rate(@PathParam("orderId") String orderId, ShippingRequest shippingRequest) {
		try {
			if (shippingRequest == null) {
				LOGGER.debug("Shipping request is blank");
				throw new WebApplicationException(
						ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Invalid request", Status.BAD_REQUEST));
			}
			shippingRequest.setOrderID(orderId);
			System.out.println("manish"+shippingRequest.getOrderID());
			
			return new ShippingServiceImpl().createShipment(shippingRequest);
		} catch (Exception e) {
			LOGGER.error("", e);
			if (e instanceof WebApplicationException) {
				throw new WebApplicationException(((WebApplicationException) e).getResponse());
			}
			throw new WebApplicationException(
					ResponseUtil.constructResponse(Constants.FAILURE_STATUS, e.getMessage(), Status.PRECONDITION_FAILED));
		}
	}

	@POST
	@Path("/{shippingID}/pickup")
	public String pickUP(@PathParam("orderId") String orderId, @PathParam("shippingID") String shippingId,
			ShippingRequest shippingRequest) {
		try {
			if (shippingRequest == null) {
				LOGGER.debug("Shipping request is blank");
				throw new WebApplicationException(
						ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Invalid request", Status.BAD_REQUEST));
			}
			shippingRequest.setOrderID(orderId);
			shippingRequest.setId(shippingId);
			return new ShippingServiceImpl().pickUP(shippingRequest);
		} catch (Exception e) {
			LOGGER.error("", e);
			if (e instanceof WebApplicationException) {
				throw new WebApplicationException(((WebApplicationException) e).getResponse());
			}
			throw new WebApplicationException(
					ResponseUtil.constructResponse(Constants.FAILURE_STATUS, e.getMessage(), Status.PRECONDITION_FAILED));
		}

	}

	/**
	 * 
	 * @param orderId
	 * @param shippingID
	 * @return
	 */
	@GET
	@Path("{shippingID}/track")
	public String trackShipment(@PathParam("orderId") String orderId, @PathParam("shippingID") String shippingID) {
		try {
			return new ShippingServiceImpl().trackShipment(shippingID, orderId);
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
