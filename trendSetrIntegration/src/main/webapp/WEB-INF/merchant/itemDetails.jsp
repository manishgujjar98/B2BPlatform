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

.item-detail-header {
	margin-bottom: 20px;
	flex-direction: row;
	justify-content: space-between;
	align-items: flex-end;
}

.product-primary-img {
	min-height: 400px;
}

.product-primary-img img {
	min-height: 400px;
}

.first-img, .second-img, .third-img {
	min-height: 100px;
}

.first-img img, .second-img img, .third-img img {
	min-height: 100px;
}

@media screen and (max-width: 768px) {
	.product-primary-img {
		width: 100%;
		height: 200px;
	}
	.product-primary-img img {
		width: 100%;
		height: 200px;
	}
	.first-img, .second-img, .third-img {
		min-height: 50px;
	}
	.first-img img, .second-img img, .third-img img {
		min-height: 50px;
	}
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
	<section class="col-sm-12 b2b-header-margin" id="item-detail">
		<section class="row">
			<section class="container">
				<section class="">
					<!--  user settings menu -->
					<!-- product content -->
					<div class="item-detail-header">
						<p class="text-center">Item Detail</p>
					</div>
					<form class="form-horizontal text-center">
						<div class="col-sm-3">
							<div class="row">
								<div class="fullwidth">
									<div class="img-block custom-image product-primary-img">
										<a href=""><img src="images/001.png"
											class="img-responsive" alt="product image"></a>
									</div>
									<section class="">
										<div class="product-block">
											<div class="col-xs-4 first-img">
												<div class="row" style="margin-right: -13px;">
													<a href=""><img src="images/001.png" alt="product name"
														class="img-responsive"></a>
												</div>
											</div>
											<div class="col-xs-4 second-img">
												<div class="row" style="margin-right: -13px;">
													<a href=""><img src="images/001.png" alt="product name"
														class="img-responsive"></a>
												</div>
											</div>
											<div class="col-xs-4 third-img">
												<div class="row">
													<a href=""><img src="images/001.png" alt="product name"
														class="img-responsive"></a>
												</div>
											</div>
										</div>
									</section>
								</div>
							</div>
						</div>
						<div class="col-sm-9 text-center product-details">
							<div class="panel-body text-center">
								<div class="form-group">
									<label for="bname" class="col-sm-3 control-label">Product
										Name</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="email"
											placeholder="Enter Product Name">
									</div>
								</div>
								<div class="form-group text-center">
									<label for="category" class="col-sm-3 control-label">Category</label>
									<div class="col-sm-9">
										<select name="" id="category" class="form-control" required>
											<option value="a">Category 1</option>
											<option value="b">Category 2</option>
											<option value="c">Category 3</option>
											<option value="d">Category 4</option>
											<option value="e">Category 5</option>
										</select>
									</div>
								</div>
								<div class="form-group text-center">
									<label for="sub-category" class="col-sm-3 control-label">Sub-Category</label>
									<div class="col-sm-9">
										<select name="" id="sub-category" class="form-control"
											required>
											<option value="">Sub-Category 1</option>
											<option value="">Sub-Category 2</option>
											<option value="">Sub-Category 3</option>
										</select>
									</div>
								</div>
								<div class="form-group text-center">
									<label for="gender" class="col-sm-3 control-label">Select
										Gender</label>
									<div class="col-sm-9">
										<select name="" id="gender" class="form-control" required>
											<option value="">Men</option>
											<option value="">Women</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="description" class="col-sm-3 control-label">Description</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="description"
											placeholder="Enter the product descripton here" required>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="pull-left">Variant</h4>
									<h4 class="pull-right">
										<a href="">Manage Stock</a>
									</h4>
									<div class="clearfix"></div>
								</div>
								<div class="panel-body text-center">
									<div class="table-responsive">
										<table
											class="variant-table table table-hover table-bordered text-center"
											id="variant-table">
											<thead>
												<tr>
													<th class="text-center">Remove from sale</th>
													<th class="text-center">SKU</th>
													<th class="text-center">Color</th>
													<th class="text-center">Size</th>
													<th class="text-center">Price</th>
													<th class="text-center">Edit</th>
												</tr>
											</thead>
											<tbody>
												<tr id="variant-row">
													<td><input type="checkbox" class="form-control"
														id="email" placeholder="Enter SKU" required></td>
													</td>
													<td><input type="text" class="form-control" id="email"
														placeholder="Enter SKU" required></td>
													<td><input type="text" class="form-control" id="email"
														placeholder="Enter Color" required></td>
													<td><input type="text" class="form-control" id="email"
														placeholder="Enter Size" required></td>
													<td><input type="text" class="form-control" id="email"
														placeholder="Enter Price" required></td>
													<td>
														<button onclick="save()">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="6" align="middle">
														<button onclick="myFunction()" class="add-row">+
														</button>
													</td>
												</tr>
											</tfoot>
										</table>
									</div>
								</div>
							</div>
							<button class="btn btn-primary save-product-button pull-right">Save</button>
						</div>
						<!-- ./product content -->
						<!-- ./user settings content -->
					</form>
				</section>
			</section>
		</section>
	</section>
	<!-- ./user settings -->
	<div class="clearfix"></div>
	<!-- .gift -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- Material desig nscript -->
	<script
		src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
	<!-- owl carousel -->
	<script src="vendor/owl/owl.carousel.min.js"></script>
	<!-- wow -->
	<script src="js/wow.min.js"></script>
	<script src="js/app.js"></script>
	<script>
		function myFunction() {
			var table = document.getElementById("variant-table");
			var row = table.insertRow(2);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			var cell5 = row.insertCell(4);
			var cell6 = row.insertCell(5);
			cell1.innerHTML = '<input type="checkbox" class="form-control" id="email" placeholder="Enter SKU" required>'
			cell2.innerHTML = '<input type="text" class="form-control" id="email" placeholder="Enter SKU" required>'
			cell3.innerHTML = '<input type="text" class="form-control" id="email" placeholder="Enter Color" required>'
			cell4.innerHTML = '<input type="text" class="form-control" id="email" placeholder="Enter Size" required>'
			cell5.innerHTML = '<input type="text" class="form-control" id="email" placeholder="Enter Price" required>'
			cell6.innerHTML = '<button onclick="save()"><span class="glyphicon glyphicon-trash"></span></button>'

		}

		function save() {
			span
		}
	</script>
</body>

</html>
