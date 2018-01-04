<!DOCTYPE html>
<html>

<head>
<!-- Add Styles here -->
<%@include file="customerStyles.jsp"%>
<!-- ./Add Styles here -->
</head>

<!-- header -->
<%@include file="customerNavigation.jsp"%>
<!-- ./header -->
<body class="bglightgray">


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
									<h1>payment information</h1>
								</div>
								<form action="" method="post">
									<div class="panel-body text-center">
										<h1 class="material-icons block">credit_card</h1>

										<button type="button" class="btn btn-danger light"
											data-toggle="modal" data-target="#add-payment-modal">Add
											Payment</button>
										<h2>No Payment Method Added!</h2>
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
	<!-- payment modal-->
	<div class="modal fade add_pop_form_details" data-keyboard="false"
		data-backdrop="static" id="add-payment-modal">
		<div class="modal-dialog" style="width: 600px !important;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Add Payment Type</h4>
				</div>
				<form name="add_payment_info" action="" method="post">
					<div class="modal-body">
						<div class="col-xs-12">
							<div class="form-group">
								<label for="name_on_card" class="control-label">Name on
									Card</label> <input type="text" name="name_on_card"
									class="form-control" id="name_on_card"
									placeholder="Enter Name on card" required>
							</div>
						</div>
						<div class="col-xs-12">
							<div class="row">
								<div class="form-group">
									<div class="col-sm-5">
										<label for="card_number" class="control-label">Card
											Number</label> <input type="text" name="card_number"
											class="form-control" id="card_number"
											placeholder="Enter card Number" required>
									</div>
									<div class="col-sm-3">
										<label for="cvv" class="control-label">CVV</label> <input
											type="text" name="cvv" class="form-control" id="cvv"
											placeholder="CVV" required>
									</div>
									<div class="col-sm-4">
										<label for="expiration_date" class="control-label">Expiration
											Date</label>
										<div class="row">
											<div class="col-sm-6">
												<input type="text" name="expiration_date"
													class="form-control" id="expiration_date" placeholder="DD"
													required>
											</div>
											<div class="col-sm-6">
												<input type="text" name="expiration_year"
													class="form-control" id="expiration_year"
													placeholder="YYYY" required>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12">
							<div class="row">
								<div class="form-group mt5">
									<div class="col-xs-12">
										<input type="checkbox" name="primary" id="primary"> <label
											for="primary">Make this primary payment method</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12">
							<label class="label-header">Billing Address</label>
						</div>
						<div class="col-xs-12">
							<div class="row">
								<div class="form-group">
									<div class="col-sm-6">
										<label for="address_line_1" class="control-label">Address
											Line 1</label> <input type="text" name="address_line_1"
											class="form-control" id="name_on_card"
											placeholder="Street and number, P.O. box, c/o." required>
									</div>
									<div class="col-sm-6">
										<label for="address_line_2" class="control-label">Address
											Line 2(Optional)</label> <input type="text" name="address_line_2"
											class="form-control" id="name_on_card"
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
											type="text" name="country" class="form-control"
											id="name_on_card" placeholder="Country" required>
									</div>
									<div class="col-sm-6">
										<label for="city" class="control-label">City</label> <input
											type="text" name="city" class="form-control"
											id="name_on_card" placeholder="City" required>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12">
							<div class="row">
								<div class="form-group pull-left mt5">
									<div class="col-sm-8">
										<label for="state" class="control-label">State</label> <select
											class="form-control" name="state" id="state" required>
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
									<div class="col-sm-4">
										<label for="zip" class="control-label">Zip</label> <input
											type="text" name="zip" class="form-control" id="name_on_card"
											placeholder="Zip" required>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="modal-footer text-right">
						<button type="reset" class="btn btn-default">Cancel</button>
						<button type="button" class="btn btn-danger">Add Payment</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- ./payment modal -->
	<div class="clearfix"></div>
	<!-- ./product details image modal -->
	<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->
</body>

</html>