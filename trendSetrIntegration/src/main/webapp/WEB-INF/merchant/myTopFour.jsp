<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>B2B Dashboard</title>
<link rel="shortcut icon" href="">
<!-- Material design icons -->
<link rel="stylesheet"
	href="https://storage.googleapis.com/code.getmdl.io/1.0.4/material.red-purple.min.css">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.2.1/material.indigo-pink.min.css" />
<!-- Material design fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	type="text/css">
<!-- bootstrap -->
<link rel="stylesheet"
	href="/trendSetrIntegration/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/trendSetrIntegration/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- custom styles -->
<link rel="stylesheet" href="/trendSetrIntegration/css/app.css">
<link rel="stylesheet" href="/trendSetrIntegration/css/bulma.css">
<link rel="stylesheet" href="/trendSetrIntegration/css/bulma.css.map">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.js"></script>
<!--[if IE]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
body {
	background-color: #f5f2f1;
}

.mt250 {
	margin-top: 250px;
}

.admin-header {
	background-color: black;
}

.logo-container h1 a {
	color: white;
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

.b2b-header-margin {
	position: relative;
	top: 110px;
}

.panel-footer h5 {
	color: grey;
}

.header-div {
	margin-bottom: 20px;
}

.bidding-form {
	padding: 0;
	margin: 0;
	display: -webkit-box;
	display: -moz-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.flex-item {
	
}

.product {
	padding-bottom: 10px;
}

.product a {
	display: block;
	width: 100%;
	color: #fff;
	text-decoration: none;
	text-shadow: none;
	font-size: 16px;
}

.product a figure img {
	height: 360px;
}

.product figure {
	position: relative;
}

.product figure figcaption {
	position: absolute;
	padding: 20px 0;
	left: 0;
	right: 0;
	bottom: 0;
}

.product figure figcaption div {
	position: absolute;
	background-size: cover;
	background-repeat: no-repeat;
	background-position-y: 100%;
	filter: blur(3px) contrast(60%);
	left: 0;
	right: 0;
	bottom: 0;
	height: 50px;
}

.product figure figcaption span {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}

.list-inline li .product img {
	width: 200px;
	height: 250px;
}

.product-name-price {
	font-size: 16px;
	line-height: 15px;
	font-weight: 700;
}

.glyphicon-plus-sign {
	font-size: 200px;
}

#search-influencers .form-control {
	border: 1px solid black;
	position: absolute;
	text-align: center;
	height: inherit !important;
	width: 30%;
}

#search-influencers {
	text-align: center;
}

.add {
	border: 1px solid black;
	border-radius: 100%;
	width: 150px;
	height: 150px;
	display: block;
	text-align: center;
	line-height: 150px;
	text-decoration: none;
}

.add span {
	font-size: 50px;
}
</style>
</head>

<body>
	<!-- header -->
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
						<li class="mdl-menu__item" style="text-align: center;">Sign
							Out</li>
					</ul>
				</nav>
			</div>
		</header>
		<div class="mdl-layout__drawer"
			style="overflow: hidden; background: rgba(0, 0, 0, 0.75); border: none;">
			<span class="mdl-layout-title" style="top: 85px; right: -25px;"><div
					style="height: 100px; width: 100px; border-radius: 50%; background-color: #7D7D7D;"></div></span>
			<span class="mdl-layout-title" style="top: 85px; color: #FFFFFF">Merchant
				Name</span>
			<nav class="mdl-navigation" style="padding-top: 86px;">
				<a class="mdl-navigation__link"
					href="/trendSetrIntegration/merchant/merchantDasboard.jsp">Dashboard</a>
				<a class="mdl-navigation__link"
					href="/trendSetrIntegration/merchant/productManagement.jsp">Product
					Management</a> <a class="mdl-navigation__link"
					href="/trendSetrIntegration/merchant/orderManagement.jsp">Order
					Management</a> <a class="mdl-navigation__link"
					href="/trendSetrIntegration/merchant/featuredAdspace.jsp">Ad
					Management</a> <a class="mdl-navigation__link"
					href="/trendSetrIntegration/merchant/accountSettings.jsp">Account
					Settings</a>
			</nav>
			<a class="mdl-navigation__link text-center mt60"
				href="/LoginController"
				style="text-decoration: none; color: white; font-size: 20px;">Sign
				Out</a>
		</div>
	</div>
	<!--header -->
	<!-- user settings -->
	<!-- main-content -->
	<section class="col-xs-12 b2b-header-margin" id="mytop4-section">
		<section class="row">
			<section class=" mt20">
				<div class="header-div mt100 col-sm-12">
					<div class="pull-left ">x</div>
					<button class="btn btn-primary pull-right save-button">Save</button>
				</div>
				<div class="clearfix"></div>
				<!-- products for you -->
				<div class=" col-xs-12 text-center">
					<div class="row">
						<div class="col-sm-3">
							<a href="" class="add"><span>+</span></a>
						</div>
						<div class="col-sm-3">
							<a href="" class="add"><span>+</span></a>
						</div>
						<div class="col-sm-3">
							<a href="" class="add"><span>+</span></a>
						</div>
						<div class="col-sm-3">
							<a href="" class="add"><span>+</span></a>
						</div>
					</div>
				</div>
				<div class="form-group" id="search-influencers" id="mytop4">
					<i class="material-icons">search</i> <input type="text"
						class="form-control" placeholder="Search">
				</div>
			</section>
		</section>
	</section>
	<!-- .gift -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- Material desig nscript -->
	<script
		src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
	<script src="js/app.js"></script>
</body>

</html>
