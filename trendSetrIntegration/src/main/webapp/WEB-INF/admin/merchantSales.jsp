<!DOCTYPE html>
<html>

<head>
<title>Merchant Sales</title>
<%@include file="adminStyles.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-datetimepicker.min.css" />

<link rel="stylesheet" href="../css/fileinput.min.css">

<style>
.admin-header {
	background-color: black;
}

#merchant-page {
	position: relative;
	top: 30px;
}

.panel-footer h5 {
	color: grey;
}

.merchants-sales-div {
	margin-bottom: 20px;
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
}

.pending-number span {
	display: block;
	text-align: center;
	font-size: 20px;
}

.pending-number .number {
	font-size: 40px;
}

.merchant-details .panel-body .form-group label {
	background-color:;
	text-align: left;
	margin-right: -15px;
	padding-bottom: 5px;
}

.btn {
	margin-right: -5px;
	color: black;
}

.save-as-pending-button {
	margin-right: -2px;
}

#add-merchant-modal .panel, #edit-merchant-modal .panel {
	margin-bottom: 0;
}

#add-merchant-modal .panel-body, #edit-merchant-modal .panel-body {
	background-color: #EEEEEE;
}

#add-merchant-modal .custom-image, #edit-merchant-modal .custom-image {
	min-height: 430px;
}

#add-merchant-modal .custom-image img, #edit-merchant-modal .custom-image img
	{
	min-height: 430px;
}

#add-merchant-modal .options-block, #edit-merchant-modal .options-block
	{
	padding-top: 20px;
}

.options-block .add-merchant-button, .options-block .edit-merchant-button
	{
	margin-top: 2px;
}

#send-invite-modal .modal-dialog {
	width: 400px;
	margin-top: 200px;
}

.box {
	width: 250px;
	height: 300px;
	border: 1px solid #ccc;
	display: block;
	cursor: pointer;
	overflow: hidden;
	padding: 5px;
	box-sizing: border-box;
}

