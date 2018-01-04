<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Shop Page Curations</title>
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
	href="/trendSetrIntegration/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- custom styles -->
<link rel="stylesheet" href="/trendSetrIntegration/css/app.css">
<!--[if IE]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.admin-header {
	background-color: black;
}

#shop-page-curations {
	position: relative;
	top: 60px;
}

#shop-page-curations a {
	text-decoration: none;
}

.panel-footer h5 {
	color: grey;
}

#shop-page-curations .shop-header {
	margin-top: 10px;
	margin-bottom: 20px;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: flex-end;
}

@media all and (max-width:368px) {
	.shop-header button {
		font-size: 10px;
	}
	.categories a {
		font-size: 14px;
	}
}

#shop-page-curations a {
	text-decoration: none;
}

#shop-page-curations .well div {
	font-size: 16px;
	color: black;
}

#shop-page-curations .well {
	margin-bottom: 5px;
}
</style>
</head>

<body>
	<!-- header -->
	<%@include file="adminNavigation.jsp"%>
	<!--header -->
	<!-- user settings -->
	<section class="col-sm-12" id="shop-page-curations">
		<section class="row">
			<section class="container">
				<section class="">
					<!--  user settings menu -->
					<h3 class="flex-item text-center visible-xs">Shop Page
						Curations</h3>
					<div class="shop-header flex-container">
						<button class="flex-item btn btn-primary">Add Merchant
							Section</button>
						<h3 class="flex-item text-center hidden-xs">Shop Page
							Curations</h3>
						<button class="flex-item btn btn-primary">Add Product
							Section</button>
					</div>
					<section class="col-sm-12 pending-products-content">
						<section class="row">
							<div class="well text-center">
								<div class="categories">
									<div class="pull-left">
										<a href="">Categories</a>
									</div>
									<div class="pull-right">Date Created</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="well text-center">
								<div class="categories">
									<div class="pull-left">
										<a href="">Products We Love</a>
									</div>
									<div class="pull-right">Date Created</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="well text-center">
								<div class="categories">
									<div class="pull-left">
										<a href="">Merchants We Love</a>
									</div>
									<div class="pull-right ">Date Created</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="well text-center">
								<div class="categories">
									<div class="pull-left ">
										<a href="">Collections</a>
									</div>
									<div class="pull-right ">Date Created</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="well text-center">
								<div class="categories">
									<div class="pull-left ">
										<a href="">New Merchants</a>
									</div>
									<div class="pull-right ">Date Created</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="well text-center">
								<div class="categories">
									<div class="pull-left ">
										<a href="">Section Name</a>
									</div>
									<div class="pull-right ">Date Created</div>
								</div>
								<div class="clearfix"></div>
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
	<script src="/trendSetrIntegration/js/jquery.min.js"></script>
	<script src="/trendSetrIntegration/js/bootstrap.min.js"></script>
	<!-- Material desig nscript -->
	<script
		src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
	<script src="/trendSetrIntegration/js/app.js"></script>
</body>

</html>
