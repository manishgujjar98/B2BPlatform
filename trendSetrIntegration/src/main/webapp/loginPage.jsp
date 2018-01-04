<!DOCTYPE html>
<html>
<head>
<title>Log in Page</title>
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
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
<!-- custom styles -->
<link rel="stylesheet" href="./css/app.css">
<link rel="stylesheet" href="./css/registrationPage.css">
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
	
</script>

<script type="text/javascript">
	function LoginCheck() {
		var username = $('#username').val();
		if ($('#username').val() == "") {
			alert("Please enter valid e-mail address!");
			return false;
		} else if ($('#password').val() == "") {
			alert("Please enter your password!");
			return false;
		} else {
			var re = /\S+@\S+\.\S+/;
			if (re.test(username)) {
				localStorage.setItem("email", username);
			} else {
				localStorage.setItem("userId", username);
			}
			if (document.getElementById('rememberMe').checked) {
				localStorage.setItem("rememberMe", "on");
				$("#hdnrememberMe").val("on")
			} else {
				$("#hdnrememberMe").val("")
			}
			alert(document.login);
			$("#hdnaction").val(document.login);
			localStorage.setItem("password", $('#password').val());
			document.login.action = "/LoginController"
			document.login.submit();
		}
	}
</script>

</head>

<body class="login-page"
	style="background-image: url('./images/Login.png'); background-repeat: no-repeat; background-size: cover;">
	<section class="col-sm-12">
		<section class="row">
			<section class="container">
				<h1 class="title-head">Welcome to TrendSetr</h1>
				<!-- contact form -->
				<input type="hidden" name="hdnaction" id="hdnaction">
				<div
					class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 contact">
					<div class="panel panel-default">

						<div class="panel-body">
							<form name="login" class="form-horizontal text-center"
								action="LoginController" method="POST" role="form">
								<h4 class="text-center" style="font-family: TimesNewRoman">
									<font color="Red"> <%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%>
									</font>
								</h4>
								<legend>
									<h3 class="text-center">Log in</h3>
								</legend>
								<div class="form-group">
									<div class="col-sm-12">
										<input type="text" name="username" class="form-control"
											id="username" placeholder="Email or Username" required>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<input type="password" name="password" class="form-control"
											id="password" placeholder="Password" required>
									</div>
								</div>
								<div class="form-group" style="display: none">
									<div class="col-sm-12">
										<input type="text" name="hdnrememberMe" id="hdnrememberMe">
									</div>
								</div>

								<div class="form-group">
									<div class=" col-lg-12">
										<div class="checkbox">
											<label> <input type="checkbox" id="rememberMe"
												name="rememberMe"> Remember me
											</label> <a class="col-xs-offset-2 " href="./PasswordController"
												style="text-decoration: none; color: #A1C5DF">Forgot
												Password?</a>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-8">
										<input type="submit" class="btn btn-sample log-in" value="Log
										in "></input>
									</div>
								</div>
							</form>
							<form name="getstarted" class="form-horizontal text-center"
								action="" method="POST" role="form">
								<div class="form-group">
									<div class="col-sm-offset-1 col-sm-10">
										<legend> </legend>
										<h5>
											<b>New to TrendSetr?</b>
										</h5>
										<button type="button" class="btn btn-sample get-started"
											id="get-started"
											onclick="window.location.href='./registrationPage.jsp'">Get
											Started</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</section>
	</section>
	<script>
		
	</script>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<!-- Material desig nscript -->
</body>

</html>
