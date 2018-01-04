<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Editor's Choice</title>
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
	href="../css/bootstrap.min.css">
<link rel="stylesheet"
	href="../css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- custom styles -->
<link rel="stylesheet" href="../css/app.css">
<!--[if IE]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
body {
	background-color: #f5f2f1;
}

.b2b-header-margin {
	position: relative;
	top: 80px;
}

.panel-footer h5 {
	color: grey;
}

.bidding-form {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.bid-history {
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.storename-shopnow {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.storename-shopnow span {
	display: block;
}

#featured-ad-bidding-banner {
	min-height: 400px;
	background-size: cover;
	background-position: 0 0;
	background-repeat: no-repeat;
	position: relative;
	justify-content: center;
}

.add-me {
	cursor: pointer;
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
						<li style="text-align: center; color: #000000; font-weight: bold;"><h5>
								<%=(session.getAttribute("firstName") == null)
					? ""
					: session.getAttribute("firstName") + " " + session.getAttribute("lastName")%></h5></li>
						<li class="mdl-menu__item" style="text-align: center;">View
							TrendSetr Profile</li>
						<li class="mdl-menu__item" style="text-align: center;">Sign
							Out</li>
					</ul>
				</nav>
			</div>
		</header>
		<div class="mdl-layout__drawer"
			style="overflow: hidden; background: rgba(0, 0, 0, 0.5); border: none;">
			<span class="mdl-layout-title" style="top: 85px;"><div
					style="height: 100px; width: 100px; border-radius: 50%; background-color: #7D7D7D;"></div></span>
			<span class="mdl-layout-title" style="top: 85px; color: #FFFFFF"><h4>
					<%=(session.getAttribute("firstName") == null)
					? ""
					: session.getAttribute("firstName") + " " + session.getAttribute("lastName")%></h4></span>
			<nav class="mdl-navigation" style="padding-top: 86px;">
				<a class="mdl-navigation__link"
					href="./adminDashboard.jsp">Dashboard</a>
				<a class="mdl-navigation__link"
					href="./influencerSales.jsp">Influencer
					Sales</a> <a class="mdl-navigation__link"
					href="./merchantSales.jsp">Merchant
					Sales</a> <a class="mdl-navigation__link"
					href="./editorsChoice.jsp">Editor's
					Choice</a> <a class="mdl-navigation__link"
					href="./shopPageCuration.jsp">Shop
					Page Curations</a> <a class="mdl-navigation__link"
					href="./employeeManagement.jsp">Employee
					Management</a> <a class="mdl-navigation__link" href="">Account
					Settings</a>
			</nav>
			<a class="mdl-navigation__link text-center mt60"
				href="/LoginController"
				style="text-decoration: none; color: white; font-size: 20px;">Sign
				Out</a>
		</div>
	</div>
	</div>
	<!--header -->
	<!-- user settings -->
	<section class="col-sm-12 b2b-header-margin " id="editors-choice">
		<section class="row">
			<section class="container">
				<section class="row">
					<!--  user settings menu -->
					<button class="btn btn-primary back-button">Back</button>
					<div class="col-xs-12" style="margin-top: -30px;">
						<div class="col-xs-4"></div>
						<h4 class="col-xs-4 text-center">Editor's Choice</h4>
						<div class="col-xs-4" style="float: right">
							<button class="btn btn-primary save-button pull-right">Save</button>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
					<!-- ./ user settings menu -->
					<!-- user settings content -->
					<section id="featured-ad-bidding-banner"
						style="background: url(../images/NewYork.jpg) 0 0 no-repeat; background-size: cover;"
						class="col-xs-12">
						<section class="row">
							<div class="content-on-ad-banner">
								<div class="upload-banner-option text-center">
									upload
									<p>Upload a banner picture for the featured ad space</p>
								</div>
								<div class="storename-shopnow flex-container">
									<span class="flex-item">Store Name</span> <span
										class="flex-item">Shop Now</span>
								</div>
							</div>
						</section>
					</section>
					<div class="clearfix"></div>
					<section class="col-sm-12">
						<section class="row">
							<section class="bid-history mt20">
								<div class="flex-item">
									<select name="" id="year" class="form-control"
										style="width: 100px;">
										<option value="">2017</option>
										<option value="">2016</option>
										<option value="">2015</option>
										<option value="">2014</option>
										<option value="">2013</option>
										<option value="">2012</option>
									</select>
								</div>
								<div class="flex-item">
									<select name="" id="month" class="form-control"
										style="width: 100px; margin-right: 5px;">
										<option value="">Jan</option>
										<option value="">Feb</option>
										<option value="">Mar</option>
										<option value="">Apr</option>
										<option value="">May</option>
										<option value="">June</option>
										<option value="">July</option>
										<option value="">Aug</option>
										<option value="">Sep</option>
										<option value="">Oct</option>
										<option value="">Nov</option>
										<option value="">Dec</option>
									</select>
								</div>
								<div class="flex-item">
									<button type="submit" class="btn btn-primary">save</button>
								</div>
							</section>
							<div class="container" style="margin-top: 20px;">
								<div class="table-responsive">
									<table class="table table-bordered table-hover text-center"
										id="selected-merchants" style="background-color: white;">
										<tr style="background-color: #A4A4A4;">
											<th class="text-center">Merchant Name</th>
											<th class="text-center">Bid Price</th>
											<th class="text-center">Date Placed</th>
										</tr>
									</table>
								</div>
								<hr />
								<div class="table-responsive">
									<table class="table table-bordered text-center table-hover"
										id="merchants-list" style="background-color: white;">
										<tr style="background-color: #A4A4A4;">
											<th class="text-center">Merchant Name</th>
											<th class="text-center">Bid Price</th>
											<th class="text-center">Date Placed</th>
										</tr>
										<tbody>
											<tr>
												<td>Merchant Name 1 &nbsp; <span data-id="1"
													class="add-me"><span class="fa fa-plus-circle"></span></span>
												</td>
												<td>Merchant Logo 1</td>
												<td>Something else 1</td>
											</tr>
											<tr>
												<td>Merchant Name 2 &nbsp; <span data-id="2"
													class="add-me"><span class="fa fa-plus-circle"></span></span>
												</td>
												<td>Merchant Logo 2</td>
												<td>Something else 2</td>
											</tr>
											<tr>
												<td>Merchant Name 3 &nbsp; <span data-id="3"
													class="add-me"><span class="fa fa-plus-circle"></span></span>
												</td>
												<td>Merchant Logo 3</td>
												<td>Something else 3</td>
											</tr>
											<tr>
												<td>Merchant Name 4 &nbsp; <span data-id="4"
													class="add-me"><span class="fa fa-plus-circle"></span></span>
												</td>
												<td>Merchant Logo 4</td>
												<td>Something else 4</td>
											</tr>
											<tr>
												<td>Merchant Name 5 &nbsp; <span data-id="5"
													class="add-me"><span class="fa fa-plus-circle"></span></span>
												</td>
												<td>Merchant Logo 5</td>
												<td>Something else 5</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</section>
					</section>
					<!-- ./user settings content -->
				</section>
			</section>
		</section>
	</section>
	<!-- .gift -->
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<!-- Material desig nscript -->
	<script
		src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
	<script src="../js/app.js"></script>
	<script>
		$(document).on(
				'click',
				'#merchants-list .add-me',
				function(e) {
					e.preventDefault();
					//change the text to x
					$(this).find('span').removeClass('fa-plus-circle')
							.addClass('fa-times');

					//get the total tr row   
					var td = $(this).parents('tr').html();
					//remove it from the current html block
					$(this).parents('tr').remove();

					// now add the new row to top merchant list block
					$('#selected-merchants').append('<tr>' + td + '</tr>');
				});

		$(document).on(
				'click',
				'#selected-merchants .add-me',
				function(e) {
					e.preventDefault();
					//change the text to x
					$(this).find('span').removeClass('fa-times').addClass(
							'fa-plus-circle');

					//get the total tr row   
					var td = $(this).parents('tr').html();
					//remove it from the current html block
					$(this).parents('tr').remove();

					// now add the new row to top merchant list block
					$('#merchants-list').append('<tr>' + td + '</tr>');
				});

		$('#bidded-merchants-button').on('click', function(e) {
			e.preventDefault();
			$("#all-bidded-merchants").toggle();
			if ($(this).text() == 'Show All Bidded Merchants') {
				$(this).text('Done');
			} else {
				$(this).text('Show All Bidded Merchants');
			}

		});
	</script>
</body>

</html>
