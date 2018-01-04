<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<title>Account Settings</title>
<!-- include default styles  -->
<%@include file="adminStyles.jsp"%>

<style>
.admin-header {
	background-color: black;
}

#admin-account-page {
	position: relative;
	top: 80px;
}

.panel-footer h5 {
	color: grey;
}
</style>
</head>

<body>
	<!-- header -->
	<%@include file="adminNavigation.jsp"%>
	<!--header -->
	<!-- user settings -->
	<input type="hidden" id="hiddenUID"
		value="<%=session.getAttribute("userId")%>">
	<section class="col-sm-offset-3 col-sm-6 settings-content"
		id="admin-account-page">
		<section class="row">
			<div class="panel panel-default">
				<div class="panel-heading text-center">
					<h3>Account Settings</h3>
				</div>
				<form action="" method="post" name="">
					<div class="panel-body">
						<div class="col-sm-12">
							<div class="form-group">
								<label for="old-password" class="control-label">Current
									Password</label> <input type="password" name="oldPassword" id="oldPassword"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label for="new-password" class="control-label">New
									Password</label> <input type="password" name="newPassword" id="newPassword"
									class="form-control" required>
								<!-- <span class="help-block text-center">Password must be at-least six(6) characters and include at least one (1) number or symbol </span> -->
							</div>
							<div class="form-group">
								<label for="confirm-password" class="control-label">Confirm
									Password</label> <input type="password" name="confirmPassword" id="confirmPassword"
									class="form-control" required>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<button class="btn btn-danger pull-right"
							onClick="myFunction()" type="button">Change
							Password</button>
						<div class="clearfix"></div>
					</div>
				</form>
			</div>
			<div class="msg-block warning" style="display: none;">
				<strong>Incorrect Password! </strong>Your password has not changed!
			</div>
			<div class="msg-block success" style="display: none;">
				<strong>Success! </strong>Your password has been updated!
			</div>
		</section>
	</section>
	<!-- Add Influencer modal-->
	<!-- ./Send invite content -->

	<!-- .gift -->
	<%@include file="adminFooter.jsp" %>
	<!--  Validation for password and confirm password -->
	<script>
		function myFunction() {
			var pass1 = document.getElementById("newPassword").value;
			var pass2 = document.getElementById("confirmPassword").value;
			if (pass1 != pass2) {
				alert("Passwords Do not match");
				document.getElementById("newPassword").style.borderColor = "#E34234";
				document.getElementById("confirmPassword").style.borderColor = "#E34234";
				
			} else {
				alert("Passwords Match!!!");
				updateAdminPassword();
			}
		}
	</script>

	<script>
		function updateAdminPassword() {
			alert($('#hiddenUID').val());
			var input = JSON.stringify({
				
				"userId" : $('#hiddenUID').val(),
				"password" : $('#oldPassword').val(),
				"newPassword" : $('#newPassword').val(), 

			});
			alert(input);
			$.ajax({
				type : "PUT",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/user/update/changePassword",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					alert("Password updated Successfully!")
				},
				error : function(request, status, error) {
					alert("Error");
				}
			});
		}
	</script>
</body>

</html>