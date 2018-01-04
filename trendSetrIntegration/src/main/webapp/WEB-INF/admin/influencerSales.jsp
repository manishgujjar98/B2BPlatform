<!DOCTYPE html>
<html>

<head>
<title>Influencer Sales</title>
<%@include file="adminStyles.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-datetimepicker.min.css" />

<link rel="stylesheet" href="../css/fileinput.min.css">
<style>
.admin-header {
	background-color: black;
}

#influencer-page {
	position: relative;
	top: 30px;
}

.panel-footer h5 {
	color: grey;
}

.influencers-sales-div {
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



#add-influencer-modal .panel, #edit-influencer-modal .panel {
	margin-bottom: 0;
}

#add-influencer-modal .panel-body, #edit-influencer-modal .panel-body {
	background-color: #EEEEEE;
}

#add-influencer-modal .custom-image, #edit-influencer-modal .custom-image
	{
	min-height: 350px;
}

#add-influencer-modal .custom-image img, #edit-influencer-modal .custom-image img
	{
	min-height: 350px;
}

#add-influencer-modal .options-block, #edit-influencer-modal .options-block
	{
	padding-top: 20px;
}

.options-block #saveaspending {
	margin-top: 2px;
}

.influencer-details .panel-body .form-group label {
	background-color:;
	text-align: left;
	margin-right: -15px;
	padding-bottom: 5px;
}

.btn {
	margin-right: -5px;
	color: black;
}

#send-invite-modal .modal-dialog {
	width: 450px;
	margin-top: 100px;
	background: #EEEEEE;
}

#send-invite-modal .modal-dialog .form-group {
	margin-bottom: -10px;
	margin-top: -5px;
}

#send-invite-modal .pull-left {
	padding-left: 20px;
}

#send-invite-modal .pull-right {
	padding-right: 20px;
}

#send-invite-modal .invite-text {
	height: 150px;
	border: 1px solid #b0d2f1;
	font-size: 16px;
	padding: 10px 5px 10px 5px;
}
/*  @media all and (max-width:768px) {
       .middle-content .pending-number span {
           display: inline-block;
           font-size: 14px;
       }
   } */
/* toggle buttons*/
.switch {
	position: relative;
	display: inline-block;
	width: 40px;
	height: 20px;
	margin-top: 8px;
}

.switch input {
	display: none;
}

.switch input:checked+.slider {
	background-color: #2196F3;
}

.switch input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

.switch input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

