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
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- owl carousel -->
<link rel="stylesheet" href="vendor/owl/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="vendor/owl/assets/owl.theme.default.min.css">
<!-- animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- custom styles -->
<link rel="stylesheet" href="css/app.css">
<!--[if IE]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="bglightgray user-profile">
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
									<li><a href="#"><span class="material-icons">notifications</span><span>Notifications</span></a></li>
									<li><a href="#"><span class="material-icons">shopping_cart</span><span>Cart</span></a></li>
									<li><a href="#" class="dropdown"> <img width="30px"
											class="img-circle" src="images/catimg2.jpg">
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
								class="img-circle" src="images/catimg2.jpg"> <span>Profile
									<i class="caret"></i>
							</span>
						</a>
							<ul class="dropdown-menu">
								<li><a class="pull-left" href="#"
									style="display: inline-block">
										<div class="profile-details">
											<div class="media">
												<img width="50px" class="img-circle"
													src="images/catimg2.jpg">
												<div class="media-body">
													<span class="media-heading">Name </span> <span
														style="margin-top: -5px">@username</span>
												</div>
											</div>
										</div>
								</a></li>
								<li class="border-up-down"><a href="#">Account
										Banalance: $00.00 </a></li>
								<li><a href="#">Settings</a></li>
								<li><a href="#">Log out</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</section>
	</header>
	<!-- ./header -->
	<!-- user-feed-block -->
	<section id="user-feed"
		style="background-image: url(images/merchantbanner1.png);"
		class="col-xs-12 wow">
		<section class="row">
			<div class="profile">
				<div class="user-feed-image">
					<a href="#" class="dropdown edit-image"> <img
						src="images/profile2.png" alt="profile image">
						<div class="overlay">
							<span>Change <br> profile <br>image
							</span> <i class="fa fa-camera fa-lg"></i>
						</div>
					</a>
				</div>
				<ul class="upload-menu list-unstyled">
					<li><a href="#">Upload Profile Photo</a></li>
					<li><a href="#">Upload Banner Photo</a></li>
				</ul>
				<div class="user-feed-name">
					<span>Mike Lowe</span> <span>@mikelowe</span>
				</div>
			</div>
			<div class="feed-strip tint">
				<div class="followers-strip">
					<div>278 Followers</div>
					<div>678 Following</div>
				</div>
				<div class="custom-nav-tabs">
					<ul class="nav nav-tabs">
						<li><a href="">Feed</a></li>
						<li class="active"><a href="">Media</a></li>
						<li><a href="">Likes</a></li>
					</ul>
				</div>
			</div>
		</section>
	</section>
	<!-- user-feed-block -->
	<!-- content wrapper -->
	<section class="col-xs-12">
		<section class="row">
			<section class="wrapper mt20">
				<!-- products for you -->
				<aside class="aside left-side">
					<div class="inner-block"></div>
				</aside>
				<!-- products for you -->
				<!-- people you may know -->
				<aside class="aside right-aside"></aside>
				<!-- people you many know -->
				<!-- main content -->
				<article class="main">
					<div class="col-xs-12 likes">
						<div class="row">
							<!--  <ul class="likes-images list-inline list-unstyled">
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                            </ul>
                            <ul class="likes-images list-inline list-unstyled">
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                            </ul>
                            <ul class="likes-images list-inline list-unstyled">
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                            </ul>
                            <ul class="likes-images list-inline list-unstyled">
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                            </ul>
                            <ul class="likes-images list-inline list-unstyled">
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                                <li><a href=""><img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive"></a></li>
                            </ul> -->
							<ul id="grid" class="list-unstyled">

								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
								<li class="grid-item"><a href=""><img
										src="http://lorempixel.com/280/300/" alt="image"
										class="img-responsive"></a></li>
							</ul>
						</div>
					</div>
				</article>
			</section>
		</section>
	</section>
	<!-- ./content wrapper -->
	<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->
	

	<script>
		$(document).ready(function() {

			function setMansonary() {
				$col = 2;
				$space = 1;
				$width = $(window).width();

				if ($width < 600) {
					$col = 2;
				} else if ($width > 600 && $width < 992) {
					$col = 3;
				} else if ($width > 992) {
					$col = 4;
				}

				var $grid = $('#grid');
				new MasonryHybrid($grid, {
					col : $col,
					space : $space
				});

			}
			;
			setMansonary();

		});
	</script>

</body>

</html>
