<header id="header">
	<section class="roww">
		<div class="logo-container">
			<h1>
				<a href="/trendSetrIntegration/customer/userProfile.jsp">TrendSetr</a>
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
								<li><a href="/trendSetrIntegration/customer/feed.jsp"><span class="material-icons">featured_play_list</span><span>Feed</span></a></li>
								<li><a href="/trendSetrIntegration/customer/notifications.jsp"><span class="material-icons">notifications</span><span>Notifications</span></a></li>
								<li><a href="/trendSetrIntegration/customer/cart.jsp"><span class="material-icons">shopping_cart</span><span>Cart</span></a></li>
								<li><a href="#" class="dropdown"> <img width="30px"
										class="img-circle" src="images/catimg2.jpg">
										<ul class="dropdown-menu">
											<li><a href="#"></a></li>
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
					<li><a href="/trendSetrIntegration/customer/feed.jsp"><span
							class="material-icons">featured_play_list</span><span>Feed</span></a></li>
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
					<li><a href="/trendSetrIntegration/customer/notifications.jsp"><span class="material-icons">notifications</span><span>Notifications</span></a></li>
					<li><a href="/trendSetrIntegration/customer/cart.jsp"><span class="material-icons">shopping_cart</span><span>Cart</span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <img width="30px"
							class="img-circle" src="/trendSetrIntegration/images/catimg2.jpg">
							<span>Profile <i class="caret"></i>
						</span>
					</a>
						<ul class="dropdown-menu">
							<li><a class="pull-left" href="#"
								style="display: inline-block">
									<div class="profile-details">
										<div class="media">
											<img width="50px" class="img-circle" src="images/catimg2.jpg">
											<div class="media-body">
												<span class="media-heading"><%=(session.getAttribute("firstName") == null) ? ""
					: session.getAttribute("firstName") + " " + session.getAttribute("lastName")%>
												</span> <span style="margin-top: -5px">@username</span>
											</div>
										</div>
									</div>
							</a></li>
							<li class="border-up-down"><a href="#">Account Balance:
									$00.00 </a></li>
							<li><a
								href="/trendSetrIntegration/customer/userSettings.jsp">Settings</a></li>
							<li><a href="/LoginController">Log
									out</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</section>
</header>