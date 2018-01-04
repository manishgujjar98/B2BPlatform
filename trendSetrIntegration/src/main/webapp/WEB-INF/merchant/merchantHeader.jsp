<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.admin-header {
	background-color: black;
}

.logo-container h1 a {
	color: white;
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

.mdl-layout__header .mdl-layout__drawer-button:active {
	background-color: transparent !important;
	box-shadow: none !important;
	opacity: .5;
}

.mdl-layout__header {
	background-color: transparent !important;
	box-shadow: none !important;
}

.mdl-layout__drawer .mdl-navigation .mdl-navigation__link {
	color: white;
	text-decoration: none;
}

.mdl-layout__drawer .mdl-navigation .mdl-navigation__link:hover {
	color: black;
}

.mdl-layout__obfuscator.is-visible {
	position: fixed;
}

.mdl-layout__drawer.is-visible {
	position: fixed;
}
</style>
</head>
<body>
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<header class="mdl-layout__header">
		<div class="mdl-layout__header-row "
			style="background: #000000; border-bottom: solid #FFFFFF;">
			<span class="mdl-layout-title"
				style="margin-left: auto; margin-right: auto; display: block; position: absolute; width: 100%; left: 0; top: 0; text-align: center; padding-top: 25px;">TrendSetr</span>
			<div class="mdl-layout-spacer"></div>
			<nav class="mdl-navigation mdl-layout__header--transparent">
			<button id="demo-menu-lower-right"
				class="mdl-button mdl-js-button mdl-button--icon">
				<i> <a class="mdl-navigation__link" href="#"
					style="width: 32px; height: 32px; background-color: #FFFFFF;"></a></i>
			</button>
			<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu "
				for="demo-menu-lower-right" style="top: 15px">
				<li style="margin-left: 35px;">
					<div
						style="height: 100px; width: 100px; border-radius: 50%; background-color: #7D7D7D;"></div>
				</li>
				<li style="text-align: center; color: #000000; font-weight: bold;">Merchant
					Name</li>
				<li class="mdl-menu__item" style="text-align: center;">View
					TrendSetr Profile</li>
				<li class="mdl-menu__item" style="text-align: center;">Sign Out</li>
			</ul>
			</nav>
		</div>
		</header>
		<div class="mdl-layout__drawer"
			style="overflow: hidden; background: rgba(0, 0, 0, 0.75); border: none;">
			<span class="mdl-layout-title mt40" style="top: 85px; right: -25px;"><div
					style="height: 100px; width: 100px; border-radius: 50%; background-color: #7D7D7D;"></div></span>
			<span class="mdl-layout-title" style="top: 85px; color: #FFFFFF">Merchant
				Name</span>
			<nav class="mdl-navigation" style="padding-top: 86px;"> <a
				class="mdl-navigation__link"
				href="/trendSetrIntegration/merchant/merchantDashboard.jsp">Dashboard</a>
			<a class="mdl-navigation__link"
				href="/trendSetrIntegration/merchant/productManagement.jsp">Product
				Management</a> <a class="mdl-navigation__link"
				href="/trendSetrIntegration/merchant/orderManagement.jsp">Order
				Management</a> <a class="mdl-navigation__link"
				href="/trendSetrIntegration/merchant/featuredAdspace.jsp">Ad
				Management</a> <a class="mdl-navigation__link"
				href="/trendSetrIntegration/merchant/accountSettings.jsp">Account
				Settings</a> </nav>
			<a class="mdl-navigation__link text-center mt60"
				href="/trendSetrIntegration/commons/loginPage.jsp"
				style="text-decoration: none; color: white; font-size: 20px;">Sign
				Out</a>
		</div>
	</div>
</body>
</html>