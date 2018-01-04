<!DOCTYPE html>
<html>

<head>
<title>User Profile</title>
<%@include file="customerStyles.jsp"%>

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


<body class="bglightgray user-profile">
	<!-- header -->
	<%@include file="customerNavigation.jsp"%>
	<!-- ./header -->
	<!-- user-feed-block -->
	<section id="user-feed"
		style="background-image: url(/trendSetrIntegration/images/merchantbanner1.png);"
		class="col-xs-12 wow">
		<section class="row">
			<div class="profile">
				<div class="user-feed-image">
					<a href="#" class="dropdown edit-image"> <img
						src="/trendSetrIntegration/images/profile2.png"
						alt="profile image">
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
					<span><%=(session.getAttribute("firstName") == null) ? ""
					: session.getAttribute("firstName") + " " + session.getAttribute("lastName")%></span>
					<span>@<%=(session.getAttribute("firstName") == null) ? "" : session.getAttribute("userId")%></span></span>
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
						<li><a href="#">Likes</a></li>
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
					<div class="inner-block">
						<div class="inner-content p10 ">
							<h1 class="inner-title">
								<a href="">Merchants We Love</a>
							</h1>
							<div class="inner-element circle">
								<a href=""><img
									src="/trendSetrIntegration/images/circle1.jpg" alt="product">Name</a>
								<a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="product">Name</a>
							</div>
							<div class="inner-element circle">
								<a href=""><img
									src="/trendSetrIntegration/images/circle3.jpg" alt="product">Name</a>
								<a href=""><img
									src="/trendSetrIntegration/images/circle4.jpg" alt="product">Name</a>
							</div>
							<div class="inner-element circle">
								<a href=""><img
									src="/trendSetrIntegration/images/circle1.jpg" alt="product">Name</a>
								<a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="product">Name</a>
							</div>
							<div class="inner-element circle">
								<a href=""><img
									src="/trendSetrIntegration/images/circle3.jpg" alt="product">Name</a>
								<a href=""><img
									src="/trendSetrIntegration/images/circle4.jpg" alt="product">Name</a>
							</div>
							<div class="inner-element circle">
								<a href=""><img
									src="/trendSetrIntegration/images/circle1.jpg" alt="product">Name</a>
								<a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="product">Name</a>
							</div>
							<div class="inner-element circle">
								<a href=""><img
									src="/trendSetrIntegration/images/circle3.jpg" alt="product">Name</a>
								<a href=""><img
									src="/trendSetrIntegration/images/circle4.jpg" alt="product">Name</a>
							</div>
							<div class="inner-footer">
								<a href="">see more</a>
							</div>
						</div>
					</div>
				</aside>
				<!-- products for you -->
				<!-- people you may know -->
				<aside class="aside right-aside">
					<div class="inner-block">
						<div class="inner-content p10 ">
							<h1 class="inner-title">
								<a href="">New Merchants</a>
							</h1>
							<div class="inner-element circle">
								<a href=""><img
									src="/trendSetrIntegration/images/circle1.jpg" alt="product">Name</a>
								<a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="product">Name</a>
							</div>
							<div class="inner-element circle">
								<a href=""><img
									src="/trendSetrIntegration/images/circle3.jpg" alt="product">Name</a>
								<a href=""><img
									src="/trendSetrIntegration/images/circle4.jpg" alt="product">Name</a>
							</div>
							<div class="inner-element circle">
								<a href=""><img
									src="/trendSetrIntegration/images/circle1.jpg" alt="product">Name</a>
								<a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="product">Name</a>
							</div>
							<div class="inner-element circle">
								<a href=""><img
									src="/trendSetrIntegration/images/circle3.jpg" alt="product">Name</a>
								<a href=""><img
									src="/trendSetrIntegration/images/circle4.jpg" alt="product">Name</a>
							</div>
							<div class="inner-element circle">
								<a href=""><img
									src="/trendSetrIntegration/images/circle1.jpg" alt="product">Name</a>
								<a href=""><img
									src="/trendSetrIntegration/images/circle2.jpg" alt="product">Name</a>
							</div>
							<div class="inner-element circle">
								<a href=""><img
									src="/trendSetrIntegration/images/circle3.jpg" alt="product">Name</a>
								<a href=""><img
									src="/trendSetrIntegration/images/circle4.jpg" alt="product">Name</a>
							</div>
							<div class="inner-footer">
								<a href="">see more</a>
							</div>
						</div>
					</div>
				</aside>
				<!-- people you many know -->
				<!-- main content -->
				<article class="main">
					<div class="col-xs-12 feed">
						<div class="row">
							<div class="feed-block">
								<img src="/trendSetrIntegration/images/post1.png"
									class="fixed-image" alt="image">
								<div class="feed-header-fixed-top">
									<img src="/trendSetrIntegration/images/lucylogo.png"
										alt="image"> <span>Lucy's Boutique</span>
								</div>
								<figure class="feed-footer-fixed-bottom">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/post1.png);"></div>
										<span>Just got my new Sweater</span>
									</figcaption>
								</figure>
							</div>
							<div class="feed-block bgwhite">
								<div class="feed-header">
									<img src="/trendSetrIntegration/images/lucylogo.png"
										alt="image"> <span>Lucy's Boutique</span>
								</div>
								<div class="feed-social-block">
									<ul class="list-inline list-unstyled pull-right">
										<li><a href="">Like</a></li>
										<li><a href="">Comment</a></li>
									</ul>
								</div>
								<div class="feed-content-block">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Libero quam facilis error repellat, officiis nesciunt!
										Facilis dolore beatae nesciunt veritatis iste dolorem tempore
										consequuntur error odit. Quia facere labore eveniet.</p>
								</div>
							</div>
							<div class="feed-block bgwhite">
								<div class="feed-header">
									<img src="/trendSetrIntegration/images/lucylogo.png"
										alt="image"> <span>Lucy's Boutique</span>
								</div>
								<div class="feed-social-block">
									<ul class="list-inline list-unstyled pull-right">
										<li><a href="">Like</a></li>
										<li><a href="">Comment</a></li>
									</ul>
								</div>
								<div class="feed-content-block">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Libero quam facilis error repellat, officiis nesciunt!
										Facilis dolore beatae nesciunt veritatis iste dolorem tempore
										consequuntur error odit. Quia facere labore eveniet.</p>
								</div>
							</div>
							<div class="feed-block bgwhite">
								<div class="feed-header shared">
									<img src="/trendSetrIntegration/images/lucylogo.png"
										alt="image"> <span style="display: inline-block;">
										<span style="display: block">Name</span> <span
										style="display: block">Shared Name</span>
									</span>
								</div>
								<div class="feed-header">
									<img src="/trendSetrIntegration/images/lucylogo.png"
										alt="image"> <span>Lucy's Boutique</span>
								</div>
								<div class="feed-social-block">
									<ul class="list-inline list-unstyled pull-right">
										<li><a href="">Like</a></li>
										<li><a href="">Comment</a></li>
									</ul>
								</div>
								<div class="feed-content-image-block"
									style="background-image: url(/trendSetrIntegration/images/merchant.jpg);">
									<ul class="list-inline list-unstyle mb0">
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
							</div>
							<div class="feed-block bgwhite">
								<div class="feed-header shared">
									<img src="/trendSetrIntegration/images/lucylogo.png"
										alt="image"> <span style="display: inline-block;">
										<span style="display: block">Name</span> <span
										style="display: block">Shared Name</span>
									</span>
								</div>
								<div class="feed-header">
									<img src="/trendSetrIntegration/images/lucylogo.png"
										alt="image"> <span>Lucy's Boutique</span>
								</div>
								<div class="feed-social-block">
									<ul class="list-inline list-unstyled pull-right">
										<li><a href="">Like</a></li>
										<li><a href="">Comment</a></li>
									</ul>
								</div>
								<div class="feed-content-image-block"
									style="background-image: url(/trendSetrIntegration/images/merchant.jpg);">
									<ul class="list-inline list-unstyle mb0">
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
								<div class="feed-influenced">
									<div class="influence-title">Influence:</div>
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
							</div>
						</div>
					</div>
				</article>
			</section>
		</section>
	</section>
	<!-- ./content wrapper -->
	<!-- ./product details image modal -->
	<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->
</body>
</html>
