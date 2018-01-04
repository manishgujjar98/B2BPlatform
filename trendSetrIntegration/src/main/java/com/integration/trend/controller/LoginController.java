package com.integration.trend.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
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
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {

	private Gson gson = new Gson();
	private static final long serialVersionUID = 1L;
	public String message;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			User cuser = checkCookie(request);
			if(cuser != null){

				Client client = Client.create();
				System.out.println("hdnrememberMe : "+ request.getParameter("hdnrememberMe"));
				WebResource webResource = client
						.resource("http://https://business.trendsetr.com/rest/user/" + cuser.getUserId());
						//.resource("http://https://business.trendsetr.com/trendSetr/rest/user/" + cuser.getUserId());

		System.out.println("http://https://business.trendsetr.com/trendSetr/rest/user/" + request.getParameter("username"));

				String input = "{\"userId\":\"" + cuser.getUserId() + "\",\"password\":\""
						+ cuser.getPassword() + "\"}";

				System.out.println(input);

				ClientResponse clientResponse = webResource.header("Content-Type", "application/json;charset=UTF-8")
						.post(ClientResponse.class, input);

				System.out.println(clientResponse.getStatus());

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

		/*if (user == null) {

			user = new User();
			ResponseBuilder responseBuilder = Response.status(Response.Status.FORBIDDEN);
			Response response1 = responseBuilder.entity("Sorry there was some connection problem").build();
			//throw new WebApplicationException(Response.Status.FORBIDDEN);

		}*/
		System.out.println(" Role Id of the person : " + user.getRoleId());

		HttpSession session = request.getSession();

		// System.out.println(user.getPassword() + " " + user.getUserId() +" " +
		// user.getRoleId());

		if (user.getUserId() != null) {
			if ("1".equals(user.getRoleId())) {
				session.setAttribute("user", user);
				session.setAttribute("firstName", user.getFirstName());
				session.setAttribute("lastName", user.getLastName());
				session.setAttribute("roleId", user.getRoleId());
				session.setAttribute("userId", user.getUserId());
				response.sendRedirect("./admin/adminDashboard.jsp");
			} else if ("2".equals(user.getRoleId())) {
				session.setAttribute("user", user);
				session.setAttribute("firstName", user.getFirstName());
				session.setAttribute("lastName", user.getLastName());
				session.setAttribute("roleId", user.getRoleId());
				session.setAttribute("userId", user.getUserId());
				response.sendRedirect("./customer/userProfile.jsp");
			} else if ("3".equals(user.getRoleId())) {
				session.setAttribute("user", user);
				session.setAttribute("firstName", user.getFirstName());
				session.setAttribute("lastName", user.getLastName());
				session.setAttribute("roleId", user.getRoleId());
				session.setAttribute("userId", user.getUserId());
				/*
				 * session.setAttribute("storeName",
				 * user.getProfile().getStoreName());
				 */
				response.sendRedirect("./merchant/merchantDashboard.jsp");
			} else if ("4".equals(user.getRoleId())) {
				session.setAttribute("user", user);
				session.setAttribute("firstName", user.getFirstName());
				session.setAttribute("lastName", user.getLastName());
				session.setAttribute("roleId", user.getRoleId());
				session.setAttribute("userId", user.getUserId());
				response.sendRedirect("./admin/adminDashboard.jsp");
			} else if ("5".equals(user.getRoleId())) {
				session.setAttribute("user", user);
				session.setAttribute("firstName", user.getFirstName());
				session.setAttribute("lastName", user.getLastName());
				session.setAttribute("roleId", user.getRoleId());
				session.setAttribute("userId", user.getUserId());
				response.sendRedirect("./customer/userProfile.jsp");
			}
		} else {
			if(user.getPassword() != null && user.getPassword().equals("PASSWORD_NOT_MATCH"))
				request.setAttribute("msg", " <i>Wrong Password!!!</i> ");
			else
				request.setAttribute("msg", " <i>User Doesn't Exist !!!</i> ");
			RequestDispatcher rd = request.getRequestDispatcher("./loginPage.jsp");
			rd.forward(request, response);

				}
				response.getWriter().append("Served at: ").append(request.getContextPath());
			} else
				request.getRequestDispatcher("loginPage.jsp").forward(request, response);
			

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			Client client = Client.create();
			WebResource webResource = client
					.resource("http://https://business.trendsetr.com/trendSetr/rest/user/" + request.getParameter("username"));

			System.out.println("http://https://business.trendsetr.com/trendSetr/rest/user/" + request.getParameter("username"));

			String input = "{\"userId\":\"" + request.getParameter("username") + "\",\"password\":\""
					+ request.getParameter("password") + "\"}";

			System.out.println(input);

			ClientResponse clientResponse = webResource.header("Content-Type", "application/json;charset=UTF-8")
					.post(ClientResponse.class, input);

			System.out.println(clientResponse.getStatus());

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
//			System.out.println(" Role Id of the person : " + user.getRoleId());

			HttpSession session = request.getSession();

			boolean remember = request.getParameter("rememberMe") != null;
			if (user.getUserId() != null) {
				if (remember) {
					user.setPassword(request.getParameter("password"));
					//setCookie("userName", user.getUserId(), 30 * 60);
					//setCookie("password", user.getPassword(), 30 * 60);
					System.out.println(user.getUserId() +  " *********** " + user.getPassword());
					Cookie cookie = new Cookie("userName", user.getUserId());
					cookie.setMaxAge(30*60); // 30 mins
					response.addCookie(cookie);
					Cookie cookie1 = new Cookie("password", user.getPassword());
					cookie1.setMaxAge(30*60); // 30 mins
					response.addCookie(cookie1);
					
				}
				if ("1".equals(user.getRoleId())) {
					session.setAttribute("user", user);
					session.setAttribute("firstName", user.getFirstName());
					session.setAttribute("lastName", user.getLastName());
					session.setAttribute("roleId", user.getRoleId());
					session.setAttribute("userId", user.getUserId());
					response.sendRedirect("./admin/adminDashboard.jsp");
				} else if ("2".equals(user.getRoleId())) {
					session.setAttribute("user", user);
					session.setAttribute("firstName", user.getFirstName());
					session.setAttribute("lastName", user.getLastName());
					session.setAttribute("roleId", user.getRoleId());
					session.setAttribute("userId", user.getUserId());
					response.sendRedirect("./customer/userProfile.jsp");
				} else if ("3".equals(user.getRoleId())) {
					session.setAttribute("user", user);
					session.setAttribute("firstName", user.getFirstName());
					session.setAttribute("lastName", user.getLastName());
					session.setAttribute("roleId", user.getRoleId());
					session.setAttribute("userId", user.getUserId());
					//session.setAttribute("profileImage", user.getProfile().getProfileImage());
					/*
					 * session.setAttribute("storeName",
					 * user.getProfile().getStoreName());
					 */
					response.sendRedirect("./merchant/merchantDashboard.jsp");
				} else if ("4".equals(user.getRoleId())) {
					session.setAttribute("user", user);
					session.setAttribute("firstName", user.getFirstName());
					session.setAttribute("lastName", user.getLastName());
					session.setAttribute("roleId", user.getRoleId());
					session.setAttribute("userId", user.getUserId());
					response.sendRedirect("./admin/adminDashboard.jsp");
				} else if ("5".equals(user.getRoleId())) {
					session.setAttribute("user", user);
					session.setAttribute("firstName", user.getFirstName());
					session.setAttribute("lastName", user.getLastName());
					session.setAttribute("roleId", user.getRoleId());
					session.setAttribute("userId", user.getUserId());
					//response.sendRedirect("./customer/userProfile.jsp");
					response.sendRedirect("./merchant/merchantDashboard.jsp");
					
				}
			} else {
				if(user.getPassword() != null && user.getPassword().equals("PASSWORD_NOT_MATCH"))
					request.setAttribute("msg", " <i>Wrong Password!!!</i> ");
				else
					request.setAttribute("msg", " <i>User Doesn't Exist !!!</i> ");
				RequestDispatcher rd = request.getRequestDispatcher("./loginPage.jsp");
				rd.forward(request, response);

			}
			response.getWriter().append("Served at: ").append(request.getContextPath());
		
			//request.getRequestDispatcher("loginPage.jsp").forward(request, response);
	}
	
	
	private User checkCookie(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();     // request is an instance of type 
		String userName = "";
		String password = "";
		User user = null;
		if(cookies!=null){
			for(int i = 0; i < cookies.length; i++)
			{ 
				
				Cookie c = cookies[i];
				if (c!=null && c.getName().equals("userName"))
				{
					userName= c.getValue();
				}else if (c!=null && c.getName().equals("password")){
					password= c.getValue();
				}
				
			} 
			if(!userName.isEmpty() && !password.isEmpty()){
				user = new User();
				user.setUserId(userName);
				user.setPassword(password);
			}
		}
		
		return user;
	}

}
