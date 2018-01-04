<html>

<head>
<title>Gender Selection</title>
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
<style>
.active {
	border: 2px solid red;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">

	function Selection()
	{
			    localStorage.setItem("gender",$('#gender').val());
		 		document.gender.action ="/trendSetrIntegration/commons/socialMediaConnect.jsp"
		 	    document.gender.submit();               
	}
	
</script>

</head>

<body class="gender-selection-page">
	<section class="col-md-12">
		<section class="row">
			<div class="logo-container" align="center">
				<div class="title">
					<h2>TrendSetr</h2>
					<div style="margin-top: -30px;">
						<a class="login" href="loginPage.html">Login &nbsp;</a><span
							class="have_an_account hidden-xs pull-right">Have an
							account? &nbsp; </span>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<section class="container">
				<!-- contact form -->
				<div class="col-sm-12 col-md-6 col-md-offset-3 contact">
					<form class="form-horizontal text-center" name="gender"  action="" method="POST"
						role="form">
						<legend>
							<h2>Choose your Gender</h2>
						</legend>
						<div class="form-group">
							<input type="hidden" name="gender"  id = "gender" value="male"> 
							<img
								class="img-circle gender_selection active" data-gender="male"
								src="/trendSetrIntegration/images/m.png"> 
							<img
								class="img-circle gender_selection" data-gender="female"
								src="/trendSetrIntegration/images/f.png">
						</div>
						<div class="Center-block gender-text inline-block">
							<h3 style="inline-block">Male</h3>
							<h3 style="inline-block">Female</h3>
						</div>
						<button type="button" class="btn btn-sample next" id="next"
							onclick="Selection()">Next</button>
							
					</form>
				</div>
			</section>
		</section>
	</section>
	<script src="/trendSetrIntegration/js/jquery.min.js"></script>
	<script>
    $(document).on('click', '.gender_selection', function(e) {
        $('input[name=gender]').val($(this).attr('data-gender'));
        $('.gender_selection').removeClass('active');
        $(this).addClass('active');
    });
    </script>
</body>

</html>
