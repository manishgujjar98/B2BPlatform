<!DOCTYPE html>
<html>

<head>
<!-- include merchant navigation -->
<%@include file="merchantStyles.jsp"%>
<link rel="stylesheet" href="../css/bulma.css">
<style>
html, body {
	background-color: #eee;
}

.b2b-header {
	background-color: black;
}

.logo-container h1 a {
	color: white;
	text-decoration: none;
}

.mdl-layout__drawer .mdl-navigation .mdl-navigation__link {
	color: white;
	text-decoration: none;
}

.mdl-layout__drawer .mdl-navigation .mdl-navigation__link:hover {
	color: black;
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
	top: 30px;
}

.title, .sub-title {
	word-break: inherit;
}

.mdl-button-group {
	position: relative;
	display: inline-block;
	vertical-align: middle; button { background-color : transparent;
	display: inline-block;
	float: left;
	margin: 0px;
	box-shadow: none;
	border-radius: 0px;
}

}
.today {
	border-left: 2px solid black;
	border-bottom: 2px solid black;
	border-top: 2px solid black;
	padding: 0 50px 0 50px;
	border-radius: 5px;
}

.week {
	border-left: 2px solid black;
	border-right: 2px solid black;
	border-bottom: 2px solid black;
	border-top: 2px solid black;
	padding: 0 50px 0 50px;
	left: -5px;
}

.month {
	border: 1px solid #000;
	padding: 0 50px 0 50px;
	left: -9px;
}

.ytd {
	border-right: 2px solid black;
	border-bottom: 2px solid black;
	border-top: 2px solid black;
	padding: 0 50px 0 50px;
	left: -15px;
	margin-right: -15px;
	border-radius: 5px;
}

#b2b-dashboard .inner-heading {
	font-size: 30px;
	padding-bottom: 15px;
}

#b2b-dashboard .tile {
	border-radius: 10px;
}

#b2b-dashboard .revenue .title {
	margin-top: 50px;
	margin-bottom: 50px;
	font-size: 40px;
	color: white;
}

#b2b-dashboard .revenue .subtitle {
	font-size: 20px;
	color: white;
}

article.tile.is-child.notification{
    padding: 1.25rem 0.5rem 1.25rem 1.5rem;
}


.notification .big {
	font-size: 40px;
}

.notification .small {
	font-size: 20px;
}

#b2b-dashboard .social .tile {
	
}

#b2b-dashboard .social .subtitle {
	font-size: 14px;
}

.dashboard-header {
	margin-bottom: 20px;
}

.dashboard-header #today-date {
	flex-grow: 1;
}

.dashboard-header .btn-group {
	flex-grow: 19;
}

.customer-count span {
	display: block;
	text-align: center;
	font-size: 20px;
}

.progress {
	border: none;
	border-radius: 0;
	height: 1.3rem;
	margin-bottom: 0;
}

.progress-bar {
	background-color: grey;
	line-height: 20px;
	margin-bottom: 0;
}

.progress-bar-sample {
	background-color: grey;
}
</style>

</head>

