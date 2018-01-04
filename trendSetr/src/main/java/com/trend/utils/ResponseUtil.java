package com.trend.utils;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import com.trend.response.CustomResponse;

public class ResponseUtil {
	
	public static final String STATUS = "status";
	public static final String MESSAGE = "message";
	

	/**
	 * 
	 * @param status
	 * @param message
	 * @param statusHeader
	 * @return
	 */
	public static Response constructResponse(String status, String message, Status statusHeader) {
		CustomResponse response = new CustomResponse(status, message);
		String responseJSON = Constants.GSON.toJson(response);
		return Response.status(statusHeader).entity(responseJSON.toString()).type(MediaType.APPLICATION_JSON_TYPE).build();
	}
	
	
}