<!DOCTYPE html>
<html>
<title>B2B Notifications</title>
<head>
<!-- Include Merchant Navigation -->
<%@include file="merchantStyles.jsp"%>
<style>
.admin-header {
	background-color: black;
}

.logo-container h1 a {
	color: white;
	text-decoration: none;
}

a:hover {
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
	top: 30px;
}
/* toggle buttons*/
.switch {
	position: relative;
	display: inline-block;
	width: 40px;
	height: 20px;
	margin-top: 8px;
}

.switch input {
	display: none;
}

.switch input:checked+.slider {
	background-color: #2196F3;
}

.switch input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

.switch input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

.switch .slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.switch .slider:before {
	position: absolute;
	content: "";
	height: 20px;
	width: 20px;
	box-shadow: 0 0 2px #000;
	left: 0;
	bottom: 0;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

.switch .slider.round {
	border-radius: 34px;
}

.switch .slider.round:before {
	border-radius: 50%;
}

.list-group-item a {
	color: black;
}

.list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover
	{
	text-shadow: none;
	color: white;
}
</style>
</head>

<body>
	<!-- header -->
	<%@include file="merchantNavigation.jsp"%>
	<!--header -->
	<!-- user settings -->
	<input type="hidden" id="hiddenUID"
		value="<%=session.getAttribute("userId")%>">
	<section class="col-sm-12 b2b-header-margin" id="b2b-notifications">
		<section class="row">
			<section class="container">
				<section>
					<!-- <div class="setings-back-div">
						<div class="pull-left">Settings</div>
						<button class="btn sample pull-right back-button"
							style="background-color: #315CF2; color: white; font-size: 18px; padding: 5px 35px 5px 35px;">Back</button>
						<div class="clearfix"></div>
					</div> -->
					<!--  user settings menu -->
					<section class="col-sm-3" id="settings-container">
						<section class="row">
							<!-- <ul class="list-group no-border-bottom">
								<li class="list-group-item"><a
									href="./accountSettings.jsp"><i
										class="fa fa-user-o"></i> Account Information</a></li>
								<li class="list-group-item"><a
									href="./b2bBanking.jsp"><i
										class="fa fa-dollar"></i> Banking</a></li>
								<li class="list-group-item active"><a
									href="./b2bNotifications.jsp"><i
										class="fa fa-book"></i> Notifications</a></li>
							</ul>
							<ul class="list-group no-border-top">
								<li class="list-group-item"><a href=""><i
										class="fa fa-file-o"></i> Tax Forms</a></li>
								<li class="list-group-item"><a href=""><i
										class="fa fa-truck"></i> Shipping</a></li>
								<li class="list-group-item"><a href=""><i
										class="fa fa-credit-card"></i> Privacy</a></li>
							</ul> -->
							<ul class="list-group no-border-bottom">
								<li class="list-group-item "><a
									href="./accountSettings.jsp"><i class="fa fa-user-o"></i>
										Account Information</a></li>
								<li class="list-group-item"><a href="./b2bBanking.jsp"><i
										class="fa fa-dollar"></i> Banking</a></li>
								<li class="list-group-item active"><a
									href="./b2bNotifications.jsp"><i class="fa fa-book"></i>
										Notifications</a></li>
							</ul>
							<ul class="list-group no-border-top">
								<li class="list-group-item"><a href=""><i
										class="fa fa-file-o"></i> Tax Forms</a></li>
								<li class="list-group-item"><a href="./shippingSettings.jsp"><i
										class="fa fa-truck"></i> Shipping</a></li>
								<li class="list-group-item"><a href=""><i
										class="fa fa-credit-card"></i> Privacy</a></li>
										<li class="list-group-item"><a href="./addressTab.jsp"><i
										class="fa fa-credit-card"></i> Address</a></li>
							</ul>
						</section>
					</section>
					<!-- ./ user settings menu -->
					<!-- user settings content -->
					<section class="col-sm-8 settings-content"
						id="balance-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="text-center">Notifications</h3>
								</div>
								<div class="panel-body text-center">
									<form class="form-horizontal text-center">
										<div class="form-group">
											<label for="bname" class="col-sm-6 control-label">Daily
												Performance</label>
											<div class="col-sm-3">
												<label class="switch "> <input type="checkbox"
													class="form-control " id="check1" name="textmsg " checked>
													<div class="slider round "></div>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label for="email" class="col-sm-6 control-label">Account
												Changes</label>
											<div class="col-sm-3">
												<label class="switch "> <input type="checkbox"
													class="form-control " id="check2" name="textmsg " checked>
													<div class="slider round"></div>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label for="newpswd" class="col-sm-6 control-label">TrendSetr
												Promos</label>
											<div class="col-sm-3">
												<label class="switch "> <input type="checkbox"
													class="form-control " id="check3" name="textmsg " checked>
													<div class="slider round"></div>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label for="confirmpswd" class="col-sm-6 control-label">Customer
												Direct Messages</label>
											<div class="col-sm-3">
												<label class="switch "> <input type="checkbox"
													class="form-control " id="check4" name="textmsg " checked>
													<div class="slider round"></div>
												</label>
											</div>
										</div>
										<button class="btn btn-primary save-button"
											onClick="notificationSettings()">Save</button>

									</form>
								</div>
							</div>
						</section>
					</section>
					<!-- ./user settings content -->
				</section>
			</section>
		</section>
	</section>
	</div>
	<!-- ./user settings -->
	<div class="clearfix"></div>
	<!-- Include JS Files -->
	<%@include file="merchantFooter.jsp"%>
	<!-- ./Include JS Files -->
</body>
<script>
	$(document).ready(
			function() {
				//alert("hi");
				$.ajax({
					type : "GET",
					contentType : "application/json; charset=utf-8",
					url : "/trendSetr/rest/notifications/"
							+ $("#hiddenUID").val(),
					dataType : "json",
					success : function(responseData, status) {
						alert(responseData.dailyPerformance);
						$("#check1").prop("checked",
								responseData.dailyPerformance);
						$("#check2").prop("checked",
								responseData.accountChanges);
						$("#check3").prop("checked",
								responseData.trendSetrPromos);
						$("#check4").prop("checked",
								responseData.customerDirectMessages);
					},
					error : function(request, status, error) {
						alert(status);
						alert("Error");

					}
				});
			})

	function notificationSettings() {
		var input = '{';

		input = input + '"dailyPerformance": ' + $("#check1").is(":checked")
				+ ',' + '"accountChanges": ' + $("#check2").is(":checked")
				+ ',' + '"trendSetrPromos": ' + $("#check3").is(":checked")
				+ ',' + '"customerDirectMessages": '
				+ $("#check4").is(":checked") + ',' + '"userId": "'
				+ $("#hiddenUID").val() + '"';
		input = input + '}';

		alert(input);

		$
				.ajax({
					type : "POST",
					contentType : "application/json; charset=utf-8",
					url : "/trendSetr/rest/notifications",
					data : input,
					dataType : "json",
					success : function(responseData, status) {
						alert("Notifications insert successfully");
						document.notificationSettings.action = "../merchant/b2bNotifications.jsp"
						document.notificationSettings.submit();
					},
					error : function(request, status, error) {
						alert(status);
						alert("Error");

					}
				});
		
		

	}
</script>

</html>
