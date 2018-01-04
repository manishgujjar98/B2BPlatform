<!-- header -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	<header class="mdl-layout__header">
		<div class="mdl-layout__header-row" style="background: #000000;">

			<button class="toggle-menu btn btn-primary btn-sm"
				style="background: transparent; z-index: 2; border: 1px solid black; margin-left: -50px; -webkit-box-shadow: none; box-shadow: none;">
				<i class="material-icons" style="color: white; font-size: 30px;">menu</i>
			</button>
			<span class="mdl-layout-title"
				style="margin-left: auto; margin-right: auto; display: block; position: absolute; width: 100%; left: 0; top: 0; text-align: center; padding-top: 25px;">TrendSetr</span>
			<nav class="sidebar-container">
				<section class="sidebar-menu">
					<a href="javascript:void(0)" class="menu-close">X</a>
					<figure class="image-holder">

						<div class=""
							style="height: 100px; width: 100px; border-radius: 50%; margin: 0 auto;">
							<div class="">
								<div class="box upload-image" id="adminprofileimage"
									style="height: 100px; width: 100px; padding: 0; border-radius: 50%;">
									<img src="" alt="" class="hide">
								</div>
								<input type="file" name="image" style="visibility: hidden;"
									class="image-browse">
							</div>
						</div>
						<figcaption id="loginUser"
							style="text-align: center; color: #000000; font-weight: bold;">
							<%=(session.getAttribute("firstName") == null) ? ""
					: session.getAttribute("firstName") + " " + session.getAttribute("lastName")%>

						</figcaption>
					</figure>

					<ul class="list-group">

						<li class="list-group-item"><a class=""
							id="merchantdashboard" href="./merchantDashboard.jsp">Dashboard</a></li>
						<li class="list-group-item"><a class=""
							id="productmanagement" href="./productManagement.jsp">Product
								Management</a></li>
						<li class="list-group-item"><a class="" id="ordermanagement"
							href="./orderManagement.jsp">Order Management</a></li>
						<li class="list-group-item hidden"><a class="hidden"
							id="featuredadspace" href="./featuredAdspace.jsp">Ad
								Management</a></li>
						<li class="list-group-item"><a class="" id="accountsettings"
							href="./accountSettings.jsp">Account Settings</a></li>
						<li class="list-group-item mt60 text-center"
							style="background: transparent;"><a class="mt60"
							href="../logoutPage.jsp"
							style="text-decoration: none; color: white; font-size: 20px; text-transform: capitalize; margin-left: -30px;">Sign
								Out</a></li>

					</ul>

				</section>
			</nav>
			<div class="mdl-layout-spacer"></div>
			<nav class="mdl-navigation mdl-layout__header--transparent">
				<button id="demo-menu-lower-right"
					class="mdl-button mdl-js-button mdl-button--icon">
					<i> <a class="mdl-navigation__link" href="#"
						style="width: 32px; height: 32px; background-color: #FFFFFF;"></a></i>
				</button>
				<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu"
					for="demo-menu-lower-right" style="top: 15px">
					<li style="">
						<div class="center-block"
							style="height: 50px; width: 50px; border-radius: 50%;">
							<div class="container">
								<input id="userProfileImage" type="image" src=""
									style="height: 50px; width: 50px; border-radius: 50%;" />

							</div>
						</div>
					</li>
					<li style="text-align: center; color: #000000; font-weight: bold;"><h5
							id="loginUser">
							<%=(session.getAttribute("firstName") == null) ? ""
					: session.getAttribute("firstName") + " " + session.getAttribute("lastName")%></h5></li>
					<li class="mdl-menu__item" style="text-align: center;">View
						TrendSetr Profile</li>
					<li class="mdl-menu__item" style="text-align: center;"><a
						href="../logoutPage.jsp"
						style="color: black; text-decoration: none;">Sign Out</a></li>
				</ul>
			</nav>
		</div>
	</header>
<!-- 	don't close div here it is closed in all b2b pages -->