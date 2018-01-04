<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>TrendSetr</title>
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
<!-- owl carousel -->
<link rel="stylesheet"
	href="/trendSetrIntegration/vendor/owl/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="/trendSetrIntegration/vendor/owl/assets/owl.theme.default.min.css">
<!-- animate.css -->
<link rel="stylesheet" href="/trendSetrIntegration/css/animate.css">
<!-- custom styles -->
<link rel="stylesheet" href="/trendSetrIntegration/css/app.css">
<!--[if IE]>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js">
	<script>
	<!--
	$(document).ready(function() {
		e.preventDefault();
		function disableBack() {
			window.history.forward()
		}
		window.onload = disableBack();
		window.onpageshow = function(evt) {
			if (evt.persisted)
				disableBack()
		}
	});
	-->
	window.history.forward();
</script>
</head>

<body>
	<section class="blur-wrapper">
		<!-- header -->
		<header id="header">
			<section class="roww">
				<div class="logo-container">
					<h1>
						<a href="">TrendSetr</a>
					</h1>
					<div class="navigation visible-xs">
						<nav class="navbar navbar-default" role="navigation">
							<div>
								<div class="navbar-header">
									<button type="button" class="navbar-toggle"
										data-toggle="collapse" data-target=".navbar-collapse">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
								</div>
								<div class="collapse navbar-collapse">
									<ul class="nav navbar-nav">
										<li><a href="#"><span class="material-icons">shopping_basket</span><span>Shop</span></a></li>
										<li><a href="#about"><span class="material-icons">whatshot</span><span>Trending</span></a></li>
										<li><a href="#contact"><span class="material-icons">featured_play_list</span><span>Feed</span></a></li>
										<li><a href="Notifications_Page/Notifications_Page.html"><span
												class="material-icons">notifications</span><span>Notifications</span></a></li>
										<li><a href="#"><span class="material-icons">shopping_cart</span><span>Cart</span></a></li>
										<li><a href="#" class="dropdown hidden-xs"> <img
												width="30px" class="img-circle"
												src="/trendSetrIntegration/images/catimg2.jpg">
												<ul class="dropdown-menu">
													<li><a href="#">HTML</a></li>
													<li><a href="#">CSS</a></li>
													<li><a href="#">JavaScript</a></li>
												</ul>
										</a></li>
									</ul>
								</div>
								<!--.nav-collapse -->
							</div>
						</nav>
					</div>
				</div>
				<div id="desktop-menu-container">
					<div class="menu-block hidden-xs">
						<ul class="list-inline">
							<li><a href="#"><span class="material-icons">shopping_basket</span><span>Shop</span></a></li>
							<li><a href="#about"><span class="material-icons">whatshot</span><span>Trending</span></a></li>
							<li><a href="#contact"><span class="material-icons">featured_play_list</span><span>Feed</span></a></li>
						</ul>
					</div>
					<div class="menu-block big">
						<form class="form-inline form-search" action="" method="get">
							<div class="search-container">
								<i class="material-icons">search</i> <input type="search"
									placeholder="Search" name="search">
							</div>
						</form>
					</div>
					<div class="menu-block  hidden-xs">
						<ul class="list-inline">
							<li><a href="#"><span class="material-icons">notifications</span><span>Notifications</span></a></li>
							<li><a href="#"><span class="material-icons">shopping_cart</span><span>Cart</span></a></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#"> <img width="30px"
									class="img-circle"
									src="/trendSetrIntegration/images/catimg2.jpg"> <span>Profile
										<i class="caret"></i>
								</span>
							</a>
								<ul class="dropdown-menu">
									<li><a class="pull-left" href="#"
										style="display: inline-block">
											<div class="profile-details">
												<div class="media">
													<img width="50px" class="img-circle"
														src="/trendSetrIntegration/images/catimg2.jpg">
													<div class="media-body">
														<span class="media-heading">Name </span> <span
															style="margin-top: -5px">@username</span>
													</div>
												</div>
											</div>
									</a></li>
									<li class="border-up-down"><a href="#">Account
											Balance: $00.00 </a></li>
									<li><a href="#">Settings</a></li>
									<li><a href="/LoginController">Log
											out</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
				<div class="user-profile dropdown visible-xs"
					style="display: inline-block;">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#"> <img
						width="30px" class="img-circle"
						src="/trendSetrIntegration/images/catimg2.jpg"> <span>
							<i class="caret"></i>
					</span>
					</a>
					<ul class="dropdown-menu pull-right">
						<li><a class="pull-left" href="#"
							style="display: inline-block">
								<div class="profile-details">
									<div class="media">
										<img width="50px" class="img-circle"
											src="/trendSetrIntegration/images/catimg2.jpg">
										<div class="media-body">
											<span class="media-heading">Name </span> <span
												style="margin-top: -5px">@username</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="border-up-down"><a href="#">Account Balance:
								$00.00 </a></li>
						<li><a href="#">Settings</a></li>
						<li><a href="/LoginController">Log
								out</a></li>
					</ul>
				</div>
			</section>
		</header>
		<!-- ./header -->
		<!-- slideshow -->
		<section class="col-xs-12  wow fadeIn">
			<div class="row">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Carousel indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- Carousel items -->
					<div class="carousel-inner">
						<div class="item active"
							style="background: url(/trendSetrIntegration/images/storefront1.jpg) 0 0 no-repeat; background-size: cover;">
							<a href="" class="wow zoomInLeft text-center"
								data-wow-duration="1.5s">Shop now</a>
						</div>
						<div class="item"
							style="background: url(/trendSetrIntegration/images/storefront2.jpg) 0 0 no-repeat; background-size: cover;">
							<a href="" class="wow zoomInRight" data-wow-duration="1.5s">Shop
								now</a>
						</div>
						<div class="item"
							style="background: url(/trendSetrIntegration/images/storefront4.jpg) 0 0 no-repeat; background-size: cover;">
							<a href="" class="wow zoomInLeft" data-wow-duration="1.5s">Shop
								now</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- ./slideshow -->
		<!-- Shop by Category -->
		<section class="col-xs-12 wow fadeInUpBig" data-wow-duration="2s"
			id="shop-category">
			<section class="row">
				<section class="container mt10 mb20">
					<h1 class="pull-left sub-title">Shop by Category</h1>
					<a class="see-more" href="categories.html">see more</a>
					<div class="clearfix"></div>
					<div class="owl-carousel owl-theme">
						<div class="item">
							<a href="#">
								<figure>
									<img src="/trendSetrIntegration/images/catimg2.jpg" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/catimg2.jpg);"></div>
										<span>Cagtegory 1</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<figure>
									<img src="/trendSetrIntegration/images/catimg2.jpg" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/catimg2.jpg);"></div>
										<span>Cagtegory 2</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<figure>
									<img src="/trendSetrIntegration/images/catimg2.jpg" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/catimg2.jpg);"></div>
										<span>Cagtegory 3</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<figure>
									<img src="/trendSetrIntegration/images/catimg2.jpg" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/catimg2.jpg);"></div>
										<span>Cagtegory 4</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<figure>
									<img src="/trendSetrIntegration/images/catimg2.jpg" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/catimg2.jpg);"></div>
										<span>Cagtegory 5</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<figure>
									<img src="/trendSetrIntegration/images/catimg2.jpg" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/catimg2.jpg);"></div>
										<span>Cagtegory 6</span>
									</figcaption>
								</figure>
							</a>
						</div>
					</div>
				</section>
			</section>
		</section>
		<!-- ./Shop by Category -->
		<!-- Products We love -->
		<section class="col-xs-12 wow fadeInUp" data-wow-duration="2s"
			data-wow-delay=".5s" id="product-category">
			<section class="row">
				<section class="container mt10 mb20">
					<h1 class="pull-left sub-title">Products We Love</h1>
					<a class="see-more" href="products.html">see more</a>
					<div class="clearfix"></div>
					<div class="owl-carousel owl-theme">
						<div class="item">
							<a href="#" data-toggle="modal" data-target="#product-modal">
								<figure>
									<img src="/trendSetrIntegration/images/merchant3.png" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/merchant3.png);"></div>
										<span>Product 1</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#" data-toggle="modal" data-target="#product-modal">
								<figure>
									<img src="/trendSetrIntegration/images/merchant3.png" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/merchant3.png);"></div>
										<span>Product 2</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#" data-toggle="modal" data-target="#product-modal">
								<figure>
									<img src="/trendSetrIntegration/images/merchant3.png" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/merchant3.png);"></div>
										<span>Product 3</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#" data-toggle="modal" data-target="#product-modal">
								<figure>
									<img src="/trendSetrIntegration/images/merchant3.png" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/merchant3.png);"></div>
										<span>Product 4</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#" data-toggle="modal" data-target="#product-modal">
								<figure>
									<img src="/trendSetrIntegration/images/merchant3.png" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/merchant3.png);"></div>
										<span>Product 5</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#" data-toggle="modal" data-target="#product-modal">
								<figure>
									<img src="/trendSetrIntegration/images/merchant3.png" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/merchant3.png);"></div>
										<span>Product 6</span>
									</figcaption>
								</figure>
							</a>
						</div>
					</div>
				</section>
			</section>
		</section>
		<!-- ./ Products we love -->
		<!-- merchants -->
		<section class="col-xs-12  wow fadeIn" id="merchants-block">
			<div class="row" style="background: white;">
				<div class="container">
					<h1 class="pull-left sub-title">Merchants We Love</h1>
					<a class="see-more" href="merchants_we_love.html">see more</a>
				</div>
			</div>
			<div class="row">
				<div id="merchant-carousel" class="carousel slide"
					data-ride="carousel">
					<!-- Carousel indicators -->
					<ol class="carousel-indicators">
						<li data-target="#merchant-carousel" data-slide-to="0"
							class="active"></li>
						<li data-target="#merchant-carousel" data-slide-to="1"></li>
						<li data-target="#merchant-carousel" data-slide-to="2"></li>
					</ol>
					<!-- Carousel items -->
					<div class="carousel-inner">
						<div class="item active"
							style="background: url(/trendSetrIntegration/images/storefront1.jpg) 0 0 no-repeat; background-size: cover;">
							<section class="row tint">
								<section class="container text-center mt20 mb40">
									<h1 class="block-title">Merchant Name</h1>
									<ul class="list-inline list-unstyled client-block">
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg1.jpg"
												alt="cat0image"></a></li>
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg2.jpg"
												alt="cat0image"></a></li>
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg3.jpg"
												alt="cat0image"></a></li>
										<li class="hidden-sm hidden-xs"><a href=""><img
												src="/trendSetrIntegration/images/product3.jpg"
												alt="cat0image"></a></li>
									</ul>
								</section>
							</section>
						</div>
						<div class="item"
							style="background: url(/trendSetrIntegration/images/storefront2.jpg) 0 0 no-repeat; background-size: cover;">
							<section class="row tint">
								<section class="container text-center mt20 mb40">
									<h1 class="block-title">Merchant Name</h1>
									<ul class="list-inline list-unstyled client-block">
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg1.jpg"
												alt="cat0image"></a></li>
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg2.jpg"
												alt="cat0image"></a></li>
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg3.jpg"
												alt="cat0image"></a></li>
										<li class="hidden-sm hidden-xs"><a href=""><img
												src="/trendSetrIntegration/images/product3.jpg"
												alt="cat0image"></a></li>
									</ul>
								</section>
							</section>
						</div>
						<div class="item"
							style="background: url(/trendSetrIntegration/images/storefront4.jpg) 0 0 no-repeat; background-size: cover;">
							<section class="row tint">
								<section class="container text-center mt20 mb40">
									<h1 class="block-title">Merchant Name</h1>
									<ul class="list-inline list-unstyled client-block">
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg1.jpg"
												alt="cat0image"></a></li>
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg2.jpg"
												alt="cat0image"></a></li>
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg3.jpg"
												alt="cat0image"></a></li>
										<li class="hidden-sm hidden-xs"><a href=""><img
												src="/trendSetrIntegration/images/product3.jpg"
												alt="cat0image"></a></li>
									</ul>
								</section>
							</section>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#merchant-carousel"
					role="button" data-slide="prev"> <span
					class="fa fa-angle-left fa-2x" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#merchant-carousel"
					role="button" data-slide="next"> <span
					class="fa fa-angle-right fa-2x" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</section>
		<!-- merchants -->
		<!-- Collection -->
		<section class="col-xs-12 wow fadeInUp" data-wow-duration="2s"
			data-wow-delay=".2s" id="collection-category">
			<section class="row">
				<section class="container mt10 mb20">
					<h1 class="pull-left sub-title">Collections</h1>
					<a class="see-more" href="collection.html">see more</a>
					<div class="clearfix"></div>
					<div class="owl-carousel owl-theme">
						<div class="item">
							<a href="#">
								<figure>
									<img src="/trendSetrIntegration/images/collection1.jpg"
										alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/collection1.jpg);"></div>
										<span>Collection 1</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<figure>
									<img src="/trendSetrIntegration/images/collection2.jpg"
										alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/collection2.jpg);"></div>
										<span>Collection 2</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<figure>
									<img src="/trendSetrIntegration/images/collection3.jpg"
										alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/collection3.jpg);"></div>
										<span>Collection 3</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<figure>
									<img src="/trendSetrIntegration/images/collection1.jpg"
										alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/collection1.jpg);"></div>
										<span>Collection 1</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<figure>
									<img src="/trendSetrIntegration/images/collection2.jpg"
										alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/collection2.jpg);"></div>
										<span>Collection 2</span>
									</figcaption>
								</figure>
							</a>
						</div>
						<div class="item">
							<a href="#">
								<figure>
									<img src="/trendSetrIntegration/images/collection3.jpg"
										alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/collection3.jpg);"></div>
										<span>Collection 3</span>
									</figcaption>
								</figure>
							</a>
						</div>
					</div>
				</section>
			</section>
		</section>
		<!-- ./ Collection -->
		<!-- new merchants -->
		<!-- merchants -->
		<section class="col-xs-12  wow fadeIn" id="new-merchants-block">
			<div class="row" style="background: white;">
				<div class="container">
					<h1 class="pull-left sub-title">New Merchants</h1>
					<a class="see-more" href="new_merchants.html">see more</a>
				</div>
			</div>
			<div class="row">
				<div id="new-merchant-carousel" class="carousel slide"
					data-ride="carousel">
					<!-- Carousel indicators -->
					<ol class="carousel-indicators">
						<li data-target="#new-merchant-carousel" data-slide-to="0"
							class="active"></li>
						<li data-target="#new-merchant-carousel" data-slide-to="1"></li>
						<li data-target="#new-merchant-carousel" data-slide-to="2"></li>
					</ol>
					<!-- Carousel items -->
					<div class="carousel-inner">
						<div class="item active"
							style="background: url(/trendSetrIntegration/images/merchant.jpg) 0 0 no-repeat; background-size: cover;">
							<section class="row tint">
								<section class="container text-center mt20 mb40">
									<h1 class="block-title">Merchant Name</h1>
									<ul class="list-inline list-unstyled client-block">
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg1.jpg"
												alt="cat0image"></a></li>
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg2.jpg"
												alt="cat0image"></a></li>
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg3.jpg"
												alt="cat0image"></a></li>
										<li class="hidden-sm hidden-xs"><a href=""><img
												src="/trendSetrIntegration/images/product3.jpg"
												alt="cat0image"></a></li>
									</ul>
								</section>
							</section>
						</div>
						<div class="item"
							style="background: url(/trendSetrIntegration/images/storefront2.jpg) 0 0 no-repeat; background-size: cover;">
							<section class="row tint">
								<section class="container text-center mt20 mb40">
									<h1 class="block-title">Merchant Name</h1>
									<ul class="list-inline list-unstyled client-block">
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg1.jpg"
												alt="cat0image"></a></li>
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg2.jpg"
												alt="cat0image"></a></li>
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg3.jpg"
												alt="cat0image"></a></li>
										<li class="hidden-sm hidden-xs"><a href=""><img
												src="/trendSetrIntegration/images/product3.jpg"
												alt="cat0image"></a></li>
									</ul>
								</section>
							</section>
						</div>
						<div class="item"
							style="background: url(/trendSetrIntegration/images/storefront4.jpg) 0 0 no-repeat; background-size: cover;">
							<section class="row tint">
								<section class="container text-center mt20 mb40">
									<h1 class="block-title">Merchant Name</h1>
									<ul class="list-inline list-unstyled client-block">
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg1.jpg"
												alt="cat0image"></a></li>
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg2.jpg"
												alt="cat0image"></a></li>
										<li><a href=""><img
												src="/trendSetrIntegration/images/catimg3.jpg"
												alt="cat0image"></a></li>
										<li class="hidden-sm hidden-xs"><a href=""><img
												src="/trendSetrIntegration/images/product3.jpg"
												alt="cat0image"></a></li>
									</ul>
								</section>
							</section>
						</div>
					</div>
					<a class="left carousel-control" href="#new-merchant-carousel"
						role="button" data-slide="prev"> <span
						class="fa fa-angle-left fa-2x" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#new-merchant-carousel"
						role="button" data-slide="next"> <span
						class="fa fa-angle-right fa-2x" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</section>
		<!-- ./new merchants -->
		<!-- footer -->
		<footer class="col-xs-12 wow fadeIn" data-wow-duration="2s"
			data-wow-delay=".5s" id="footer">
			<section class="row">
				<section class="container">
					<section class="mdl-mega-footer" style="height: auto">
						<div class="mdl-mega-footer__middle-section">
							<div class="mdl-mega-footer__drop-down-section">
								<input class="mdl-mega-footer__heading-checkbox" type="checkbox"
									checked>
								<h1 class="mdl-mega-footer__heading">Features</h1>
								<ul class="mdl-mega-footer__link-list">
									<li><a href="">About</a></li>
									<li><a href="">Terms</a></li>
									<li><a href="">Partners</a></li>
									<li><a href="">Updates</a></li>
								</ul>
							</div>
							<div class="mdl-mega-footer__drop-down-section">
								<input class="mdl-mega-footer__heading-checkbox" type="checkbox"
									checked>
								<h1 class="mdl-mega-footer__heading">Details</h1>
								<ul class="mdl-mega-footer__link-list">
									<li><a href="">Specs</a></li>
									<li><a href="">Tools</a></li>
									<li><a href="">Resources</a></li>
								</ul>
							</div>
							<div class="mdl-mega-footer__drop-down-section">
								<input class="mdl-mega-footer__heading-checkbox" type="checkbox"
									checked>
								<h1 class="mdl-mega-footer__heading">Make money with us</h1>
								<ul class="mdl-mega-footer__link-list">
									<li><a href="">Become a vendor</a></li>
									<li><a href="">Contracts</a></li>
								</ul>
							</div>
							<div class="mdl-mega-footer__drop-down-section">
								<input class="mdl-mega-footer__heading-checkbox" type="checkbox"
									checked>
								<h1 class="mdl-mega-footer__heading">FAQ</h1>
								<ul class="mdl-mega-footer__link-list">
									<li><a href="">Questions</a></li>
									<li><a href="">Answers</a></li>
									<li><a href="">Contact us</a></li>
								</ul>
							</div>
						</div>
						<div class="mdl-mega-footer__bottom-section">
							<div class="text-center">
								<a href="#"> TrendSetr</a> <br> Copyright &copy; <a href=""
									style="color: black">TrendSetr.com</a>
							</div>
						</div>
					</section>
				</section>
			</section>
		</footer>
		<!-- ./footer -->
		<!-- Trigger the modal with a button -->
		<!-- product model -->
	</section>
	<!-- product modal-->
	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="product-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">X</button>
					<!-- product content -->
					<div class="col-sm-7">
						<div class="row">
							<div class="fullwidth">
								<div class="img-block custom-image">
									<img src="/trendSetrIntegration/images/product2.jpg"
										class="img-responsive" alt="product image">
								</div>
								<div class="meta-data">
									<h1 class="meta-title">Product Name</h1>
								</div>
								<div class="product-block">
									<div class="col-xs-4">
										<a href=""><img
											src="/trendSetrIntegration/images/product2.jpg"
											alt="product name" class="img-responsive"></a>
									</div>
									<div class="col-xs-4">
										<a href=""><img
											src="/trendSetrIntegration/images/product2.jpg"
											alt="product name" class="img-responsive"></a>
									</div>
									<div class="col-xs-4">
										<a href=""><img
											src="/trendSetrIntegration/images/product2.jpg"
											alt="product name" class="img-responsive"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-5 text-center product-details">
						<div class="img-block">
							<img src="/trendSetrIntegration/images/merchant1.png"
								alt="merchantimage">
						</div>
						<div class="form-group meta-data">
							<h2 class="meta-title sub">Merchant Name</h2>
						</div>
						<div class="product-options center-block">
							<div class="form-group product-price">$135.00</div>
							<div class="form-group">
								<select name="sizes" class="form-control">
									<option value="">Select Sizes</option>
									<option value="">Small</option>
									<option value="">Medium</option>
									<option value="">Large</option>
									<option value="">Large</option>
									<option value="">Large</option>
								</select>
							</div>
							<div class="form-group">
								<select name="sizes" class="form-control">
									<option value="">Select Colors</option>
									<option value="">Red</option>
									<option value="">Blue</option>
									<option value="">Green</option>
								</select>
							</div>
						</div>
						<div class="product-description">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Optio nobis explicabo repudiandae soluta recusandae, cumque
								quibusdam iste beatae ipsum maxime reiciendis necessitatibus,
								voluptatum dolorem hic natus! Repellendus eius quod, maiores.</p>
						</div>
						<div class="influenced">
							<ul class="list-inline list-unstyled mb0">
								<li><a href=""><img
										src="/trendSetrIntegration/images/merchant1.png" alt=""></a>
								</li>
								<li><a href=""><img
										src="/trendSetrIntegration/images/merchant2.png" alt=""></a>
								</li>
								<li><a href=""><img
										src="/trendSetrIntegration/images/merchant3.png" alt=""></a>
								</li>
								<li><a href=""><img
										src="/trendSetrIntegration/images/merchant1.png" alt=""></a>
								</li>
								<li><a href=""><img
										src="/trendSetrIntegration/images/merchant2.png" alt=""></a>
								</li>
								<li><a href=""><img
										src="/trendSetrIntegration/images/merchant3.png" alt=""></a>
								</li>
								<li><a href=""><img
										src="/trendSetrIntegration/images/merchant1.png" alt=""></a>
								</li>
							</ul>
						</div>
						<div class="product-footer">
							<button class="btn btn-success quickbuy fullwidth"
								data-toggle="modal" data-target="#purchase-modal"
								data-dismiss="modal">Quick Buy</button>
						</div>
						<div class="product-footer">
							<button class="btn btn-primary addtocart">Add to Cart</button>
							<button class="btn btn-default gift" data-toggle="modal"
								data-target="#gift-modal" data-dismiss="modal">Gift</button>
						</div>
					</div>
					<!-- ./product content -->
				</div>
			</div>
		</div>
	</div>
	<!-- ./product modal -->
	<!-- purchase-modal -->
	<div class="modal fade" data-backdrop="static" id="purchase-modal"
		tabindex="-2">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<h1 class="modal-title">Purchase Complete</h1>
					<div class="form-group">
						<textarea name="postmessage" id="" class="form-control" rows="4"></textarea>
					</div>
					<div class="social-icons">
						<ul class="list-inline list-unstyled">
							<li><a href=""><i class="fa fa-facebook fa-4x"></i></a></li>
							<li><a href=""><i class="fa fa-twitter fa-4x"></i></a></li>
							<li><a href=""><i class="fa fa-instagram fa-4x"></i></a></li>
						</ul>
					</div>
					<footer>
						<button class="btn btn-default keep-private" data-dismiss="modal">Keep
							Private</button>
						<button class="btn btn-success quickbuy" data-dismiss="modal">Post</button>
					</footer>
				</div>
			</div>
		</div>
	</div>
	<!-- ./purchase modal -->
	<!-- gift -->
	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="gift-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content" style="border: 1px solid grey;">
				<div class="modal-body">
					<h1 class="modal-title">Select a friend</h1>
					<div class="form-group">
						<input type="search" name="search">
					</div>
					<div class="friend-list fullwidth">
						<ul class="list-inline list-unstyled">
							<li><a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="friends">
									<span>Name</span> </a></li>
							<li><a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="friends"><span>Name</span></a>
							</li>
							<li><a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="friends"><span>Name</span></a>
							</li>
							<li><a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="friends"><span>Name</span></a>
							</li>
						</ul>
						<ul class="list-inline list-unstyled">
							<li><a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="friends">
									<span>Name</span> </a></li>
							<li><a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="friends"><span>Name</span></a>
							</li>
							<li><a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="friends"><span>Name</span></a>
							</li>
							<li><a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="friends"><span>Name</span></a>
							</li>
						</ul>
					</div>
					<div class="clearfix"></div>
					<footer class="fullwidth">
						<button class="btn btn-success quickbuy" data-dismiss="modal">Continue</button>
					</footer>
				</div>
			</div>
		</div>
	</div>
	<!-- .gift -->
	<!-- ./product details image modal -->
	<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->
</body>

</html>
