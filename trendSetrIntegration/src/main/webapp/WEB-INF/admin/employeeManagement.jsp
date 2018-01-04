<!DOCTYPE html>
<html>

<head>

<title>Employee Sales</title>

<!-- include default styles  -->
<%@include file="adminStyles.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-datetimepicker.min.css" />
<style>
.admin-header {
	background-color: black;
}

#employee-management {
	position: relative;
	top: 30px;
}

.panel-footer h5 {
	color: grey;
}

.influencers-sales-div {
	margin-top: 10px;
	margin-bottom: 20px;
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
}

#add-employee-modal .panel, #edit-emplyee-modal .panel {
	margin-bottom: 0;
}

#add-employee-modal .panel-body, #edit-employee-modal .panel-body {
	background-color: #EEEEEE;
}

.employee-details .panel-body .form-group label {
	background-color:;
	text-align: left;
	margin-right: -15px;
	padding-bottom: 5px;
}

.search {
	margin-right: -5px;
	color: black;
}

#add-employee-modal .custom-image, #edit-employee-modal .custom-image {
	min-height: 350px;
}

#add-employee-modal .custom-image img, #edit-employee-modal .custom-image img
	{
	min-height: 350px;
}

#add-employee-modal .options-block, #edit-employee-modal .options-block
	{
	padding-top: 20px;
}

</style>


</head>