.box span {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>

</head>

<body>
	<!-- header -->
	<%@include file="adminNavigation.jsp"%>
	<input type="hidden" id="hdnMerchantStatus">

	<!--header -->
	<!-- user settings -->
	<section class="col-sm-12" id="merchant-page">
		<section class="row">
			<section class="container">
				<section class="">
					<!--  user settings menu -->
					<div class="middle-content center-block visible-xs mt20">
						<div class="col-xs-5">
							<div class="pending-number">
								<span><b>Pending</b></span><span id="PendingCountID1"
									class="number">0</span>
							</div>
						</div>
						<div class="col-xs-2">
							<div class="slash text-center"
								style="font-size: 60px; margin-top: 10px;">|</div>
						</div>
						<div class="col-xs-5">
							<div class="pending-number">
								<span><b>Registered</b></span><span id="RegisteredCountID1"
									class="number">0</span>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="merchants-sales-div mt20">
						<h4 class="">Merchant Sales</h4>
						<div class="middle-content center-block hidden-xs mt20">
							<div class="col-xs-5">
								<div class="pending-number">
									<span><b>Pending</b></span><span class="number"
										id="PendingCountID">0</span>
								</div>
							</div>
							<div class="col-xs-2">
								<div class="slash text-center"
									style="font-size: 60px; margin-top: 10px;">|</div>
							</div>
							<div class="col-xs-5">
								<div class="pending-number">
									<span><b>Registered</b></span><span class="number"
										id="RegisteredCountID">0</span>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<button class="btn btn-sample flex-item" data-toggle="modal"
							data-target="#add-merchant-modal"
							style="font-size: 20px; background-color: #315cf2; color: white;">Add
							Merchant</button>

					</div>
					<div class="text-center col-sm-12">
						<div class="input-group influencer-sales-search col-sm-4"
							style="float: none; margin: 0 auto;">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search"> </i>
								</button>
							</span> <input type="text" class="form-control"
								placeholder="Search for...">
						</div>
						<!-- /input-group -->
					</div>
					<section class="col-sm-12 pending-products-content mt20">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="text-center">Pending Merchants</h3>
								</div>
								<div class="panel-body text-center table-responsive">
									<div class="clearfix"></div>
									<div id="PendingMerchants"></div>

								</div>
							</div>
						</section>
					</section>
					<!-- ./user settings content -->
					<section class="col-sm-12 fulfilled-products-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="center-block col-sm-4">
										<p id="demo" style="font-size: 20px; font-weight: 600;"></p>
										<script>
											var d = new Date();
											var days = [ "Sunday", "Monday",
													"Tuesday", "Wednesday",
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
													+ " " + date + ", " + year;
											// document.getElementById("demo").innerHTML = ;
											// document.getElementById("demo").innerHTML = days[d.getDate()];
											// document.getElementById("demo").innerHTML = days[d.getYear()];

											/* document.getElementById("today-date").innerHTML = Date();*/
										</script>
									</h4>
									<h3 class="text-center col-sm-4">
										<b>Registered Merchants</b>
									</h3>
									<div class="text-center col-sm-4">
										<select name="" id="year" class="form-control"
											style="width: 100px; float: right;">
											<option value="">2017</option>
											<option value="">2016</option>
											<option value="">2015</option>
											<option value="">2014</option>
											<option value="">2013</option>
											<option value="">2012</option>
										</select> <select name="" id="month" class="form-control"
											style="width: 100px; float: right; margin-right: 5px;">
											<option value="">Jan</option>
											<option value="">Feb</option>
											<option value="">Mar</option>
											<option value="">Apr</option>
											<option value="">May</option>
											<option value="">June</option>
											<option value="">July</option>
											<option value="">Aug</option>
											<option value="">Sep</option>
											<option value="">Oct</option>
											<option value="">Nov</option>
											<option value="">Dec</option>
										</select>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="panel-body text-center table-responsive">
									<div class="clearfix"></div>
									<div id="RegisteredMerchants"></div>

								</div>
							</div>
						</section>
					</section>
				</section>
			</section>
		</section>
	</section>
	<!-- 
	function randomPassword(){
			String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~`!@#$%^&*()-_=+[{]}\\|;:\'\",<.>/?";
			String pwd = RandomStringUtils.random( 15, characters );
			System.out.println( pwd );	
			
		} -->
	<!-- Add Merchant modal-->
	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="add-merchant-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form class="form-horizontal text-center" name="addmerchant"
						id="addmerchant" method="post" action=""
						enctype="mutlipart/form-data">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="text-center">Add Merchant</h4>
								<button type="button" class="close" data-dismiss="modal">X</button>
							</div>
							<div class="panel-body">
								<!-- Influencer Form Content -->
								<div class="col-sm-4">
									<div class="row">
										<div class="fullwidth">
											<div class="container">
												<div class="box upload-image">
													<span class="text">Upload Photo</span> <img src="" alt=""
														class="hide">
												</div>
												<input type="file" name="image" style="visibility: hidden;"
													class="image-browse">
											</div>
											<div class="options-block">
												<button type="reset"
													class="btn btn-sample pull-left col-xs-6 cancel-button wid50"
													style="background-color: #F7464A; color: white;">Cancel</button>
												<button
													class="btn btn-sample pull-right col-xs-6 save-as-pending-button wid50"
													type="button" onclick="addMerchant('PENDINGMERCHANT')"
													style="background-color: #34BE3E; color: white;">Save
													as Pending</button>
												<div class="clearfix"></div>
												<button
													class="btn btn-sample text-center col-xs-12 add-merchant-button"
													type="button" onclick="addMerchant('ADDMERCHANT')"
													style="background-color: #315CF2; color: white;">Add
													Merchant</button>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-8 text-center merchant-details">
									<div class="panel panel-default">
										<div class="panel-body text-center">
											<input class="form-control" type="hidden" id="userRoleId"
												name="userrole" value="3" /> <input class="form-control"
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
												<label for="storename" class="col-sm-3 control-label">Store
													Name</label>
												<div class="col-sm-9">
													<input type="text" name="storename" class="form-control"
														id="storename" placeholder="Enter Store Name" required>
												</div>
											</div>
											<div class="form-group">
												<label for="firstnamename" class="col-sm-3 control-label">First
													Name</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="firstname"
														name="fullname" placeholder="Enter First Name">
												</div>
											</div>
											<div class="form-group">
												<label for="lastname" class="col-sm-3 control-label">Last
													Name</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="lastname"
														name="fullname " placeholder="Enter Last Name">
												</div>
											</div>
											<div class="form-group">
												<label for="dob" class="col-sm-3 control-label">Date
													of Birth</label>
												<div class="col-sm-9">
													<input type="text" name="dob" class="form-control" id="dob"
														name="dob" placeholder="YYYY-MM-DD" required>
												</div>
											</div>

											<!-- <div class="form-group ">
												<label for="username" class="col-sm-3 control-label ">User
													Name</label>
												<div class="col-sm-9 ">
													<input type="text" class="form-control " id="username"
														name="username " placeholder="Enter User Name ">
												</div>
											</div> -->
											<div class="form-group">
												<label for="password" class="col-sm-3 control-label">Password</label>
												<div class="col-sm-9">
													<input type="password" name="password" class="form-control"
														id="password" placeholder="Enter Password" required>
												</div>
											</div>
											<div class="form-group">
												<label for="confirmpassword" class="col-sm-3 control-label">Confirm Password</label>
												<div class="col-sm-9">
													<input type="password" name="confirmpassword" class="form-control"
														id="confirmpassword" placeholder="Re-enter Password" required>
												</div>
											</div>
											<div class="form-group">
												<label for="address" class="col-sm-3 control-label">Address</label>
												<div class="col-sm-9">
													<input type="text" name="address" class="form-control"
														id="address" placeholder="Address" required>
												</div>
											</div>
											<div class="form-group">
												<label for="city" class="col-sm-3 control-label">City</label>
												<div class="col-sm-9">
													<input type="text" name="city" class="form-control"
														id="city" placeholder="City" required>
												</div>
											</div>
											<div class="form-group">
												<label for="state" class="col-sm-2 control-label" style="">State</label>
												<div class="col-sm-4">
													<select name="state" class="form-control" id="state"
														required>
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
												<label for="zip" class="col-sm-2 control-label">Zip</label>
												<div class="col-sm-4">
													<input type="text" name="zip" class="form-control" id="zip"
														placeholder="ZIP" required>
												</div>
											</div>
											<div class="form-group">
												<label for="country" class="col-sm-3 control-label">Country</label>
												<div class="col-sm-9">
													<input type="text" name="country" class="form-control"
														id="country" placeholder="Country" required>
												</div>
											</div>
											<div class="form-group">
												<label for="phonenumber" class="col-sm-3 control-label">Phone
													Number</label>
												<div class="col-sm-9">
													<input type="text" name="phonenumber" class="form-control"
														id="phonenumber" placeholder="Enter your Phone Number"
														required>
												</div>
											</div>
											<div class="form-group">
												<label for="email" class="col-sm-3 control-label">Email</label>
												<div class="col-sm-9">
													<input type="email" name="email" class="form-control"
														id="email" placeholder="Enter your Email" required>
												</div>
											</div>
										</div>
									</div>
									<!-- ./Influencer Form content -->
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- ./Add Influencer content -->
			</div>
		</div>
	</div>
	<!-- ./edit merchant modal -->
	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="edit-merchant-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form class="form-horizontal text-center" name="editmerchant"
						id="editmerchant" method="post" action=""
						enctype="mutlipart/form-data">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="text-center">Edit Merchant</h4>
								<button type="button" class="close" data-dismiss="modal">X</button>
							</div>
							<div class="panel-body">
								<!-- Influencer Form Content -->
								<div class="col-sm-4">
									<div class="row">
										<div class="fullwidth">
											<div class="container">
												<div class="box upload-image">
													<span class="text">Upload Photo</span> <img src="" alt=""
														class="hide">
												</div>
												<input type="file" name="image" style="visibility: hidden;"
													class="image-browse2">
											</div>
											<div class="options-block">
												<button type="button" onclick="updateMerchant(null, false, true)"
													class="btn btn-sample pull-left cancel-button col-sm-6 wid50"
													style="background-color: #F7464A; color: white;">Disable</button>
												<button onclick="updateMerchant()"
													class="btn btn-sample text-center pull-right col-sm-6 wid50"
													style="background-color: #315CF2; color: white;">Save</button>
												<div class="clearfix"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-8 text-center merchant-details">
									<div class="panel panel-default">
										<div class="panel-body text-center">
											<form name="" class="form-horizontal text-center">
												<div class="form-group">
													<label for="storename2" class="col-sm-3 control-label">Store
														Name</label>
													<div class="col-sm-9">
														<input type="text" name="storename2" class="form-control"
															id="storename2" placeholder="Enter Store Name" required>
													</div>
												</div>
												<div class="form-group">
													<label for="fullname2" class="col-sm-3 control-label">Full
														Name</label>
													<div class="col-sm-9">
														<input type="text" name="fullname2" class="form-control"
															id="fullname2" placeholder="Enter Full Name" required>
													</div>
												</div>
												<div class="form-group">
													<label for="dob2" class="col-sm-3 control-label">Date
														of Birth</label>
													<div class="col-sm-9">
														<input type="text" name="dob2" class="form-control"
															id="dob2" name="dob2" placeholder="YYYY-MM-DD" required>
													</div>
												</div>

												<div class="form-group">
													<label for="address2" class="col-sm-3 control-label">Address</label>
													<div class="col-sm-9">
														<input type="text" name="address2" class="form-control"
															id="address2" placeholder="Address" required>
													</div>
												</div>
												<div class="form-group">
													<label for="city2" class="col-sm-3 control-label">City</label>
													<div class="col-sm-9">
														<input type="text" name="city2" class="form-control"
															id="city2" placeholder="City" required>
													</div>
												</div>
												<div class="form-group">
													<label for="state2" class="col-sm-2 control-label">State</label>
													<div class="col-sm-4">
														<select name="" class="form-control" id="state2"
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
														<input type="text" name="zip2" class="form-control"
															id="zip2" placeholder="ZIP" required>
													</div>
												</div>
												<div class="form-group">
													<label for="country2" class="col-sm-3 control-label">Country</label>
													<div class="col-sm-9">
														<input type="text" name="country2" class="form-control"
															id="country2" placeholder="Country" required>
													</div>
												</div>
												<div class="form-group">
													<label for="phonenumber2" class="col-sm-3 control-label">Phone
														Number</label>
													<div class="col-sm-9">
														<input type="text" name="phonenumber2"
															class="form-control" id="phonenumber2"
															placeholder="Enter your Phone Number" required>
													</div>
												</div>
												<div class="form-group">
													<label for="email2" class="col-sm-3 control-label">Email</label>
													<div class="col-sm-9">
														<input type="email" name="email2" class="form-control"
															id="email2" placeholder="Enter your Email"
															readonly="readonly">
													</div>
												</div>
										</div>
									</div>
									<!-- ./merchant Form content -->
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- ./Add merchant content -->
			</div>
		</div>
	</div>
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
		$(document)
				.ready(
						function() {
							$('#dob').datetimepicker({
								format : "YYYY-MM-DD"
							});
							$('#dob2').datetimepicker({
								format : "YYYY-MM-DD"
							});
							$
									.ajax({
										type : "GET",
										contentType : "application/json; charset=utf-8",
										url : "/trendSetr/rest/user/3",
										dataType : "json",
										success : function(responseData, status) {
											console.log(responseData);
											if (responseData != null) {
												var pendingMerchantHTML = "";
												var registerMerchantHTML = "";
												var pCount = 0, rCount = 0;
												var pendingMerchantHTML = pendingMerchantHTML
														+ '<table class="table table-hover text-center">'
														+ '<thead>'
														+ '<tr>'
														+ '<th class="text-center">Merchant Name</th>'
														+ '<th class="text-center"><span>Employee Name </span>&nbsp;<span>DateCreated</span></th></thead>'
														+ '<tbody>';

												registerMerchantHTML = pendingMerchantHTML;

												$
														.each(
																responseData,
																function(index,
																		value) {
																	if (this.status == 2) {
																		pendingMerchantHTML = pendingMerchantHTML
																				+ '<tr>'
																				+ '<td>'
																				+ this.firstName
																				+ ' &nbsp; &nbsp; <a onClick="findMerchant(this)" merchnatStatus = "2" merchantId="'
																				+ this.userId
																				+ '" data-toggle="modal" data-target="#edit-merchant-modal"><span class="glyphicon glyphicon-pencil"></span></a></td>'
																				+ '<td><span >'
																				+ this.createdBy
																				+ '</span>&nbsp;<span>'
																				+ "   "
																				+ this.createdTime
																				+ '</span></td>'
																				+ '<td><span >'
																				+ '<a href="#" onclick="updateMerchant(this, true)" merchantId="'
																				+ this.userId
																				+ '">Make Registered <i class="fa fa-registered" aria-hidden="true"></i></a>'
																				+ '</span></td>'
																				+ '</tr>'
																		pCount++;
																	} else if (this.status == 1) {
																		registerMerchantHTML = registerMerchantHTML
																				+ '<tr>'
																				+ '<td>'
																				+ this.firstName
																				+ '&nbsp; &nbsp; <a onClick="findMerchant(this)" merchnatStatus = "1" merchantId="'
																				+ this.userId
																				+ '" data-toggle="modal" data-target="#edit-merchant-modal"><span class="glyphicon glyphicon-pencil"></span></a></td>'
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
												pendingMerchantHTML = pendingMerchantHTML
														+ "</tbody>"
														+ "</table>";
												registerMerchantHTML = registerMerchantHTML
														+ "</tbody>"
														+ "</table>";
												$("#PendingMerchants").html(
														pendingMerchantHTML);
												$("#RegisteredMerchants").html(
														registerMerchantHTML);
												$("#PendingCountID").html(
														pCount);
												$("#RegisteredCountID").html(
														rCount);
												$("#PendingCountID1").html(
														pCount);
												$("#RegisteredCountID1").html(
														rCount);
											}
										},
										error : function(request, status, error) {
											alert("request.." + request);
											alert("status.." + status);
											alert("error.." + error);
										}
									});
						})

		function findMerchant(fldObj, callback) {
			var merchantId = $(fldObj).attr("merchantId");
			var merchantStatus = $(fldObj).attr("merchnatStatus");
			$.ajax({
				type : "GET",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/user/merchant/" + merchantId,
				dataType : "json",
				success : function(responseData, status) {

					$("#fullname2").val(
							responseData.firstName + " "
									+ responseData.lastName);
					$("#email2").val(responseData.email);
					$("#phonenumber2").val(responseData.phoneNumber);
					$("#username").val(responseData.userId);
					$("#dob2").val(responseData.dateOfBirth);
					$("#address2").val(responseData.address.addressLine1);
					$("#city2").val(responseData.address.city);
					$("#country2").val(responseData.address.country);
					$("#state2").val(responseData.address.state);
					$("#zip2").val(responseData.address.zip);
					$("#storename2").val(responseData.profile.storeName);
					$("#hdnMerchantStatus").val(merchantStatus);
					if (callback) {
						callback();
					}
				},
				error : function(request, status, error) {
					alert("request.." + request);
					alert("status.." + status);
					alert("error.." + error);
				}
			});
		}

		function updateMerchant(fldObj, makeRegistered, makeDisabled) {
			/* alert($('#email2').val()); */
			var empname = $("#fullname2").val();
			debugger;
			var callback = function() {
				var flName = empname.split(" ");
				var st = makeRegistered ? "1" : $("#hdnMerchantStatus").val();
				st = makeDisabled ? "3" : st;

				var input = JSON.stringify({
					"firstName" : flName[0],
					"lastName" : flName[1],
					"userId" : $('#email2').val(),
					"dateOfBirth" : $('#dob2').val(),
					"roleId" : $('#userRoleId').val(),
					"phoneNumber" : $('#phonenumber2').val(),
					"email" : $('#email2').val(),
					"status" : st,
					"profile" : {
						"userId" : flName[0] + flName[1],
						"storeName" : $('#storename2').val(),
						"createdBy" : $("#loginUser").html().trim()
					},
					"address" : {
						"firstName" : flName[0],
						"lastName" : flName[1],
						"addressLine1" : $('#address2').val(),
						"city" : $('#city2').val(),
						"state" : $('#state2').val(),
						"zip" : $('#zip2').val(),
						"country" : $('#country2').val(),
						"phoneNumber" : $('#phonenumber2').val(),
						"status" : "st",
						"createdBy" : $("#loginUser").html().trim()
					},
					"createdBy" : $("#loginUser").html().trim()
				});

				$.ajax({
					type : "PUT",
					contentType : "application/json; charset=utf-8",
					url : "/trendSetr/rest/user",
					data : input,
					dataType : "json",
					success : function(responseData, status) {
						alert("Merchant updated Successfully!");
						location.reload();
						$("#editmerchant")[0].reset();
						$("#edit-merchant-modal").hide();
					},
					error : function(request, status, error) {
						/* alert("Error"); */
					}
				});
			}

			if (fldObj) {
				findMerchant(fldObj, callback);
			} else {
				callback();
			}

		}

		function addMerchant(merchantStatus) {
			var st = "";
			if (merchantStatus == 'ADDMERCHANT')
				st = "1";
			else
				st = "2";
			alert($('#password').val());
			var input = JSON.stringify({
				"firstName" : $('#firstname').val(),
				"lastName" : $('#lastname').val(),
				"userId" : $('#email').val(),
				"roleId" : $('#userRoleId').val(),
				"dateOfBirth" : $('#dob').val(),
				"phoneNumber" : $('#phonenumber').val(),
				"password" :$('#password').val(),
				"email" : $('#email').val(),
				"status" : st,
				"profile" : {
					"userId" : $('#email').val(),
					"storeName" : $('#storename').val(),
					"createdBy" : $("#loginUser").html()
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
					"createdBy" : $("#loginUser").html()
				},
				"createdBy" : $("#loginUser").html()
			});
			/* alert(input); */
			console.log(input);
			$.ajax({
				type : "POST",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/user",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					/* document.addmerchant.action = "/trendSetrIntegration/admin/merchantSales.jsp"
					document.addmerchant.submit(); */
					alert("Merchant Added Successfully");
					location.reload();

				},
				error : function(request, status, error) {
					alert("Error");
					$("#addmerchant")[0].reset();
					$("#add-merchant-modal").hide();
				}
			});
		}
		$('.upload-image').on('click', function(e) {
			e.preventDefault();
			$('.image-browse').trigger('click');
		});

		// only for debugging

		$('input[type=file]').on('change', function(e) {
			var file = e.target.files[0];
			var filePath = URL.createObjectURL(file);

			$('.upload-image .text').hide();
			$('.upload-image img').removeClass('hide');
			$('.upload-image img').attr('src', filePath).css({
				'width' : '100%'

			});
			addPhoto("influencers", e.target.files);
		});

		//aws upload

		var albumBucketName = 'trendsetr';
		var bucketRegion = 'us-east-2';
		var IdentityPoolId = 'us-east-2:c5c0765a-bd5e-44b8-b23e-7505377a7644';

		AWS.config.update({
			region : bucketRegion,
			credentials : new AWS.CognitoIdentityCredentials({
				IdentityPoolId : IdentityPoolId
			})
		});

		var s3 = new AWS.S3({
			apiVersion : '2006-03-01',
			params : {
				Bucket : albumBucketName
			}
		});

		//creates an album if does not exists
		function createAlbum(albumName) {
			albumName = albumName.trim();
			if (!albumName) {
				return alert('Album names must contain at least one non-space character.');
			}
			if (albumName.indexOf('/') !== -1) {
				return alert('Album names cannot contain slashes.');
			}
			var albumKey = encodeURIComponent(albumName) + '/';
			s3.headObject({
				Key : albumKey
			}, function(err, data) {
				if (!err) {
					return false;
				}
				if (err.code !== 'NotFound') {
					return alert('There was an error creating your album: '
							+ err.message);
				}
				s3.putObject({
					Key : albumKey
				}, function(err, data) {
					if (err) {
						return alert('There was an error creating your album: '
								+ err.message);
					}
				});
			});
		}

		//createAlbum("influencers");

		function addPhoto(albumName, files) {
			//var files = document.getElementById('photoupload').files;
			if (!files.length) {
				return alert('Please choose a file to upload first.');
			}
			var file = files[0];
			var fileName = file.name;
			var albumPhotosKey = encodeURIComponent(albumName) + '//';

			var photoKey = albumPhotosKey + fileName;
			s3.upload({
				Key : photoKey,
				Body : file,
				ACL : 'public-read'
			}, function(err, data) {
				if (err) {
					return alert('There was an error uploading your photo: ',
							err.message);
				}
				alert('Successfully uploaded photo.');

			});
		}
	</script>
</body>

</html>
