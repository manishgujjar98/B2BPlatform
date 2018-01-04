<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- bootstrap -->
<link rel="stylesheet"
	href="/trendSetrIntegration/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/trendSetrIntegration/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- custom styles -->
<link rel="stylesheet" href="/trendSetrIntegration/css/app.css">
<!--[if IE]>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<title>Forgot Password</title>
<style>
.forgot-password-page a {
	text-decoration: none;
}
.forgot-password-page .color {
    background-color: #E85757;
    color: white;
    border: none;
    cursor: pointer;
    font-size: 20px;
}
</style>
</head>
<body style="background-color: #DEE0E3;">

	<div class="forgot-password-page container mt40">
		<div class="row">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<h2 class="text-center" style="margin: 0 0 20px 0;">Welcome to
						Trendsetr</h2>
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="text-center">
								<h3>
									<i class="fa fa-lock fa-4x"></i>
								</h3>
								<h2 class="text-center">Forgot Password?</h2>
								<p>You can reset your password here.</p>
								<div class="panel-body">

									<form class="form" method="post" action="PasswordController">
										<h4 class="text-center" style="font-family: TimesNewRoman">
											<font color="Red"> <%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%>
											</font>
										</h4>
										<fieldset>
											<div class="form-group">
												<div class="input-group">
													<span class="input-group-addon"><i
														class="glyphicon glyphicon-envelope color-blue"></i></span> <input
														id="emailInput" placeholder="email address"
														name="emailInput" class="form-control" type="email"
														oninvalid="setCustomValidity('Please enter a valid email address!')"
														onchange="try{setCustomValidity('')}catch(e){}"
														required="">
												</div>
											</div>
											<div class="form-group">
												<input class="btn btn-lg btn-sample btn-block color"
													value="Submit" type="submit">
											</div>
										</fieldset>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>