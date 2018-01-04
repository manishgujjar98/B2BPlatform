<!DOCTYPE html>
<html>

<head>
<title>User Registration Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
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
<!-- custom styles -->
<link rel="stylesheet" href="/trendSetrIntegration/css/app.css">
<link rel="stylesheet"
	href="/trendSetrIntegration/css/registrationPage.css">
<!--[if IE]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
	function Input() {

		if (($('#password').val() != $('#repassword').val())) {
			alert("Passwords doesnot match");
			return false;
		} else {
			localStorage.setItem("firstname", $('#firstname').val());
			localStorage.setItem("lastname", $('#lastname').val());
			localStorage.setItem("dateofbirth", $('#dateofbirth').val());
			localStorage.setItem("email", $('#email').val());
			localStorage.setItem("phonenumber", $('#phonenumber').val());
			localStorage.setItem("username", $('#username').val());
			localStorage.setItem("password", $('#password').val());
			localStorage.setItem("userRoleId", $('#userRoleId').val());
			localStorage.setItem("status", $('#status').val());
			document.registration.action = "/trendSetrIntegration/commons/genderSelectPage.jsp"
			document.registration.submit();
		}
	}
</script>
</head>
<style>
</style>

<body class="registration-page">
	<div class="logo-container" align="center">
		<div class="title">
			<h2>TrendSetr</h2>
		</div>
		<div class="pull-right mt-25">
			<span> <a class="login" href="/LoginController">Login
					&nbsp;</a><span class="have_an_account">Have an account? &nbsp;
			</span></span>
		</div>
	</div>
	<div class="create_account"
		style="width: 100%; max-width: 100%; height: auto;" align="center">
		<div
			class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 contact">
			<form name="registration"
				class="form-horizontal text-center registration-form" action=""
				method="POST" role="form">
				<legend>
					<h2>Become a TrendSetr</h2>
				</legend>
				<input class="form-control" type="hidden" id="userRoleId"
					name="userrole" value="2" /> <input class="form-control"
					type="hidden" id="status" name="status" value="1" />
				<div class="form-group">
					<div class="fname col-sm-6">
						<input class="form-control" type="text" id="firstname"
							placeholder="First Name" name="firstname" required>
					</div>
					<div class="lname col-sm-6">
						<input class="form-control" type="text" id="lastname"
							placeholder="Last Name" name="lastname" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<input class="form-control" type="text" id="dateofbirth"
							placeholder="YYYY-MM-DD" name="dateofbirth" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<input class="form-control" type="text" id="email"
							placeholder="Email" name="email" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<input class="form-control" type="text" id="phonenumber"
							placeholder="Phone Number" name="phonenumber" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<input class="form-control" type="text" id="username"
							placeholder="Username" name="username" required>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-12">
						<input class="form-control" type="password" id="password"
							placeholder="Password" name="password" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<input class="form-control" type="password" id="repassword"
							placeholder="Re-enter Password" name="repassword" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12 sign-up-button-div">
						<button type="button" class="btn btn-sample reg-next" id="next"
							onclick="Input()">Next</button>
					</div>
				</div>
				<h5>Or Create an Account Using</h5>
				<div class="social-icons mt20">
					<a href=""><img src="/trendSetrIntegration/images/Twitter.png"
						style="width: 32px;" /></a> <a href=""><img
						src="/trendSetrIntegration/images/Facebook.png"
						style="width: 32px;" /></a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
