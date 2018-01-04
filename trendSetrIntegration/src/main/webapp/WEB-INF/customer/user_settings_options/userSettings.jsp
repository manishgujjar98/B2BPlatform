<!DOCTYPE html>
<html>
<head>
<%@include file="customerStyles.jsp"%>
</head>
<body class="bglightgray">
	<!-- header -->
	<%@include file="customerNavigation.jsp"%>
	<!-- ./header -->
	<!-- user settings -->
	<section class="col-xs-12" id="user-settings">
		<section class="row">
			<section class="container">
				<section class="row">
					<!--  user settings menu -->
					<section class="col-sm-3" id="settings-container">
						<%@include file="userSettingsMenu.jsp"%>
					</section>
					<!-- ./ user settings menu -->
					<!-- user settings content -->
					<section class="col-sm-9 settings-content" id="user-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h1>User Settings</h1>
								</div>
								<form action="" method="post">
									<div class="panel-body">
										<div class="col-sm-8 col-sm-offset-2">
											<div class="form-group">
												<label for="full-name" class="control-label">Full
													Name</label> <input type="text" name="fullname"
													class="form-control" placeholder="Full Name Last Name">
											</div>
											<div class="form-group">
												<label for="email" class="control-label">Email
													Address</label> <input type="email" name="email"
													class="form-control" placeholder="username@email.com"
													readonly="readonly">

											</div>
											<div class="form-group">
												<label for="phone-number" class="control-label">Phone
													Number</label> <input type="text" name="phone_number"
													class="form-control" placeholder="(000)-000-000">
											</div>
											<div class="form-group">
												<label for="dob" class="control-label">Birthday</label> <input
													type="date" name="birthday" class="form-control"
													placeholder="dd/mm/yyyy">
											</div>
											<div class="form-group">
												<label for="location" class="control-label">Location</label>
												<input type="text" name="birthday" class="form-control">
												<span class="help-block">add location on mobile app</span>
											</div>
										</div>
									</div>
									<div class="panel-footer">
										<button class="btn btn-danger" type="submit">Save
											Changes</button>
									</div>
								</form>
							</div>
						</section>
					</section>
					<!-- ./user settings content -->
				</section>
			</section>
		</section>
	</section>
	<!-- ./user settings -->
	<div class="clearfix"></div>
	<script>
		function findUserSettings(userId) {
			alert(userId);
			$.ajax({
				type : "GET",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/user"
						
				dataType : "json",
				success : function(responseData, status) {
					alert("hi success");
					$("#firstname").val(responseData.firstName);
					$("#lastname").val(responseData.lastName);
					$("#username").val(responseData.userId);
					$("#email").val(responseData.email);
					$('#email').prop('readonly', true);
					$("#phonenumber").val(responseData.phoneNumber);
					$("#dateofbirth").val(responseData.dateOfBirth);

				},
				error : function(request, status, error) {
					alert("request.." + request);
					alert("status.." + status);
					alert("error.." + error);
				}
			});
		}
	</script>
<!-- ./product details image modal -->
	<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->

</html>