.switch .slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.switch .slider:before {
	position: absolute;
	content: "";
	height: 20px;
	width: 20px;
	box-shadow: 0 0 2px #000;
	left: 0;
	bottom: 0;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

.switch .slider.round {
	border-radius: 34px;
}

.switch .slider.round:before {
	border-radius: 50%;
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

.box img {
	width: 240px;
	height: 290px;
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
	<input type="hidden" id="hdnInfluencerStatus">
	<!--header -->
	<!-- user settings -->
	<section class="col-sm-12" id="influencer-page">
		<section class="row">
			<section class="container">
				<section class="">
					<!--  user settings menu -->
					<div class="middle-content center-block visible-xs mt20">
						<div class="col-xs-5">
							<div class="pending-number">
								<span><b>Pending</b></span><span id="PendingCountID"
									class="number">0</span>
							</div>
						</div>
						<div class="col-xs-2">
							<div class="slash text-center"
								style="font-size: 60px; margin-top: 10px;">|</div>
						</div>
						<div class="col-xs-5">
							<div class="pending-number">
								<span><b>Registered</b></span><span id="RegisteredCountID"
									class="number">0</span>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="influencers-sales-div mt20">
						<h3 class="">Influencer Sales</h3>
						<div class="middle-content center-block hidden-xs mt20">
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
						<button class="add-influencer btn btn-sample" data-toggle="modal"
							data-target="#add-influencer-modal" onclick="resetInfluencer()"
							style="font-size: 20px; background-color: #315cf2; color: white;">Add
							Influencer</button>
					</div>
					<div class=" text-center col-sm-12 ">
						<div class="input-group influencer-sales-search col-sm-4 "
							style="float: none; margin: 0 auto;">
							<span class="input-group-btn ">
								<button class="btn btn-default " type="button">
									<i class="fa fa-search "> </i>
								</button>
							</span> <input type="text" class="form-control "
								placeholder="Search for... ">
						</div>
						<!-- /input-group -->
					</div>
					<section class="col-sm-12 pending-products-content mt20">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="text-center">Pending Influencers</h4>
								</div>
								<div class="panel-body text-center table-responsive">
									<div class="clearfix"></div>
									<div id="PendingInfluencer"></div>
									<!-- <table class="table table-hover text-center">
										<thead>
											<tr>
												<th class="text-center">Influencer Name</th>
												<th class="text-center"><span>Employee Name </span>&nbsp;<span>Date
														Created</span></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Influencer Name &nbsp; &nbsp; <a href=""
													data-toggle="modal" data-target="#edit-influencer-modal"><span
														class="glyphicon glyphicon-pencil"></span></a></td>
												<td><span>Employee Name </span>&nbsp;<span>Date
														Created</span></td>
											</tr>
											<tr>
												<td>Influencer Name &nbsp; &nbsp; <a href=""
													data-toggle="modal" data-target="#edit-influencer-modal"><span
														class="glyphicon glyphicon-pencil"></span></a></td>
												<td><span>Employee Name </span>&nbsp;<span>Date
														Created</span></td>
											</tr>
											<tr>
												<td>Influencer Name &nbsp; &nbsp; <a href=""
													data-toggle="modal" data-target="#edit-influencer-modal"><span
														class="glyphicon glyphicon-pencil"></span></a></td>
												<td><span>Employee Name </span>&nbsp;<span>Date
														Created</span></td>
											</tr>
											<tr>
												<td>Influencer Name &nbsp; &nbsp; <a href=""
													data-toggle="modal" data-target="#edit-influencer-modal"><span
														class="glyphicon glyphicon-pencil"></span></a></td>
												<td><span>Employee Name </span>&nbsp;<span>Date
														Created</span></td>
											</tr>
											<tr>
												<td>Influencer Name &nbsp; &nbsp; <a href=""
													data-toggle="modal" data-target="#edit-influencer-modal"><span
														class="glyphicon glyphicon-pencil"></span></a></td>
												<td><span>Employee Name </span>&nbsp;<span>Date
														Created</span></td>
											</tr>
											<tr>
												<td>Influencer Name &nbsp; &nbsp; <a href=""
													data-toggle="modal" data-target="#edit-influencer-modal"><span
														class="glyphicon glyphicon-pencil"></span></a></td>
												<td><span>Employee Name </span>&nbsp;<span>Date
														Created</span></td>
											</tr>
										</tbody>
									</table> -->
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
										<p id="displaydate" style="font-size: 20px; font-weight: 600;"></p>
										<script>
											var d = new Date();
											var days = [ "Sunday ", "Monday ",
													"Tuesday ", "Wednesday ",
													"Thursday ", "Friday ",
													"Saturday " ];
											var months = [ "January ",
													"February ", "March ",
													"April ", "May ", "June ",
													"July ", "August ",
													"September ", "October ",
													"November ", "December " ];
											var date = d.getDate();
											var year = d.getFullYear();

											document
													.getElementById("displaydate").innerHTML = days[d
													.getDay()]
													+ ", "
													+ months[d.getMonth()]
													+ " " + date + ", " + year;
											// document.getElementById("demo ").innerHTML = ;
											// document.getElementById("demo ").innerHTML = days[d.getDate()];
											// document.getElementById("demo ").innerHTML = days[d.getYear()];

											/* document.getElementById("today-date ").innerHTML = Date();*/
										</script>
									</h4>
									<h4 class="text-center col-sm-4">Registered Influencers</h4>
									<div class="text-center col-sm-4">
										<select name="" id="year" class="form-control"
											style="width: 100px; float: right;">
											<option value="2017">2017</option>
											<option value="2016">2016</option>
											<option value="2015">2015</option>
											<option value="2014">2014</option>
											<option value="2013">2013</option>
											<option value="2012">2012</option>
										</select> <select name="" id="month" class="form-control"
											style="width: 100px; float: right; margin-right: 5px;">
											<option value="1">Jan</option>
											<option value="2">Feb</option>
											<option value="3">Mar</option>
											<option value="4">Apr</option>
											<option value="5">May</option>
											<option value="6">June</option>
											<option value="7">July</option>
											<option value="8">Aug</option>
											<option value="9">Sep</option>
											<option value="10">Oct</option>
											<option value="11">Nov</option>
											<option value="12">Dec</option>
										</select>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="panel-body text-center table-responsive">
									<div class="clearfix"></div>
									<div id="RegisteredInfluencer"></div>
								</div>
							</div>
						</section>
					</section>
				</section>
			</section>
		</section>
	</section>
	<!-- Add Influencer modal-->
	<div class="modal fade " data-keyboard="false" data-backdrop="static"
		id="add-influencer-modal" tabindex="-1 ">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="text-center" id="add-influencer">Add Influencer</h4>
							<button type="button" class="close" data-dismiss="modal">X</button>
						</div>
						<div class="panel-body">
							<!-- Influencer Form Content -->
							<form class="form-horizontal text-center" name="addinfuencer"
								id="addinfluencer">
								<input type="hidden" id="influencerStatusId"></input>
								<div class="col-sm-4 cancel-invite-options"
									id="cancel-invite-options">
									<div class="row ">
										<div class="container">
											<div class="box upload-image">
												<span class="text">Upload Photo</span> <img src=""
													id="displayImageID" alt="" class="hide">
											</div>
											<input type="file" name="image" style="visibility: hidden;"
												class="image-browse"> <input type="hidden"
												id="profileimage">
										</div>
										<div class="options-block mb20" id="addoptions">
											<button type="reset"
												class="btn btn-sample pull-left col-sm-6" id="infcancel"
												style="background-color: #F7464A; color: white;">Cancel</button>
											<button type="button"
												class="btn btn-sample pull-right col-sm-6" id="infsend"
												type="button" data-toggle="modal"
												data-target="#send-invite-modal"
												style="background-color: #34BE3E; color: white;" disabled>Send
												Invite</button>
											<div class="clearfix "></div>
											<button class="btn btn-sample center-block col-xs-12"
												id="saveaspending" onclick="addInfluencer()" type="button"
												style="background-color: #315CF2; color: white;">Save
												as Pending Influencer</button>
										</div>
										<div class="options-block mb20" id="editoptions"
											style="display: none;">
											<button class="btn btn-sample pull-left col-sm-6"
												style="background-color: #F7464A; color: white;"
												onClick="updateInfluencer(true)">Disable</button>
											<button class="btn btn-sample pull-right col-sm-6"
												style="background-color: #315CF2; color: white;"
												onClick="updateInfluencer()">Save</button>
											<div class="clearfix "></div>
										</div>
									</div>
								</div>
								<div class="col-sm-8 text-center influencer-details "
									id="influencer-details">
									<div class="panel panel-default ">
										<div class="panel-body text-center ">
											<input class="form-control" type="hidden" id="userRoleId"
												name="userrole" value="5" /> <input class="form-control"
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
												<label for="firstname " class="col-sm-3 control-label">First
													Name</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="firstname"
														name="firstname" placeholder="Enter First Name" required>
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
											<!-- <div class="form-group">
												<label for="username" class="col-sm-3 control-label">User
													Name</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="username"
														name="username" placeholder="Enter User Name" required>
												</div>
											</div> -->
											<div class="form-group">
												<label for="dateofbirth" class="col-sm-3 control-label">Date
													of Birth</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="dateofbirth"
														name="dateofbirth" placeholder="YYYY-MM-DD" required>
												</div>
											</div>
											<div class="form-group">
												<label for="phonenumber" class="col-sm-3 control-label">Phone
													Number</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="phonenumber"
														name="phonenumber" placeholder="Enter Phone Number"
														required>
												</div>
											</div>
											<div class="form-group">
												<label for="email" class="col-sm-3 control-label">Email
													Address</label>
												<div class="col-sm-9 ">
													<input type="email" class="form-control" id="email"
														name="email" placeholder="Enter your Email Address"
														required>
												</div>
											</div>
											<div class="form-group">
												<label for="fb" class="col-sm-3 control-label">Facebook</label>
												<div class="col-sm-9">
													<input type="text" class="form-control " id="fb" name="fb"
														placeholder="Enter Facebook ID">
												</div>
											</div>
											<div class="form-group">
												<label for="tw1" class="col-sm-3 control-label">Twitter</label>
												<div class="col-sm-9">
													<input type="text" class="form-control " id="tw" name="tw"
														placeholder="Enter Twitter ID">
												</div>
											</div>
											<div class="form-group">
												<label for="insta" class="col-sm-3 control-label">Instagram</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="insta"
														name="insta" placeholder="Enter Instagram ID">
												</div>
											</div>
										</div>
										<!-- ./Influencer Form content -->
									</div>
							</form>
						</div>
					</div>
				</div>
				<!-- ./Add Influencer content -->
			</div>
		</div>
	</div>

	<!-- ./Send invite content -->
	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="send-invite-modal" tabindex="-1 ">
		<form class="form-horizontal text-center" name="infuencerinviteform">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<!-- product content -->
						<div class="col-sm-12 ">
							<div class="row">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="text-center">Send Invite</h4>
										<button type="button" class="close" data-dismiss="modal">X</button>
									</div>
									<div class="panel-body text-center">
										<div class="clearfix"></div>
										<div class="invite-text">
											<b>Employee Name has invited you to join in TrendSetr as
												an Influencer</b>
										</div>
										<div class="form-group mt20">
											<label for="emailn" class="control-label pull-left">Email</label>
											<div class="pull-right">
												<label class="switch"> <input type="radio"
													class="form-control" id="emailn" name="notification"
													value="E">
													<div class="slider round"></div>
												</label>
											</div>
										</div>
										<div class="clearfix"></div>
										<legend></legend>
										<div class="form-group">
											<label for="text" class="control-label pull-left">Text</label>
											<div class="pull-right">
												<label class="switch"> <input type="radio"
													class="form-control" id="textn" name="notification"
													value="S">
													<div class="slider round"></div>
												</label>
											</div>
										</div>
										<div class="clearfix"></div>
										<legend></legend>
										<!-- <div class="form-group">
											<label for="fb" class="control-label pull-left">Facebook</label>
											<div class="pull-right">
												<label class="switch"> <input type="checkbox"
													class="form-control" id="fbn" name="fbn" checked>
													<div class="slider round"></div>
												</label>
											</div>
										</div> -->
										<div class="clearfix"></div>
										<legend></legend>
										<button class="btn btn-sample center-block"
											onclick="addInfluencer()" type="button"
											style="background-color: #315CF2; color: white;">Send
											Invite</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- ./Send invite content -->
	<div class="clearfix"></div>
	<!-- .gift -->
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

							$('#dateofbirth').datetimepicker({
								format : "YYYY-MM-DD"
							});
							$
									.ajax({
										type : "GET",
										contentType : "application/json; charset=utf-8",
										url : "/trendSetr/rest/user",
										dataType : "json",
										success : function(responseData, status) {
											/* console.log(responseData); */
											if (responseData != null) {
												var pendingInfluencerHTML = "";
												var registerInfluencerHTML = "";
												var pCount = 0, rCount = 0;
												var pendingInfluencerHTML = pendingInfluencerHTML
														+ '<table class="table table-hover text-center">'
														+ '<thead>'
														+ '<tr>'
														+ '<th class="text-center">Influencer Name</th>'
														+ '<th class="text-center"><span>Employee Name </span>&nbsp;<span>DateCreated</span></th></tr></thead>'
														+ '<tbody>';

												registerInfluencerHTML = pendingInfluencerHTML;
												/* console.table(responseData); */
												$
														.each(
																responseData,
																function(index,
																		value) {
																	/*  alert(this.status + "==" + this.roleId + "==" + this.firstName);  */
																	// alert(this.roleId); 
																	if (this.roleId == 5
																			&& this.status == 2) {
																		/* alert("you influ" +this.createdTime); */
																		pendingInfluencerHTML = pendingInfluencerHTML

																				+ '<tr>'
																				+ '<td>'
																				+ this.firstName
																				+ '&nbsp; &nbsp; <a onClick="findInfluencer(this)" influencerStatus = "2" userId="'
																				+ this.userId
																				+ '" data-toggle="modal" data-target="#add-influencer-modal"><span class="glyphicon glyphicon-pencil"></span></a></td>'
																				+ '<td><span >'
																				+ this.createdBy
																				+ '</span>&nbsp;<span>'
																				+ "   "
																				+ this.createdTime
																				+ '</span></td>'
																				+ '</tr>'
																		pCount++;

																	}

																	else if (this.roleId == 5
																			&& this.status == 1) {

																		registerInfluencerHTML = registerInfluencerHTML
																				+ '<tr>'
																				+ '<td>'
																				+ this.firstName
																				+ '&nbsp; &nbsp; <a onClick="findInfluencer(this)" influencerStatus = "1" userId="'
																				+ this.userId
																				+ '" data-toggle="modal" data-target="#add-influencer-modal"><span class="glyphicon glyphicon-pencil"></span></a></td>'
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

												pendingInfluencerHTML = pendingInfluencerHTML
														+ "</tbody>"
														+ "</table>";
												$("#PendingInfluencer").html(
														pendingInfluencerHTML);
												registerInfluencerHTML = registerInfluencerHTML
														+ "</tbody>"
														+ "</table>";
												$("#RegisteredInfluencer")
														.html(
																registerInfluencerHTML);
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
						});
		function findInfluencer(fldObj) {
			var influencerId = $(fldObj).attr("userId");

			$("#influencerStatusId").val($(fldObj).attr("influencerStatus"));

			alert(influencerId);
			$
					.ajax({
						type : "GET",
						contentType : "application/json; charset=utf-8",
						url : "/trendSetr/rest/user/influencer/influencerinfo/"
								+ influencerId,
						dataType : "json",
						success : function(responseData, status) {
							/* alert("hi success"); */
							$("#addoptions").hide();
							$("#editoptions").show();
							$("#add-influencer").html("Edit Influencer");
							$("#firstname").val(responseData.firstName);
							$("#lastname").val(responseData.lastName);
							$("#username").val(responseData.userId);
							$("#email").val(responseData.email);
							$('#email').prop('readonly', true);
							$("#phonenumber").val(responseData.phoneNumber);
							$("#fb").val(responseData.facebook);
							$("#tw").val(responseData.twitter);
							$("#insta").val(responseData.instagram);
							$("#dateofbirth").val(responseData.dateOfBirth);
							/* alert(responseData.profile.profileImage); */
							if (typeof (responseData.profile.profileImage) != 'object') {
								$("#displayImageID").attr("src",
										responseData.profile.profileImage)
										.removeClass('hide');
								$('.upload-image > span:first-child').hide();
							}
							/* $("#city").val(responseData.city);
										$("#country").val(responseData.country);
										$("#state").val(responseData.state);
										$("#zip").val(responseData.zip); */

						},
						error : function(request, status, error) {
							alert("request.." + request);
							alert("status.." + status);
							alert("error.." + error);
						}
					});
		}

		function updateInfluencer(disable) {
			//		alert("update Influencer");

			var input = JSON.stringify({
				"firstName" : $('#firstname').val(),
				"lastName" : $('#lastname').val(),
				"userId" : $('#email').val(),
				"phoneNumber" : $('#phonenumber').val(),
				"dateOfBirth" : $('#dateofbirth').val(),
				"facebook" : $('#fb').val(),
				"twitter" : $('#tw').val(),
				"instagram" : $('#insta').val(),
				"email" : $('#email').val(),
				"profile" : {

					"profileImage" : $('#profileimage').val(),

				},
				"status" : disable ? "3" : $("#influencerStatusId").val(),
				"roleId" : "5",
				"createdBy" : $("#loginUser").html().trim()

			});
			alert(input);
			$.ajax({
				type : "PUT",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/user",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					alert("Influencer updated Successfully!");
				},
				error : function(request, status, error) {
					alert("Error");
				}
			});
		}

		function resetInfluencer() {
			$("#add-influencer").html("Add influencer");
			$("#addoptions").show();
			$("#editoptions").hide();
			$("#firstname").val("");
			$("#lastname").val("");
			$("#dateofbirth").val("");
			$("#username").val("");
			$("#email").val("");
			$('#email').prop('readonly', false);
			$("#phonenumber").val("");
			$("#fb").val("");
			$("#tw").val("");
			$("#insta").val("");
			$("#displayImageID").attr('src', "").addClass('hide');
			$("#profileimage").val("");
			$('.upload-image > span:first-child').show();
		}

		function addInfluencer(event) {

			var input = {
				"firstName" : $('#firstname').val(),
				"lastName" : $('#lastname').val(),
				"userId" : $('#email').val(),
				"phoneNumber" : $('#phonenumber').val(),
				"dateOfBirth" : $('#dateofbirth').val(),
				"facebook" : $('#fb').val(),
				"twitter" : $('#tw').val(),
				"instagram" : $('#insta').val(),
				"email" : $('#email').val(),
				"notification" : $('input[name="notification"]:checked').val(),
				"profile" : {
					"userId" : $('#email').val(),
					"profileImage" : $('#profileimage').val(),
					"createdBy" : $("#loginUser").html().trim()
				},
				"status" : "2",
				"roleId" : "5",
				"password" : "",
				"createdBy" : $("#loginUser").html().trim()
			};

			$.ajax({
				type : "POST",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/user",
				data : JSON.stringify(input),
				dataType : "json",
				success : function(responseData, status) {
					alert("Influencer Added successfully");
					location.reload();
				},
				error : function(xhr, textStatus, errorThrown) {
					alert("Error");
					location.reload();
				}
			});
		}

		$('.upload-image').on('click', function(e) {
			e.preventDefault();
			$(this).next().trigger('click');
		});

		// only for debugging

		$('input[type=file]').on('change', function(e) {
			e.preventDefault();
			var file = e.target.files[0];
			var filePath = URL.createObjectURL(file);

			$('.upload-image .text').hide();
			$('.upload-image img').removeClass('hide');
			$('.upload-image img').attr('src', filePath);
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
				console.log(data);
				$("#profileimage").val(data.Location);
			});
		}
	</script>
	</div>
</body>

</html>
