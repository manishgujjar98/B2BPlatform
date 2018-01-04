package com.trend.exceptions;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

public class ErrorResponseUtil {

	public static void sendErrorResponse(String message, final Response.Status status) {
		ResponseBuilder responseBuilder = Response.status(status);
		Response response = responseBuilder.entity(message).build();		
		throw new WebApplicationException(response);
	}
	
	
}
