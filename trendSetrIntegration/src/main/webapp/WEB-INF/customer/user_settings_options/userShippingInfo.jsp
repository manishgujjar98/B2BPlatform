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
					<section class="col-sm-9 settings-content" id="payment-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h1>shipping information</h1>
								</div>
								<form action="" method="post">
									<div class="panel-body text-center">
										<h1 class="block">
											<i class="fa fa-truck"></i>
										</h1>

										<button type="button" class="btn btn-danger light"
											data-toggle="modal" data-target="#add-shipping-modal">Add
											Shipping Information</button>
										<h2>No Shipping Information Added!</h2>
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
	<!-- Shipping Info modal-->
	<div class="modal fade add_pop_form_details" data-keyboard="false"
		data-backdrop="static" id="add-shipping-modal">
		<div class="modal-dialog" style="width: 600px !important;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Add Shipping Information</h4>
				</div>
				<form name="add_shipping_info" action="" method="post">
					<div class="modal-body">
						<div class="col-xs-12">
							<div class="form-group">
								<label for="fullname" class="control-label">Full Name</label> <input
									type="text" name="fullname" class="form-control" id="fullname"
									placeholder="Enter Full Name" required>
							</div>
						</div>
						<div class="col-xs-12">
							<div class="form-group">
								<label for="nickname" class="control-label">Address
									Nickname (optional)</label> <input type="text" name="nickname"
									class="form-control" id="nickname"
									placeholder="Enter a nick Name" required>
							</div>
						</div>
						<div class="col-xs-12">
							<div class="row">
								<div class="form-group">
									<div class="col-sm-6">
										<label for="addressline1" class="control-label">Address
											Line 1</label> <input type="text" class="form-control"
											name="addressline1" id="addressline1"
											placeholder="Street and number, P.O. box, c/o." required>
									</div>
									<div class="col-sm-6">
										<label for="addressline2" class="control-label">Address
											Line 2(Optional)</label> <input type="text" class="form-control"
											name="addressline2" id="addressline2"
											placeholder="Apartment, suite, unit, building, floor, etc."
											required>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12">
							<div class="row">
								<div class="form-group">
									<div class="col-sm-6">
										<label for="country" class="control-label">Country</label> <input
											type="text" class="form-control" name="country" id="country"
											placeholder="Enter Your Country" required>
									</div>
									<div class="col-sm-6">
										<label for="city" class="control-label">City</label> <input
											type="text" class="form-control" name="city" id="city"
											placeholder="City" required>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12">
							<div class="row">
								<div class="form-group pull-left mt5">
									<div class="col-sm-4">
										<label for="state" class="control-label">State</label>
										<div class="">
											<select class="form-control" name="state" id="state" required>
												<option value="">Select Your State</option>
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
									</div>

									<div class="col-sm-3">
										<label for="zip" class="control-label">Zip</label> <input
											type="text" class="form-control" name="zip" id="zip"
											placeholder="Zip" required>
									</div>
									<div class="col-sm-5">
										<label for="phonenumber" class="control-label">Phone
											Number</label> <input type="text" class="form-control"
											name="phonenumber" id="phonenumber"
											placeholder="Enter Phone Number" required>
									</div>

								</div>
							</div>
							<div class="form-group pull-left mt5">
								<div class="col-xs-12">
									<input type="checkbox" name="primary" id="primary"> <label
										for="primary">Make this primary shipping details</label>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="modal-footer text-right">
							<button type="reset" class="btn btn-default">Cancel</button>
							<button type="submit" class="btn btn-danger"
								onclick="addShippingInfo()">Add Shipping</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- ./Shipping Info modal -->
	<div class="clearfix"></div>
	<!-- .gift -->
	<script>
		function addShippingInfo() {

			/* 	alert($('input[name="notification"]:checked').val());

				alert("123"); */

			var input = JSON.stringify({
				"fullName" : $('#firstname').val() + $('#lastname').val(),
				"nickName" : $('#nickname').val(),
				"addressLine1" : $('#addressline1').val(),
				"addressLine2" : $('#addressline2').val(),
				"country" : $('#country').val(),
				"city" : $('#city').val(),
				"state" : $('#state').val(),
				"zip" : $('#zip').val(),
				"phoneNumber" : $('#phonenumber').val(),

				"address" : {
					"firstName" : flName[0],
					"lastName" : flName[1],
					"addressLine1" : $('#addressline1').val(),
					"addressLine2" : $('#addressline2').val(),
					"city" : $('#city').val(),
					"country" : $('#country').val(),
					"state" : $('#state').val(),
					"zip" : $('#zip').val(),
					"phoneNumber" : $('#phonenumber').val(),

				},

			});
			/* alert(input); */
			$.ajax({
				type : "POST",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/addresses",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					alert("Shipping Address Added successfully");
				},
				error : function(request, status, error) {
					alert("Error");
				}
			});

		}
	</script>
	<!-- ./product details image modal -->
	<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->

</body>

</html>