<body class="employee-management-page">
	<!-- header -->
	<%@include file="adminNavigation.jsp"%>
	<!--header -->
	<!-- user settings -->
	<section class="col-sm-12" id="employee-management">
		<section class="row">
			<section class="container">
				<section class="">
					<!--  user settings menu -->
					<div class="influencers-sales-div flex-container">
						<h3 class="">Employee Management</h3>
						<div class="col-sm-6 hidden-xs">
							<div class="input-group influencer-sales-search">
								<span class="input-group-btn">
									<button class="btn btn-default search" type="button">
										<i class="fa fa-search"> </i>
									</button>
								</span> <input type="text" class="form-control"
									placeholder="Search for...">
							</div>
							<!-- /input-group -->
						</div>
						<button class="btn btn-sample" data-toggle="modal"
							data-target="#add-employee-modal"
							style="font-size: 20px; background-color: #315cf2; color: white;">Add
							Employee</button>
					</div>
					<div class="col-sm-6 mb20 visible-xs">
						<div class="input-group influencer-sales-search">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search"> </i>
								</button>
							</span> <input type="text" class="form-control"
								placeholder="Search for...">
						</div>
						<!-- /input-group -->
					</div>
					<!-- ./user settings content -->
					<section class="col-sm-12 fulfilled-products-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-heading">
										<h3 class="text-center pull-left">
											<b>Employee</b>
										</h3>
										<h4 class="center-block pull-right">
											<p id="demo" style="font-size: 20px; font-weight: 600;"></p>
											<script>
												var d = new Date();
												var days = [ "Sunday",
														"Monday", "Tuesday",
														"Wednesday",
														"Thursday", "Friday",
														"Saturday" ];
												var months = [ "January",
														"February", "March",
														"April", "May", "June",
														"July", "August",
														"September", "October",
														"November", "December" ];
												var date = d.getDate();
												var year = d.getFullYear();

												document.getElementById("demo").innerHTML = days[d
														.getDay()]
														+ ", "
														+ months[d.getMonth()]
														+ " "
														+ date
														+ ", "
														+ year;
												// document.getElementById("demo").innerHTML = ;
												// document.getElementById("demo").innerHTML = days[d.getDate()];
												// document.getElementById("demo").innerHTML = days[d.getYear()];

												/* document.getElementById("today-date").innerHTML = Date();*/
											</script>
										</h4>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="panel-body text-center table-responsive">
									<div class="clearfix"></div>
									<div id="RegisteredEmployee"></div>

								</div>
							</div>
						</section>
					</section>
				</section>
			</section>
		</section>
	</section>
	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="add-employee-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<!-- product content -->
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">X</button>
						<div class="row">
							<div class="fullwidth">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="text-center">Add Employee</h4>
										<button type="button" class="close" data-dismiss="modal">X</button>
									</div>
									<div class="panel-body">
										<!-- Add Merchant Form Content -->
										<form class="form-horizontal text-center" name="addemployee"
											id="addemployee" method="post" action="">
											<div class="col-sm-4">
												<div class="row">
													<div class="container">
														<div class="box upload-image">
															<span class="text">Upload Photo</span> <img src=""
																id="displayImageID" alt="" class="hide">
														</div>
														<input type="file" name="image"
															style="visibility: hidden;" class="image-browse">
														<input type="hidden" id="profileimage">
													</div>
													<div class="options-block mb20">
														<button type="reset"
															class="btn btn-sample pull-left col-sm-5 wid50"
															style="background-color: #F7464A; color: white;">Cancel</button>
														<button class=" btn btn-sample pull-right col-sm-7 wid50"
															type="button" onclick="addEmployee()"
															style="background-color: #315CF2; color: white;">Add
															Employee</button>
														<div class="clearfix "></div>
													</div>
												</div>
											</div>
											<div class="col-sm-8 text-center employee-details ">
												<div class="panel panel-default ">
													<div class="panel-body text-center ">
														<input class="form-control" type="hidden" id="userRoleId"
															name="userrole" value="4" /> <input class="form-control"
															type="hidden" id="fname" name="firstnameoflogger"
															value="<%=session.getAttribute("firstName")%>" /> <input
															class="form-control" type="hidden" id="lname"
															name="lastnameoflogger"
															value="<%=session.getAttribute("lastName")%>" /> <input
															class="form-control" type="hidden" id="uId"
															name="userIdoflogger"
															value="<%=session.getAttribute("userId")%>" /> <input
															class="form-control" type="hidden" id="rId"
															name="roleIdoflogger"
															value="<%=session.getAttribute("roleId")%>" />

														<div class="form-group">
															<label for="firstname" class="col-sm-3 control-label">First
																Name</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="firstname"
																	name="firstname " placeholder="Enter First Name"
																	required>
															</div>
														</div>
														<div class="form-group">
															<label for="lastname" class="col-sm-3 control-label">Last
																Name</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="lastname"
																	name="lastname" placeholder="Enter Last Name" required>
															</div>
														</div>
														<div class="form-group">
															<label for="username" class="col-sm-3 control-label">User
																Name</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="username"
																	name="username" placeholder="Enter User Name" required>
															</div>
														</div>
														<div class="form-group">
															<label for="dateofbirth" class="col-sm-3 control-label">Date
																of Birth </label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="dateofbirth"
																	name="dateofbirth" placeholder="YYYY-MM-DD" required>
															</div>
														</div>
														<div class="form-group">
															<label for="address" class="col-sm-3 control-label">Address</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="address"
																	name="address" placeholder="Address" required>
															</div>
														</div>
														<div class="form-group">
															<label for="city" class="col-sm-3 control-label">City</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="city"
																	name="city" placeholder="City" required>
															</div>
														</div>
														<div class="form-group">
															<label for="state" class="col-sm-2 control-label">State</label>
															<div class="col-sm-4">
																<select name="state" class="form-control" id="state"
																	placeholder="State" required>
																	<option value="AL ">Alabama</option>
																	<option value="AK ">Alaska</option>
																	<option value="AZ ">Arizona</option>
																	<option value="AR ">Arkansas</option>
																	<option value="CA ">California</option>
																	<option value="CO ">Colorado</option>
																	<option value="CT ">Connecticut</option>
																	<option value="DE ">Delaware</option>
																	<option value="DC ">District Of Columbia</option>
																	<option value="FL ">Florida</option>
																	<option value="GA ">Georgia</option>
																	<option value="HI ">Hawaii</option>
																	<option value="ID ">Idaho</option>
																	<option value="IL ">Illinois</option>
																	<option value="IN ">Indiana</option>
																	<option value="IA ">Iowa</option>
																	<option value="KS ">Kansas</option>
																	<option value="KY ">Kentucky</option>
																	<option value="LA ">Louisiana</option>
																	<option value="ME ">Maine</option>
																	<option value="MD ">Maryland</option>
																	<option value="MA ">Massachusetts</option>
																	<option value="MI ">Michigan</option>
																	<option value="MN ">Minnesota</option>
																	<option value="MS ">Mississippi</option>
																	<option value="MO ">Missouri</option>
																	<option value="MT ">Montana</option>
																	<option value="NE ">Nebraska</option>
																	<option value="NV ">Nevada</option>
																	<option value="NH ">New Hampshire</option>
																	<option value="NJ ">New Jersey</option>
																	<option value="NM ">New Mexico</option>
																	<option value="NY ">New York</option>
																	<option value="NC ">North Carolina</option>
																	<option value="ND ">North Dakota</option>
																	<option value="OH ">Ohio</option>
																	<option value="OK ">Oklahoma</option>
																	<option value="OR ">Oregon</option>
																	<option value="PA ">Pennsylvania</option>
																	<option value="RI ">Rhode Island</option>
																	<option value="SC ">South Carolina</option>
																	<option value="SD ">South Dakota</option>
																	<option value="TN ">Tennessee</option>
																	<option value="TX ">Texas</option>
																	<option value="UT ">Utah</option>
																	<option value="VT ">Vermont</option>
																	<option value="VA ">Virginia</option>
																	<option value="WA ">Washington</option>
																	<option value="WV ">West Virginia</option>
																	<option value="WI ">Wisconsin</option>
																	<option value="WY ">Wyoming</option>
																</select>
															</div>
															<label for="zip" class="col-sm-2 control-label">Zip</label>
															<div class="col-sm-4">
																<input type="text" class="form-control" id="zip"
																	name="zip" placeholder="ZIP" required>
															</div>
														</div>
														<div class="form-group">
															<label for="country" class="col-sm-3 control-label">Country</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="country"
																	name="country" placeholder="Country" required>
															</div>
														</div>
														<div class="form-group">
															<label for="phonenumber" class="col-sm-3 control-label">Phone
																Number</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="phonenumber"
																	name="phonenumber"
																	placeholder="Enter your Phone Number" required>
															</div>
														</div>
														<div class="form-group">
															<label for="email" class="col-sm-3 control-label">Email</label>
															<div class="col-sm-9">
																<input type="email" class="form-control" id="email"
																	name="email" placeholder="Enter your Email" required>
															</div>
														</div>
														<div class="form-group">
															<label for="positionheld" class="col-sm-3 control-label">Position
																Held</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="positionheld" name="positionheld"
																	placeholder="Select" required>
															</div>
														</div>
													</div>
												</div>
											</div>
										</form>
										<!-- ./Add Merchant Form content -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ./product content -->
			</div>
		</div>
	</div>
	<div class="modal fade" data-keyboard="false " data-backdrop="static "
		id="edit-employee-modal" tabindex="-1 ">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<!-- product content -->
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">X</button>
						<div class="row ">
							<div class="fullwidth">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="text-center">Edit Employee</h4>
										<button type="button" class="close" data-dismiss="modal">X</button>
									</div>
									<div class="panel-body">
										<!-- Edit Merchant Form Content -->
										<form class="form-horizontal text-center"
											name="employeeeditform" method="post" action=" ">
											<div class="col-sm-4">
												<div class="row">
													<div class="container">
														<div class="box upload-image">
															<span class="text">Upload Photo</span> <img src=""
																id="displayImageID" alt="" class="hide">
														</div>
														<input type="file" name="image"
															style="visibility: hidden;" class="image-browse">
														<input type="hidden" id="profileimage">
													</div>
													<div class="options-block mb20">
														<button type="button" class="btn btn-sample pull-left col-sm-6 wid50"
															onclick="updateEmployee(null, true)"
															style="background-color: #F7464A; color: white;">Disable</button>
														<button class="btn btn-sample pull-right col-sm-6 wid50"
															onclick="updateEmployee()"
															style="background-color: #315CF2; color: white;">Save</button>
														<div class="clearfix"></div>
													</div>
												</div>
											</div>
											<div class="col-sm-8 text-center employee-details">
												<div class="panel panel-default">
													<div class="panel-body text-center">
														<div class="form-group">
															<label for="firstname2" class="col-sm-3 control-label">First
																Name</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="firstname2"
																	name="firstname2" placeholder="Enter Full Name"
																	required>
															</div>
														</div>
														<div class="form-group">
															<label for="lastname2" class="col-sm-3 control-label">Last
																Name</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="lastname2"
																	name="lastname2" placeholder="Enter Last Name" required>
															</div>
														</div>
														<input class="form-group" type="hidden" id="username2"
															name="username2" value="" />
														<div class="form-group">
															<label for="dateofbirth2" class="col-sm-3 control-label">Date
																of Birth </label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="dateofbirth2" name="dateofbirth2"
																	placeholder="YYYY-MM-DD" required>
															</div>
														</div>
														<div class="form-group">
															<label for="address2" class="col-sm-3 control-label">Address</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="address2"
																	name="address2" placeholder="Address" required>
															</div>
														</div>
														<div class="form-group">
															<label for="city2" class="col-sm-3 control-label">City</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="city2"
																	name="city2" placeholder="City" required>
															</div>
														</div>
														<div class="form-group">
															<label for="state2" class="col-sm-2 control-label">State</label>
															<div class="col-sm-4">
																<select name="state2" class="form-control" id="state2"
																	placeholder="State" required>
																	<option value="AL">Alabama</option>
																	<option value="AK">Alaska</option>
																	<option value="AZ">Arizona</option>
																	<option value="AR">Arkansas</option>
																	<option value="CA">California</option>
																	<option value="CO">Colorado</option>
																	<option value="CT">Connecticut</option>
																	<option value="DE">Delaware</option>
																	<option value="DC">District Of Columbia</option>
																	<option value="FL">Florida</option>
																	<option value="GA">Georgia</option>
																	<option value="HI">Hawaii</option>
																	<option value="ID">Idaho</option>
																	<option value="IL">Illinois</option>
																	<option value="IN">Indiana</option>
																	<option value="IA">Iowa</option>
																	<option value="KS">Kansas</option>
																	<option value="KY">Kentucky</option>
																	<option value="LA">Louisiana</option>
																	<option value="ME">Maine</option>
																	<option value="MD">Maryland</option>
																	<option value="MA">Massachusetts</option>
																	<option value="MI">Michigan</option>
																	<option value="MN">Minnesota</option>
																	<option value="MS">Mississippi</option>
																	<option value="MO">Missouri</option>
																	<option value="MT">Montana</option>
																	<option value="NE">Nebraska</option>
																	<option value="NV">Nevada</option>
																	<option value="NH">New Hampshire</option>
																	<option value="NJ">New Jersey</option>
																	<option value="NM">New Mexico</option>
																	<option value="NY">New York</option>
																	<option value="NC">North Carolina</option>
																	<option value="ND">North Dakota</option>
																	<option value="OH">Ohio</option>
																	<option value="OK">Oklahoma</option>
																	<option value="OR">Oregon</option>
																	<option value="PA">Pennsylvania</option>
																	<option value="RI">Rhode Island</option>
																	<option value="SC">South Carolina</option>
																	<option value="SD">South Dakota</option>
																	<option value="TN">Tennessee</option>
																	<option value="TX">Texas</option>
																	<option value="UT">Utah</option>
																	<option value="VT">Vermont</option>
																	<option value="VA">Virginia</option>
																	<option value="WA">Washington</option>
																	<option value="WV">West Virginia</option>
																	<option value="WI">Wisconsin</option>
																	<option value="WY">Wyoming</option>
																</select>
															</div>
															<label for="zip2" class="col-sm-2 control-label">Zip</label>
															<div class="col-sm-4">
																<input type="text" class="form-control" id="zip2"
																	name="zip2" placeholder="ZIP" required>
															</div>
														</div>
														<div class="form-group">
															<label for="country2" class="col-sm-3 control-label">Country</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="country2"
																	name="country2" placeholder="Country" required>
															</div>
														</div>
														<div class="form-group">
															<label for="phonenumber2" class="col-sm-3 control-label">Phone
																Number</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="phonenumber2" name="phonenumber2"
																	placeholder="Enter your Phone Number" required>
															</div>
														</div>
														<div class="form-group">
															<label for="email2" class="col-sm-3 concameratrol-label">Email</label>
															<div class="col-sm-9">
																<input type="email" class="form-control" id="email2"
																	name="email2" placeholder="Enter your Email"
																	readonly="readonly">
															</div>
														</div>
														<div class="form-group">
															<label for="positionheld2" class="col-sm-3 control-label">Position
																Held</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="positionheld2" name="positionheld2"
																	placeholder="Select" required>
															</div>
														</div>
													</div>
												</div>
											</div>
										</form>
										<!-- Edit Merchant Form content -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- product content -->
			</div>
		</div>
	</div>
	<!-- ./user settings -->
	<div class="clearfix"></div>
	<!-- JS Files -->
	<%@include file="adminFooter.jsp"%>
	<script src="https://sdk.amazonaws.com/js/aws-sdk-2.77.0.min.js"></script>
	<!-- upload files -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script src="../js/custom-file-input.js"></script>
	<script src="../js/jquery-v1.min.js"></script>
	<script src="../js/jquery.custom-file-input.js"></script>
	<script src="../js/bootstrap-datetimepicker.js"></script>
	<script>
		$(document).ready(function() {
			loadEmployee();
		})
		function loadEmployee() {

			$('#dateofbirth').datetimepicker({
				format : "YYYY-MM-DD"
			});

			$('#dateofbirth2').datetimepicker({
				format : "YYYY-MM-DD"
			});
			$
					.ajax({
						type : "GET",
						contentType : "application/json; charset=utf-8",
						url : "/trendSetr/rest/user/4",
						dataType : "json",
						success : function(responseData, status) {
							console.log(responseData);
							if (responseData != null) {
								var registerEmployeeHTML = "";
								var rCount = 0;
								var registerEmployeeHTML = registerEmployeeHTML
										+ '<table class="table table-hover text-center">'
										+ '<thead>'
										+ '<tr>'
										+ '<th class="text-center">Employee Name</th>'
										+ '<th class="text-center"><span>Employee Name </span>&nbsp;<span>DateCreated</span></th></thead>'
										+ '<tbody>';

								$
										.each(
												responseData,
												function(index, value) {
													if (this.status == 1) {
														registerEmployeeHTML = registerEmployeeHTML
																+ '<tr>'
																+ '<td>'
																+ this.firstName
																+ '&nbsp; &nbsp; <a onClick="findEmployee(this)" employeeStatus = "1" userId="'
																+ this.userId
																+ '" data-toggle="modal" data-target="#edit-employee-modal"><span class="glyphicon glyphicon-pencil"></span></a></td>'
																+ '<td><span>'
																+ this.createdBy
																+ '</span>&nbsp;<span>'
																+ "   "
																+ this.createdTime
																+ '</span></td>'
																+ '</tr>'
														rCount++;
													}

												});

								registerEmployeeHTML = registerEmployeeHTML
										+ "</tbody>" + "</table>";

								$("#RegisteredEmployee").html(
										registerEmployeeHTML);

								$("#RegisteredCountID").html(rCount);

								$("#RegisteredCountID1").html(rCount);
							}
						},
						error : function(request, status, error) {
							alert("request.." + request);
							alert("status.." + status);
							alert("error.." + error);
						}
					});

		}
		function findEmployee(fldObj) {
			var employeeId = $(fldObj).attr("userId");
			alert(employeeId);
			$
					.ajax({
						type : "GET",
						contentType : "application/json; charset=utf-8",
						url : "/trendSetr/rest/user/merchant/" + employeeId,
						dataType : "json",
						success : function(responseData, status) {
							alert("hiii");

							$("#firstname2").val(responseData.firstName);
							$("#lastname2").val(responseData.lastName);
							$("#username2").val(responseData.userId);
							$("#dateofbirth2").val(responseData.dateOfBirth);
							$("#address2").val(
									responseData.address.addressLine1);
							$("#city2").val(responseData.address.city);
							$("#state2").val(responseData.address.state.trim());//responseData.address.state);
							//alert(responseData.address.state);
							$("#zip2").val(responseData.address.zip);
							$("#country2").val(responseData.address.country);
							$("#phonenumber2").val(responseData.phoneNumber);
							$("#email2").val(responseData.email);
							$("#positionheld2").val(
									responseData.profile.positionHeld);
							if (typeof (responseData.profile.profileImage) != 'object') {
								$("#displayImageID").attr("src",
										responseData.profile.profileImage)
										.removeClass('hide');
								$('.upload-image > span:first-child').hide();
							}
						},
						error : function(request, status, error) {
							alert("request.." + request);
							alert("status.." + status);
							alert("error.." + error);
						}
					});
		}

		function updateEmployee(fldObj, makeDisabled) {
			alert("update Employee");

			st = makeDisabled ? "3" : "1";

			var inputObj = {
				"firstName" : $("#firstname2").val(),
				"lastName" : $("#lastname2").val(),
				"phoneNumber" : $('#phonenumber2').val(),
				"email" : $('#email2').val(),
				"dateOfBirth" : $('#dateofbirth2').val(),
				"status" : st,
				"userId" : $('#email2').val(),

				"profile" : {
					"positionHeld" : $('#positionheld2').val()
				},
				"address" : {
					"addressLine1" : $("#address2").val(),
					"city" : $("#city2").val(),
					"state" : $("#state2").val(),
					"zip" : $("#zip2").val(),
					"country" : $("#country2").val(),
					"status" : st,
					"createdBy" : $("#loginUser").html().trim()
				},

				"createdBy" : $("#loginUser").html().trim()
			}

			var input = JSON.stringify(inputObj);

			$.ajax({
				type : "PUT",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/user",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					alert("Employee updated Successfully!")
				},
				error : function(request, status, error) {
					alert("Error");
				}
			});
		}

		function addEmployee() {
			var empname = $('#firstname').val() + " " + $('#lastname').val();

			var loginUser = $("#loginUser").html().trim();

			var input = JSON.stringify({
				"firstName" : $('#firstname').val(),
				"lastName" : $('#lastname').val(),
				"userId" : $('#email').val(),
				"roleId" : $('#userRoleId').val(),
				"dateOfBirth" : $('#dateofbirth').val(),
				"phoneNumber" : $('#phonenumber').val(),
				"email" : $('#email').val(),
				"status" : "1",
				"profile" : {
					"userId" : $('#email').val(),
					"positionHeld" : $('#positionheld').val(),
					"createdBy" : loginUser
				},
				"address" : {
					"firstName" : $('#firstname').val(),
					"lastName" : $('#lastname').val(),
					"addressLine1" : $('#address').val(),
					"city" : $('#city').val(),
					"state" : $('#state').val(),
					"zip" : $('#zip').val(),
					"country" : $('#country').val(),
					"phoneNumber" : $('#phonenumber').val(),
					"status" : "1",
					"createdBy" : loginUser
				},
				//"password" : "",
				"createdBy" : loginUser
			});

			$.ajax({
				type : "POST",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/user",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					//document.addemployee.action = "./admin/employeeManagement.jsp"
					//document.addemployee.submit();
					$("#addemployee")[0].reset();
					$("#add-employee-modal").hide();
					alert("Emp added Success");
					loadEmployee();
				},
				error : function(request, status, error) {
					alert("Error");
				}
			});
		}
	</script>
</body>

</html>
