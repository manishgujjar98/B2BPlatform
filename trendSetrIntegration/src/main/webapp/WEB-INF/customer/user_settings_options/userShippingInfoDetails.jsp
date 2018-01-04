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
									<div class="pull-left">
										<h1>shipping information</h1>
									</div>
									<div class="pull-right">
										<a href="" data-toggle="modal" data-target="#shipping-modal"
											class="add-btn"><i class="fa fa-plus"></i></a>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="panel-body">
									<div class="cards-container">
										<div class="panel panel-default cards">
											<div class="panel-heading">
												(Name) <span class="badge">primary</span>
											</div>
											<div class="panel-body card-body">
												<address>
													<h1 class="card-title">SHIPPING ADDRESS</h1>
													First Name Last Name <br> 000 N.TrendSetr Road <br>
													Town, State #zip <br> Country
												</address>
												<address>
													<h1 class="card-title">TELEPHONE</h1>
													847-777-7777 <br>
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
												<span class="pull-left">(Name) <span class="badge">primary</span></span>
												<span class="pull-right"><i class="fa fa-times"></i></span>
												<span class="clearfix"></span>
											</div>
											<div class="panel-body card-body">
												<address>
													<h1 class="card-title">SHIPPING ADDRESS</h1>
													First Name Last Name <br> 000 N.TrendSetr Road <br>
													Town, State #zip <br> Country
												</address>
												<address>
													<h1 class="card-title">TELEPHONE</h1>
													847777777777 <br>
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
		data-backdrop="static" id="shipping-modal">
		<div class="modal-dialog" style="width: 600px !important;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Add Shipping Information</h4>
				</div>
				<form action="" method="post">
					<div class="modal-body">
						<div class="col-xs-12">
							<div class="form-group">
								<label>Full Name</label> <input type="text" name="name"
									class="form-control">
							</div>
						</div>
						<div class="col-xs-12">
							<div class="form-group">
								<label>Address Nickname (optional)</label> <input type="text"
									name="address_nickname" class="form-control">
							</div>
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
									<div class="col-sm-2">
										<label>Zip</label> <input type="text" name="zip"
											class="form-control">
									</div>
									<div class="col-sm-5">
										<label>Phone Number (optional)</label> <input type="text"
											name="phone" class="form-control">
									</div>
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
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-danger">Add Shipping</button>
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
