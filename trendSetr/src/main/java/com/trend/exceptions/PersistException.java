package com.trend.exceptions;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response;

@SuppressWarnings("serial")
public class PersistException extends WebApplicationException {
	public PersistException()
    {
        super(Response.Status.SERVICE_UNAVAILABLE);
    }
}
