<html>

<head>
<title>Social Media Connect</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>  
function getstarted(){	

	$.ajax({
    type: "POST",
    contentType: "application/json",
    url: "/trendSetr/rest/user",           
    data:formDataToJSON(),
    dataType: "json",
    success: function (responseData, status) {
        document.contact.action = "/LoginController"
		document.contact.submit();   
    },
    error: function (request, status, error) {
    	alert("failed in social media");
    	alert("request.."+request);
        alert("status.."+status);
        alert("error.."+error);
    }
	});
}


function formDataToJSON() {
			    return JSON.stringify(
			    	{
			    		"firstName": localStorage.getItem("firstname"),
			    		"lastName": localStorage.getItem("lastname"),
			    		"dateOfBirth":localStorage.getItem("dateofbirth"),
		    		    "email":localStorage.getItem("email"),
		    		    "phoneNumber":localStorage.getItem("phonenumber"),
			    		"userId": localStorage.getItem("email"),
				        "password": localStorage.getItem("password"),
				        "roleId": localStorage.getItem("userRoleId"),
				        "createdBy":localStorage.getItem("lastname"),
				        "status":localStorage.getItem("status"),
				        "gender":localStorage.getItem("gender")  
			        }
			    );
			}

	   </script>

</head>

<body class="social-connect-page">
	<section class="col-md-12">
		<section class="row">
			<div class="logo-container" align="center">
				<div class="title">
					<h2>TrendSetr</h2>
					<div style="margin-top: -35px;">
						<a class="login" href="/LoginController" style="font-size: 16px;">Login
							&nbsp;</a><span class="have_an_account hidden-xs pull-right"
							style="font-size: 16px;">Have an account? &nbsp; </span>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<section class="container">
				<!-- contact form -->
				<div class="col-sm-12 col-md-6 col-md-offset-3  contact">
					<form class="form-horizontal text-center" name="contact" action=""
						method="POST" role="form">
						<legend>
							<h2>Link to Social Media</h2>
						</legend>
						<div class="center-block text"><h5>Linking social media accounts
							allows you to share what you buy with your friends, so we can
							automatically reward you for your social influence! (Trust us, it
							will make your life easier to do it now)</h5></div>
						<div class="form-group social-icons">
							<!--  <input type="hidden" name="social-media" value="facebook"> -->
							<a href=""><img class="media_selection"
								src="/trendSetrIntegration/images/Facebook.png"
								data-social="facebook" style="width: 40px;" /></a> <a href=""><img
								class="media_selection"
								src="/trendSetrIntegration/images/Twitter.png"
								data-social="twitter" style="width: 40px;" /></a> <a href=""><img
								class="media_selection"
								src="/trendSetrIntegration/images/Instagram.png"
								data-social="instagram" style="width: 40px;" /></a>
						</div>
						<h6>Make My Life Harder</h6>
						<button class="btn btn-sample" type="button" id="next"
							onclick="getstarted()">Get Started</button>

					</form>
				</div>
			</section>
		</section>
	</section>
	<!--  <script>
   $(document).on('click', '.media_selection', function(e) {
       $('input[name=social-media]').val($(this).attr('data-social'));
   
       $(this).addClass('active');
   });
   </script> -->
</body>

</html>