<body>
	<!-- header -->
	<%@include file="merchantNavigation.jsp"%>
	<!--header -->
	<!-- user settings -->
	<section class="col-sm-12 b2b-header-margin" id="b2b-dashboard">
		<section class="row">
			<section class="container">
				<section class="row">

					<div class="display-time col-sm-12 text-center">
						<p id="demo" style="font-size: 22px; font-weight:600;"></p>
						<script>
							var d = new Date();
							var days = [ "Sunday", "Monday", "Tuesday",
									"Wednesday", "Thursday", "Friday",
									"Saturday" ];
							var months = [ "January", "February", "March",
									"April", "May", "June", "July", "August",
									"September", "October", "November",
									"December" ];
							var date = d.getDate();
							var year = d.getFullYear();

							document.getElementById("demo").innerHTML = days[d
									.getDay()]
									+ ", "
									+ months[d.getMonth()]
									+ " "
									+ date
									+ ", " + year;
							// document.getElementById("demo").innerHTML = ;
							// document.getElementById("demo").innerHTML = days[d.getDate()];
							// document.getElementById("demo").innerHTML = days[d.getYear()];

							/* document.getElementById("today-date").innerHTML = Date();*/
						</script>
					</div>
					<div class="col-sm-12 text-center mt20" style="margin-bottom: 10px;">
						<div class="mdl-button-group">
							<button id="1" onclick="active(this.id)"
								class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect today">Today</button>
							<button id="2" onclick="active(this.id)"
								class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect week">Week</button>
							<button id="3" onclick="active(this.id)"
								class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect month">Month</button>
							<button id="4" onclick="active(this.id)"
								class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect ytd">YTD</button>
						</div>
						<script>
							var activebutton;

							function active(id) {
								if (activebutton != null) {
									document.getElementById(activebutton).style['background-color'] = 'transparent';
									document.getElementById(activebutton).style['color'] = '#000';
								}
								document.getElementById(id).style['background-color'] = 'black';
								document.getElementById(id).style['color'] = 'white';

								activebutton = id;

							}
						</script>
					</div>

					<div class="clearfix"></div>

					<h1 class="inner-heading mt20">Revenue</h1>

					<div class="tile is-ancestor">
						<div class="tile is-vertical">
							<div class="tile revenue">
								<div class="tile is-parent is-vertical text-center">
									<article class="tile is-child notification sales"
										style="background-color: #46bfbd;">
										<p class="title amount">$9093.28</p>
										<p class="subtitle sales">Sales</p>
									</article>
								</div>
								<div class="tile is-parent text-center">
									<article class="tile is-child notification is-warning orders"
										style="background-color: #fdb45c;">
										<p class="title">161</p>
										<p class="subtitle">Orders</p>
									</article>
								</div>
								<div class="tile is-parent is-vertical text-center">
									<article
										class="tile is-child notification is-danger customer-count"
										style="background-color: #f7676b;">
										<div class="title">
											<div class="pending-number text-cernter"
												style="float: left; display: inline-block;">
												<span class="small">New</span><span class="big">27</span>
											</div>
											<div class="dash"
												style="font-size: 50px; display: inline-block;">|</div>
											<div class="pending-number text-center"
												style="float: right; display: inline-block;">
												<span class="small">Returning</span><span class="big">134</span>
											</div>
											<div class="clearfix"></div>
										</div>

										<p class="subtitle text-center" style="margin-top: -50px;">Customers</p>
									</article>
								</div>
								<div class="tile is-parent text-center">
									<article
										class="tile is-child notification is-info average-order-value"
										style="background-color: #6c5e7f;">
										<p class="title">56.75</p>
										<p class="subtitle text-center">Average Order Value</p>
									</article>
								</div>
							</div>
						</div>
					</div>
					<div class="tile is-ancestor">
						<div class="tile is-vertical">
							<div class="tile">
								<div class="tile is-parent is-vertical social">
									<article class="tile is-child notification"
										style="background-color: transparent;">
										<h1 class="inner-heading">Social</h1>
										<div class="tile is-parent text-center">
											<article class="tile is-child  is-6 notification"
												style="background-color: #f79d98;">
												<p class="title">000</p>
												<p class="subtitle">Reach</p>
											</article>
											<article class="tile is-child notification"
												style="background-color: #92c3cd;">
												<p class="title amount">000</p>
												<p class="subtitle sales">Engagement</p>
											</article>
										</div>
										<div class="tile is-parent text-center">
											<article class="tile is-child  is-6 notification"
												style="background-color: #f7676b;">
												<p class="title">000</p>
												<p class="subtitle">Page Visits</p>
											</article>
											<article class="tile is-child notification"
												style="background-color: #5bb8ca;">
												<p class="title amount" style="">000</p>
												<p class="subtitle sales">Page Reach</p>
											</article>
										</div>
										<div class="tile is-parent text-center">
											<article class="tile is-child  is-6 notification"
												style="background-color: #f7464a;">
												<p class="title">000</p>
												<p class="subtitle">Referrals</p>
											</article>
											<article class="tile is-child notification"
												style="background-color: #1db4d2;">
												<p class="title" style="">000</p>
												<p class="subtitle">Referrals Per Post</p>
											</article>
										</div>
									</article>
								</div>
								<div class="tile is-parent">
									<article class="tile is-child notification"
										style="background-color: white;">
										<h1 class="inner-heading">State</h1>
										<p class="state-progress-bars">
										<div class="progress">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
												style="width: 80%">State Name</div>
										</div>
										<div class="progress">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
												style="width: 70%">State Name</div>
										</div>
										<div class="progress">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
												style="width: 60%">State Name</div>
										</div>

										</p>
										<h3 class="inner-heading">Gender & Age</h3>
										<div class="gender-chart" style="position: relative;">
											<img src="../images/woman.png" width="50px" height="250px"
												style="position: absolute; top: 54px; left: 55px;">
											<canvas id="myDoughnutChart2" height="125"
												style="display: inline-block; float: left;"></canvas>
											<img src="../images/maleicon.jpg" width="50px" height="250px"
												style="position: absolute; top: 54px; right: 55px;">

										</div>
										<p class="subtitle">
										<div class="progress">
											<div class="progress-bar"
												role="progressbar progress-bar-sample" aria-valuenow="40"
												aria-valuemin="0" aria-valuemax="100" style="width: 40%">18-20</div>
										</div>
										<div class="progress">
											<div class="progress-bar progress-bar-sample"
												role="progressbar" aria-valuenow="50" aria-valuemin="0"
												aria-valuemax="100" style="width: 50%">21-24</div>
										</div>
										<div class="progress">
											<div class="progress-bar progress-bar-sample"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: 60%">25-34</div>
										</div>
										<div class="progress">
											<div class="progress-bar progress-bar-sample"
												role="progressbar" aria-valuenow="70" aria-valuemin="0"
												aria-valuemax="100" style="width: 70%">35-44</div>
										</div>
										<div class="progress">
											<div class="progress-bar progress-bar-sample"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: 60%">45-54</div>
										</div>
										<div class="progress">
											<div class="progress-bar progress-bar-sample"
												role="progressbar" aria-valuenow="70" aria-valuemin="0"
												aria-valuemax="100" style="width: 70%">55-64</div>
										</div>
										<div class="progress">
											<div class="progress-bar progress-bar-sample"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: 60%">65+</div>
										</div>


									</article>
								</div>
								<div class="tile is-parent is-vertical">
									<article class="tile is-child notification"
										style="background-color: white;">
										<h1 class="inner-heading">Top Products</h1>
										<p class="title"></p>
										<canvas id="myDoughnutChart" height="200"></canvas>
										<p class="subtitle">
										<div class="progress">
											<div class="progress-bar progress-bar-success"
												role="progressbar" aria-valuenow="80" aria-valuemin="0"
												aria-valuemax="100" style="width: 80%">Product Name</div>
										</div>
										<div class="progress">
											<div class="progress-bar progress-bar-info"
												role="progressbar" aria-valuenow="70" aria-valuemin="0"
												aria-valuemax="100" style="width: 70%">Product Name</div>
										</div>
										<div class="progress">
											<div class="progress-bar progress-bar-warning"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: 60%">Product Name</div>
										</div>

										</p>
									</article>
								</div>
							</div>
						</div>
					</div>
				</section>
			</section>
		</section>
	</section>
	</div>
	<!-- ./user settings -->
	<div class="clearfix"></div>
	<!-- JS Files -->
	<%@include file="merchantFooter.jsp"%>

	<script>
		var gender = document.getElementById("myDoughnutChart2");
		var myDoughnutChart2 = new Chart(gender, {
			type : 'doughnut',
			data : {
				labels : [ "Male", "Female", ],
				datasets : [ {
					data : [ 300, 300 ],
					backgroundColor : [ "#36A2EB", "#A4A4A4" ],
					hoverBackgroundColor : [

					]
				} ]
			},
			options : 'options',
		});
	</script>
	<script>
		var ctx2 = document.getElementById("myDoughnutChart");
		var myDoughnutChart = new Chart(ctx2, {
			type : 'doughnut',
			data : {
				labels : [ "Men's Access", "Women's Access", "winter wear",
						"Summer wear", "New Releases" ],
				datasets : [ {
					data : [ 50, 100, 300, 120, 300 ],
					backgroundColor : [ "red", "#36A2EB", "#FFCE56", "#A4A4A4",
							"#2E2E2E" ],
					hoverBackgroundColor : [

					]
				} ]
			},
			options : 'options',
		});
	</script>
</body>

</html>
