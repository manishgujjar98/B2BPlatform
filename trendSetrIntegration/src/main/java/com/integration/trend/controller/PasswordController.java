package com.integration.trend.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.trend.models.User;

/**
 * Servlet implementation class PasswordController
 */
public class PasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("emailInput");
		if(email != null && email != ""){
			System.out.println("Test");
			request.getRequestDispatcher("changePasswordEmailLink.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
		}
			
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("emailInput") != null && request.getParameter("emailInput") != ""){
			Client client = Client.create();
			WebResource webResource = client
					.resource("https://business.trendsetr.com/trendSetr/rest/user/getuser/get/" + request.getParameter("emailInput"));

			System.out.println("https://business.trendsetr.com/trendSetr/rest/user/getuser/get/" + request.getParameter("emailInput"));

			String input = "{\"userId\":\"" + request.getParameter("emailInput") + "\"}";

			System.out.println(input);

			ClientResponse clientResponse = webResource.header("Content-Type", "application/json;charset=UTF-8")
					.post(ClientResponse.class, input);
			String output = clientResponse.getEntity(String.class);

			System.out.println("**** : " + output);

			User user = new User();
			TypeToken<User> token = new TypeToken<User>() {
			};

			try {
				user = gson.fromJson(output, token.getType());
			} catch (Exception e) {

				user = null;
			}
			
			if(user != null){
				if(user.getUserStatus().equals("USER_FOUND")){
					request.setAttribute("msg", " <i>Reset Password successfully sent your registered Email</i> ");
					
				}else if (user.getUserStatus().equals("USER_NOT_FOUND")){
					request.setAttribute("msg", " <i>Please enter authorised Email</i> ");
				}
				RequestDispatcher rd = request.getRequestDispatcher("./forgotPassword.jsp");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("./forgotPassword.jsp");
				rd.forward(request, response);
			}
		}
		
		
		
	}

}
