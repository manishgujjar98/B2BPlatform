package com.integration.trend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JSPController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requri = request.getRequestURI().substring(request.getContextPath().length() + 1);
	    System.out.println("requuri="+requri);
		//request.getRequestDispatcher("/WEB-INF/"+requri).forward(request, response);	
	}
}
