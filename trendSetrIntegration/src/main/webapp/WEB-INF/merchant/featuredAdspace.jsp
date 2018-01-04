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

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.js"></script>
<!--[if IE]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
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

.setings-back-div {
	padding: 0;
	margin: 0;
	display: flex;
	justify-content: space-between;
}

.date-time-div {
	display: flex;
	flex-direction: row;
	justify-content: center;
}

#featured-ad-bidding-banner {
	color: white;
}

.setings-back-div {
	margin-bottom: 20px;
}

#featured-ad-bidding-banner {
	max-width: 100%;
	min-height: 350px;
	background-size: cover;
	background-position: 0 0;
	background-repeat: no-repeat;
	position: relative;
	justify-content: center;
}

.storename-shopnow .store-name {
	font-size: 30px;
}

.storename-shopnow {
	margin-left: 20px;
}

.storename-shopnow .shop-now-button {
	width: 100px;
}

#confirm-bid-modal .modal-dialog {
	width: 400px;
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
					href="/trendSetrIntegration/merchant/merchantDashboard.jsp">Dashboard</a>
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
	<section class="col-sm-12 b2b-header-margin" id="featured-ad-space">
		<section class="row">
			<section class="container">
				<div class="setings-back-div flex-container">
					<button class="btn btn-primary flex-item back-button">Back</button>
					<div class="flex-item ">Featured Ad Space Bidding</div>
					<a class="btn btn-primary flex-item "
						href="/trendSetrIntegration/images/whatisthis.png">What is
						this?</a>
				</div>
			</section>
			<section id="featured-ad-bidding-banner"
				style="background-image: url(/trendSetrIntegration/images/NewYork.jpg);"
				class="col-xs-offset-1 col-xs-10">
				<section class="row">
					<div class="content-on-ad-banner"
						style="position: absolute; top: 40%; left: 0; right: 0;">
						<div class="upload-banner-option text-center ">
							<button class="btn btn-primary upload-button">Upload</button>
							<p>Upload a banner picture for the featured ad space</p>
						</div>
						<div class="storename-shopnow">
							<div class="store-name">Store Name</div>
							<button class="btn btn-primary shop-now-button">Shop Now</button>
						</div>
					</div>
				</section>
			</section>
			<section class="col-sm-offset-3 col-sm-6 col-xs-12 ">
				<form class="bidding-form form-horizontal text-center">
					<h5 class="flex-item ">Disclaimer</h5>
					<section class="date-time-div flex-item ">
						<div class="form-group ">
							<label for="date " class="col-sm-3 control-label ">Date</label>
							<div class="col-sm-8 ">
								<input type="password " class="form-control " id="date "
									placeholder="Date ">
							</div>
						</div>
						<div class="form-group ">
							<label for="amount" class="col-sm-3 control-label ">Amount</label>
							<div class="col-sm-9 ">
								<input type="password " class="form-control " id="amount "
									placeholder="Amount ">
							</div>
						</div>
					</section>
					<a href="" class="btn btn-primary btn-sm" data-toggle="modal"
						data-target="#confirm-bid-modal" data-dismiss="modal">Submit
						Bid</a>
					<h5 class="flex-item mt20">Disclaimer</h5>
				</form>
			</section>
		</section>
	</section>
	<!--  confirm bid popup -->
	<div class="modal fade mt20" data-keyboard="false " data-backdrop="static "
		id="confirm-bid-modal" tabindex="-1 ">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<!-- product content -->
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">X</button>
						<div class="row ">
							<div class="panel panel-default " style="margin-bottom: 0;">
								<div class="panel-heading ">
									<h4 class="text-center ">
										You are placing a <b>bid</b> for
									</h4>
								</div>
								<div class="panel-body text-center">
									<div class="clearfix "></div>
									<div class="form-group flex-item">
										<label for="date " class="col-sm-3 control-label ">Date</label>
										<div class="col-sm-8 ">
											<input type="password " class="form-control " id="date "
												placeholder="Date ">
										</div>
									</div>
									<div class="form-group flex-item">
										<label for="amount " class="col-sm-3 control-label ">Amount</label>
										<div class="col-sm-8 ">
											<input type="password" class="form-control" id="time"
												placeholder="Amount ">
										</div>
									</div>
								</div>
								<div class="panel-footer text-center" style="border: 0;">
									<button class="btn btn-default confirm-bid-button">
										<b>Confirm Bid</b>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  confirm bid popup -->
	<!-- .gift -->
	<script src="js/jquery.min.js "></script>
	<script src="js/bootstrap.min.js "></script>
	<!-- Material desig nscript -->
	<script
		src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js "></script>
	<script src="js/app.js "></script>
</body>

</html>
