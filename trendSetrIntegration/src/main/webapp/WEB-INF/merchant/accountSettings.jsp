<!DOCTYPE html>
<html>
<title>B2B Account Settings</title>
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

.list-group-item a {
	color: black;
}

.list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover
	{
	text-shadow: none;
	color: white;
}

.form-group .control-label {
	text-align: left;
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
		<input type="hidden" id="cpwdstatus"
		value="<%=session.getAttribute("currentPasswordDescription")%>">
	<section class="col-sm-12 b2b-header-margin" id="account-settings">
		<section class="row">
			<section class="container">
				<section class="">
					<!--  user settings menu -->
					<section class="col-sm-3" id="settings-container">
						<section class="row">
							<ul class="list-group no-border-bottom">
								<li class="list-group-item active"><a
									href="./accountSettings.jsp"><i class="fa fa-user-o"></i>
										Account Information</a></li>
								<li class="list-group-item"><a href="./b2bBanking.jsp"><i
										class="fa fa-dollar"></i> Banking</a></li>
								<li class="list-group-item"><a
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
					<section class="col-sm-9 settings-content"
						id="balance-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="text-center">Account Information</h3>
								</div>
								<div class="panel-body text-center">
									<form name="update" class="form-horizontal text-center"
										action="" method="POST" role="form">
										<div class="form-group">
											<label for="storeName" class="col-sm-3 control-label">Business
												Name</label>
											<div class="col-sm-9">
												<input type="text" name="storeName" class="form-control"
													id="bname" placeholder="Enter Business Name"
													readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<label for="email" class="col-sm-3 control-label">Email</label>
											<div class="col-sm-9">
												<input type="email" name="eMail" class="form-control"
													id="email" placeholder="Enter your Email"
													readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<label for="currentpswd" class="col-sm-3 control-label">Current
												Password</label>
											<div class="col-sm-9">
												<input type="password" name="currentPassword"
													class="form-control" id="currentpswd"
													placeholder="Enter Current Password" required>
											</div>
										</div>
										<div class="form-group">
											<label for="newpswd" class="col-sm-3 control-label">New
												Password</label>
											<div class="col-sm-9">
												<input type="password" name="updatePassword"
													class="form-control" id="newpswd"
													placeholder="Enter New Password" required>
											</div>
										</div>
										<div class="form-group">
											<label for="confirmpswd" class="col-sm-3 control-label">Confirm
												Password</label>
											<div class="col-sm-9">
												<input type="password" class="form-control" id="confirmpswd"
													placeholder="Confirm Password" required>
											</div>
										</div>
										<button type="submit" class="btn btn-sample save-button"
											onClick="myFunction()"
											style="background-color: #315cf2; color: white;">Save</button>
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
	<!-- ./user settings -->
	<!-- JS Files -->
	<%@include file="merchantFooter.jsp"%>
	
	<script>
		function myFunction() {
			var pass1 = document.getElementById("newpswd").value;
			var pass2 = document.getElementById("confirmpswd").value;
			if (pass1 != pass2) {
				alert("Passwords Do not match");
				document.getElementById("newpswd").style.borderColor = "#E34234";
				document.getElementById("confirmpswd").style.borderColor = "#E34234";
				
			} else {
				alert("Passwords Match!!!");
				updateDetails();
			}
		}
	</script>
	
	<script>
	$(document).ready(function() {
		$("#email").val($("#hiddenUID").val());
		
		
		
		$
		.ajax({
			type : "GET",
			contentType : "application/json; charset=utf-8",
			url : "/trendSetr/rest/user/merchant/merchantStrore/get/storeName/"
					+ $("#hiddenUID").val(),
			dataType : "json",
			success : function(responseData, status) {
				$("#bname").val(responseData.storeName);
				if($("#cpwdstatus").val() == "current_password_notmatch"){
					alert("current password is wrong");
				}
			},
			error : function(request, status, error) {
				alert("request.." + request);
				alert("status.." + status);
				alert("error.." + error);
			}

		});

	});

		function updateDetails() {
			document.update.action = "../UpdateController"
			document.update.submit();

		}
	</script>
	


</body>

</html>
