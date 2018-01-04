<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Change Password Page</title>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- custom styles -->
<link rel="stylesheet" href="/trendSetrIntegration/css/app.css">
<link rel="stylesheet" href="./css/registrationPage.css">
<!--[if IE]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
	function Input() {

		alert($("#hiddenUID").val());
		if (($('#password').val() != $('#repassword').val())) {
			alert("Passwords doesnot match");
			return false;
		} else {
			localStorage.setItem("firstname", $('#firstname').val());
			localStorage.setItem("lastname", $('#lastname').val());
			localStorage.setItem("dateofbirth", $('#dateofbirth').val());
			localStorage.setItem("password", $('#password').val());
			/* localStorage.setItem("userRoleId", $('#userRoleId').val());
			localStorage.setItem("status", $('#status').val());
			document.registration.action = ""
			document.registration.submit(); */

			var input = JSON.stringify({
				"userId" : $('#hiddenUID').val(),
				"password" : $('#password').val(),
				"dateOfBirth" : $('#dateofbirth').val()

			});
			//alert(input);

			$.ajax({
				type : "POST",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/user/userUpdate/reset",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					alert("Password Reset successfully");
					$(location).attr('href', 'loginPage.jsp')
				},
				error : function(request, status, error) {
					alert(status);
					alert("Error");

				}
			});
		}
	}
</script>
<style>
.change-password-email-link .form-control {
	background: #EAEAEA;
	border: 1px solid #000;
	trasition: all .3s ease-out;
}

.change-password-email-link .form-control:focus {
	border: 1px solid #fff;
	box-shadow: none;
	background: #EAEAEA;
	-webkit-transition: all .3s ease-in;
	transition: all .3s ease-in;
}

.change-password-email-link .form-control:hover {
	border: 1px solid #fff;
	-webkit-transition: all .3s ease-in;
	transition: all .3s ease-in;
}

.change-password-email-link input::-webkit-input-placeholder {
	color: #AFAFAF;
}
.change-password-email-link .resetpassword-button {
    background-color: #E85757;
    color: white;
    border: none;
    cursor: pointer;
    font-size: 20px;
}

</style>
</head>
<body class="change-password-email-link"
	style="background-color: #DEE0E3;">
	<div class="logo-container" align="center">
		<div class="title">
			<h2>TrendSetr</h2>
		</div>
	</div>
	<input type="hidden" id="hiddenUID"
		value="<%=request.getParameter("emailInput")%>">
	<div class="change-password-body"
		style="width: 100%; max-width: 100%; height: auto;" align="center">
		<div
			class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 mt40 contact"
			style="background-color: white;">
			<form name="change-password"
				class="form-horizontal text-center registration-form" action=""
				method="POST" role="form">
				<legend>
					<h3>Change Password Here</h3>
				</legend>
				<input class="form-control" type="hidden" id="userRoleId"
					name="userrole" value="2" /> <input class="form-control"
					type="hidden" id="status" name="status" value="1" />

				<div class="form-group">
					<div class="col-sm-12">
						<input class="form-control" type="password" id="password"
							placeholder="Enter New Password" name="password" required="required">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<input class="form-control" type="password" id="repassword"
							placeholder="Re-enter Password" name="repassword" required="required">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12 sign-up-button-div">
						<button type="button" class="btn btn-sample resetpassword-button " id="next"
							onclick="Input()">Reset Password</button>
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
</html>