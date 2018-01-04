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
 * Servlet implementation class UpdateController
 */
public class UpdateController extends HttpServlet {
	private Gson gson = new Gson();
	private static final long serialVersionUID = 1L;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("storeName"));
		System.out.println(request.getParameter("eMail"));
		System.out.println(request.getParameter("currentPassword"));
		System.out.println(request.getParameter("updatePassword"));
		
		//////////////////////////////////////////////////////////////
		
		Client client = Client.create();

		  WebResource webResource = client.resource("https://business.trendsetr.com/trendSetr/rest/user/update/changePassword");
		  
		  
		  String input = "{\"userId\":\""+request.getParameter("eMail")+"\",\"newPassword\":\""
				  +request.getParameter("updatePassword")+"\",\"password\":\""
		  +request.getParameter("currentPassword")+"\",\"profile\":{\"userId\":\""
				  +request.getParameter("eMail")+"\",\"storeName\":\""
						  +request.getParameter("storeName")
		  +"\"}}";
		  
		  System.out.println(input);
		  
		  ClientResponse clientResponse = webResource.header("Content-Type","application/json;charset=UTF-8").put(ClientResponse.class,input);
		  
		  System.out.println(clientResponse.getStatus());
		 
		  String output =clientResponse.getEntity(String.class);
		  
		  System.out.println("**** : "+output);
		  
		  User user = new User();
		  
		  TypeToken<User> token = new TypeToken<User>(){};
		  
		  user = gson.fromJson(output, token.getType());
		
		 
		 System.out.println( " Role Id of the person : " +user.getRoleId());
		  
		  HttpSession session = request.getSession();
		  
		  //System.out.println(user.getPassword() + " " + user.getUserId() +" " + user.getRoleId());
		  
			  if (user.getUserId() != null) {
			  			if ("1".equals(user.getRoleId())) {
			  				session.setAttribute("user", user);
			  				session.setAttribute("firstName", user.getFirstName());
			  				session.setAttribute("lastName", user.getLastName());
			  				session.setAttribute("roleId", user.getRoleId());
			  				session.setAttribute("userId", user.getUserId());
			  				//System.out.println("Store Nme **** -> "+user.getProfile().getStoreName());
			  				//session.setAttribute("storeName", user.getProfile().getStoreName());
			  				response.sendRedirect("./admin/adminDashboard.jsp");
			  			} else if ("2".equals(user.getRoleId())) {
			  				session.setAttribute("user", user);
			  				session.setAttribute("firstName", user.getFirstName());
			  				session.setAttribute("lastName", user.getLastName());
			  				session.setAttribute("roleId", user.getRoleId());
			  				session.setAttribute("userId", user.getUserId());
			  				//System.out.println("Store Nme **** -> "+user.getProfile().getStoreName());
			  				//session.setAttribute("storeName", user.getProfile().getStoreName());
			  				response.sendRedirect("./customer/userProfile.jsp");
			  			} else if ("3".equals(user.getRoleId())) {
			  				session.setAttribute("user", user);
			  				session.setAttribute("firstName", user.getFirstName());
			  				session.setAttribute("lastName", user.getLastName());
			  				session.setAttribute("roleId", user.getRoleId());
			  				session.setAttribute("userId", user.getUserId());
			  				System.out.println("Store Nme **** -> "+user.getUserStatus());
			  				session.setAttribute("currentPasswordDescription", user.getUserStatus());
			  				//System.out.println("Store Nme **** -> "+user.getProfile().getStoreName());
			  				//session.setAttribute("storeName", user.getProfile().getStoreName());
			  				response.sendRedirect("./merchant/accountSettings.jsp");
			  				
			  			} else if ("4".equals(user.getRoleId())) {
			  				session.setAttribute("user", user);
			  				session.setAttribute("firstName", user.getFirstName());
			  				session.setAttribute("lastName", user.getLastName());
			  				session.setAttribute("roleId", user.getRoleId());
			  				session.setAttribute("userId", user.getUserId());
			  				//System.out.println("Store Nme **** -> "+user.getProfile().getStoreName());
			  				//session.setAttribute("storeName", user.getProfile().getStoreName());
			  				response.sendRedirect("./admin/adminDashboard.jsp");
			  			} else if ("5".equals(user.getRoleId())) {
			  				session.setAttribute("user", user);
			  				session.setAttribute("firstName", user.getFirstName());
			  				session.setAttribute("lastName", user.getLastName());
			  				session.setAttribute("roleId", user.getRoleId());
			  				session.setAttribute("userId", user.getUserId());
			  				//System.out.println("Store Nme **** -> "+user.getProfile().getStoreName());
			  				//session.setAttribute("storeName", user.getProfile().getStoreName());
			  				response.sendRedirect("./customer/userProfile.jsp");
			  			}
			  		} else {
			  			request.setAttribute("msg", " <i>User Doesn't Exist !!!</i> ");
			  			RequestDispatcher rd = request.getRequestDispatcher("./loginPage.jsp");
			  			rd.forward(request, response);

			  		}
		
		
		//////////////////////////////////////////////////////////////
		
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}