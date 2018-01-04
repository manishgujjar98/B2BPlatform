<!DOCTYPE html>
<html>
<head>
<%@include file="customerStyles.jsp"%>
</head>
<body class="bglightgray">
	<!-- header -->
	<%@include file="customerNavigation.jsp"%>
	<!-- ./header -->

	<!-- user cart -->
	<div class="col-xs-12 mt100" id="user-cart">
		<div class="row">
			<div class="custom-container">
				<!-- purchase cart -->
				<div class="childs cart-container">
					<div class="panel panel-default bgwhite">
						<div class="panel-heading">Complete Purchase</div>
						<div class="panel-body">
							<table class="table">
								<tr>
									<th>Quantity</th>
									<td align="right">#</td>
								</tr>
								<tr>
									<th>Shipping</th>
									<td align="right">$00.00</td>
								</tr>
								<tr>
									<th>Tax</th>
									<td align="right">$00.00</td>
								</tr>
								<tr>
									<th>SubTotal:</th>
									<td align="right">$00.00</td>
								</tr>
								<tr class="border">
									<th>Total</th>
									<td align="right">$00.00</td>
								</tr>
							</table>
							<button class="btn btn-success mt15 paybutton">Pay with
								Card</button>
						</div>
					</div>
					<div class="fullwidth text-center">
						<p>or</p>
						<a href="">Keep Shopping</a>
					</div>
					<span class="clearfix"></span>
				</div>
				<!-- ./purchase cart -->
				<!--  main cart block -->
				<div class="childs orders-list-container">
					<div class="panel pane-default">
						<div class="panel-heading bggray">
							<img src="images/merchant1.png" width="35px" height="35px"
								class="img-circle" alt=""> <strong class="ml15">Merchant
								Name</strong>
						</div>
						<div class="panel-body">
							<span class="remove-btn">remove</span>
							<div class="col-sm-6">
								<div class="media">
									<div class="media-left">
										<img src="images/merchant1.png" class="media-object"
											width="100px">
									</div>
									<div class="media-body">
										<h4 class="media-heading mt25">Product Name</h4>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="col-xs-6">
									<div class="form-group mt25 right">
										<label>Quanty</label> <select name="qty">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</div>
								</div>
								<div class="col-xs-6 right">
									<h4 class="amount mt25">$ 00.00</h4>
								</div>
							</div>
						</div>
					</div>
					<div class="well well-sm bgwhite">
						<h1 class="pull-left balance">
							TrendSetr balance: <span>$00.00</span>
						</h1>
						<input type="radio" name="radio" class="pull-right"> <span
							class="clearfix"></span>
					</div>
					<div class="col-sm-6" id="payment-modal">
						<div class="row mr0">
							<div class="panel panel-default">
								<div class="panel-heading bgwhite">
									<h4 class="pull-left">Add Payment Type</h4>
									<span class="close-btn pull-right">X</span> <span
										class="clearfix"></span>
								</div>
								<form action="" method="post">
									<div class="panel-body">
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
															<div class="col-sm-6 mobile-mt15">
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
														<input type="checkbox" name="primary" id="primary">
														<label for="primary">Make this primary payment
															method</label>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xs-12 mt15">
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
													<div class="col-sm-6 mt15">
														<label>Country</label> <input type="text" name="country"
															class="form-control">
													</div>
													<div class="col-sm-6 mt15">
														<label>City</label> <input type="text" name="city"
															class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="col-xs-12">
											<div class="row">
												<div class="form-group pull-left mt5">
													<div class="col-sm-5 mt15">
														<label>State</label> <input type="text" name="state"
															class="form-control">
													</div>
													<div class="col-sm-3 mt15">
														<label>Zip</label> <input type="text" name="zip"
															class="form-control">
													</div>
													<div class="col-sm-4 mt15">
														<label>&nbsp;&nbsp;</label>
														<button type="button" class="btn btn-primary form-control">Save</button>
													</div>
												</div>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-sm-6" id="payment-modal">
						<div class="row ml0">
							<div class="panel panel-default">
								<div class="panel-heading bgwhite">
									<h4 class="pull-left">Add Shipping Information</h4>
									<span class="close-btn pull-right">X</span> <span
										class="clearfix"></span>
								</div>
								<form action="" method="post">
									<div class="panel-body">
										<div class="col-xs-12">
											<div class="form-group">
												<label>Full Name</label> <input type="text" name="name"
													class="form-control">
											</div>
										</div>
										<div class="col-xs-12">
											<div class="form-group">
												<label>Address Nickname (optional)</label> <input
													type="text" name="address_nickname" class="form-control">
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
													<div class="col-sm-6 mt15">
														<label>Country</label> <input type="text" name="country"
															class="form-control">
													</div>
													<div class="col-sm-6 mt15">
														<label>City</label> <input type="text" name="city"
															class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="col-xs-12">
											<div class="row">
												<div class="form-group">
													<div class="col-sm-5 mt15">
														<label>State</label> <input type="text" name="state"
															class="form-control">
													</div>
													<div class="col-sm-2 mt15">
														<label>Zip</label> <input type="text" name="zip"
															class="form-control">
													</div>
													<div class="col-sm-5 mt15">
														<label>Phone Number (optional)</label> <input type="text"
															name="phone" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="col-xs-12 mt15">
												<input type="checkbox" name="primary" id="primary">
												<label for="primary">Make this primary shipping
													details</label>
												<button type="button" class="btn btn-primary pull-right">Save</button>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- .main cart block -->
			</div>
		</div>
	</div>
	<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->
</body>

</html>
