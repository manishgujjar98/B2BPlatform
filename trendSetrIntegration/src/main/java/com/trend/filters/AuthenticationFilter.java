package com.trend.filters;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
public class AuthenticationFilter implements Filter {
	
	private static Set<String> allowedUrls = new HashSet<String>();
	private static Set<String> allowedFolder = new HashSet<String>();

	/**
	 * Default constructor.
	 */
	public AuthenticationFilter() {
		// TODO Auto-generated constructor stub
		allowedUrls.add("");
		allowedUrls.add("/");
		//allowedUrls.add("/loginPage.jsp");
		//allowedUrls.add("/logoutPage.jsp");
		allowedUrls.add("/LoginController");
		allowedUrls.add("/PasswordController");
		allowedUrls.add("/registrationPage.jsp");
		allowedUrls.add("/changePasswordEmailLink.jsp");
		
		allowedFolder.add("/css/");
		allowedFolder.add("/js/");
		allowedFolder.add("/images/");
		allowedFolder.add("/fonts/");
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}
	
	private boolean checkFolder(String url) {
		for(String folder: allowedFolder) {		
			if(url.indexOf(folder) > -1) {
				return true;
			}
		}
		 return false;
	}
	
	private boolean checkUrl(String url, String contextPath) {
		String requri = url.substring(contextPath.length());
		System.out.println("requesuri="+requri);
		return allowedUrls.contains(requri) || checkFolder(url);
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession(false);
        //System.out.println(session+" == "+request.getRequestURI());
		if (checkUrl(request.getRequestURI(), request.getContextPath())) {
			chain.doFilter(request, response);
		} else {
			if (session == null || (session != null && session.getAttribute("user") == null)) {

				response.sendRedirect(request.getContextPath()+"/LoginController");

			} else {
				response.setHeader("Pragma", "no-cache");
				response.setHeader("Cache-Control", "no-cache");
				response.setDateHeader("Expires", 0);
				chain.doFilter(request, response);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
