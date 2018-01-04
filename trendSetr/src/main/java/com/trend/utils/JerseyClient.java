package com.trend.utils;

import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;

public class JerseyClient {

	private static final Logger LOGGER = Logger.getLogger(JerseyClient.class);

	private static final Client CLIENT = Client.create();

	public static String get(String url) {
		String response = null;
		try {
			ClientResponse responseEntity = CLIENT.resource(url).accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
			response = responseEntity.getEntity(String.class);
		} catch (Exception e) {
			LOGGER.error("Error calling target URL [ " + url + " ]", e);
		}
		return response;
	}

	public static String post(String url, String payload) {
		String response = null;
		try {
			ClientResponse responseEntity = CLIENT.resource(url).accept(MediaType.APPLICATION_JSON)
					.post(ClientResponse.class,payload);
			System.out.println(responseEntity.getStatus());
			response = responseEntity.getEntity(String.class);
		} catch (Exception e) {
			LOGGER.error("Error calling target URL [ " + url + " ]", e);
		}
		return response;
	}

	public static String put(String url, String payload) {
		String response = null;
		try {
			ClientResponse responseEntity = CLIENT.resource(url).accept(MediaType.APPLICATION_JSON)
					.put(ClientResponse.class,payload);
			response = responseEntity.getEntity(String.class);
		} catch (Exception e) {
			LOGGER.error("Error calling target URL [ " + url + " ]", e);
		}
		return response;
	}

}
