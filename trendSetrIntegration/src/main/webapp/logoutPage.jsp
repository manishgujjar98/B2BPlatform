<% 
if(session != null && session.getAttribute("user") != null){
	session.removeAttribute("user");
     session.invalidate();
     
     Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				cookie.setValue("");
				cookie.setMaxAge(0); // 30 mins
				response.addCookie(cookie);
			}
		}
     response.sendRedirect("./LoginController");
}

%>