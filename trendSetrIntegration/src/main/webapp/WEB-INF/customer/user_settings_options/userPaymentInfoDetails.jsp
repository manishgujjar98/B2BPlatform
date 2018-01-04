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
							<div class="pull-left">
								<h1>Payment information</h1>
							</div>
							<div class="pull-right">
								<a href="" data-toggle="modal" data-target="#payment-modal"
									class="add-btn"><i class="fa fa-plus"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="panel-body">
							<div class="cards-container">
								<div class="panel panel-default cards">
									<div class="panel-heading">
										<i class="fa fa-cc-visa fa-2x pull-left"></i> Debit(1234) <span
											class="badge pull-right">primary</span>
										<div class="clearfix"></div>
									</div>
									<div class="panel-body card-body">
										<address>
											<h1 class="card-title">BILLING ADDRESS</h1>
											First Name Last Name <br> 000 N.TrendSetr Road <br>
											Town, State #zip <br> Country
										</address>
										<address>
											<h1 class="card-title">EXPIRY DATE</h1>
											00/00/0000 <br>
										</address>
									</div>
									<div class="panel-footer text-center">
										<button class="btn btn-default btn-sm default">Edit</button>
										<button class="btn btn-default btn-sm primary active">Make
											Primary</button>
									</div>
								</div>
								<div class="panel panel-default cards">
									<div class="panel-heading">
										<i class="fa fa-cc-visa fa-2x pull-left"></i> Debit(1234)
										<div class="clearfix"></div>
									</div>
									<div class="panel-body card-body">
										<address>
											<h1 class="card-title">BILLING ADDRESS</h1>
											First Name Last Name <br> 000 N.TrendSetr Road <br>
											Town, State #zip <br> Country
										</address>
										<address>
											<h1 class="card-title">EXPIRY DATE</h1>
											00/00/0000 <br>
										</address>
									</div>
									<div class="panel-footer text-center">
										<button class="btn btn-default btn-sm default">Edit</button>
										<button class="btn btn-default btn-sm primary">Make
											Primary</button>
									</div>
								</div>
							</div>
						</div>
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
	<!-- payment modal-->
	<div class="modal fade add_pop_form_details" data-keyboard="false"
		data-backdrop="static" id="payment-modal">
		<div class="modal-dialog" style="width: 600px !important;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Add Payment Type</h4>
				</div>
				<form action="" method="post">
					<div class="modal-body">
						<div class="col-xs-12">
							<div class="form-group">
								<label>Name on Card</label> <input type="text" name="name"
									class="form-control">
							</div>
						</div>
						<div class="col-xs-12">
							<div class="row">
								<div class="form-group">
									<div class="col-sm-5">
										<label>Card Number</label> <input type="text"
											name="card_number" class="form-control">
									</div>
									<div class="col-sm-3">
										<label>CVV</label> <input type="text" name="cvv"
											class="form-control">
									</div>
									<div class="col-sm-4">
										<label>Expiration Date</label>
										<div class="row">
											<div class="col-sm-6">
												<input type="text" name="dd" class="form-control">
											</div>
											<div class="col-sm-6">
												<input type="text" name="yyyy" class="form-control">
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
										<label>Address Line 1</label> <input type="text"
											name="address_line_1" class="form-control">
									</div>
									<div class="col-sm-6">
										<label>Address Line 2(Optional)</label> <input type="text"
											name="address_line_2" class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12">
							<div class="row">
								<div class="form-group">
									<div class="col-sm-6">
										<label>Country</label> <input type="text" name="country"
											class="form-control">
									</div>
									<div class="col-sm-6">
										<label>City</label> <input type="text" name="city"
											class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12">
							<div class="row">
								<div class="form-group pull-left mt5">
									<div class="col-sm-5">
										<label>State</label> <input type="text" name="state"
											class="form-control">
									</div>
									<div class="col-sm-3">
										<label>Zip</label> <input type="text" name="zip"
											class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="modal-footer text-right">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-danger">Add Payment</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- ./payment modal -->
	<!-- ./product details image modal -->
	<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->
</body>

</html>
