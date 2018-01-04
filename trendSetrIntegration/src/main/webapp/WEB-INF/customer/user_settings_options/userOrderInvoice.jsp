<!DOCTYPE html>
<html>

<head>
<!-- Add Styles here -->
<%@include file="customerStyles.jsp"%>
<!-- ./Add Styles here -->
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
			<section class="col-sm-9 settings-content invoice" id="order-content">
				<section class="row">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h1 class="pull-left">order history</h1>
							<h4 class="pull-right">Invoice</h4>
							<div class="clearfix"></div>
						</div>
						<form action="" method="post">
							<div class="panel-body text-center">
								<!-- order-block -->
								<div class="order-block">
									<div class="order-header">
										<img src="images/mike2.png" alt="orderimage"> <span>Kith
											NYC</span>
									</div>
									<div class="order-details">
										<div class="order-info">
											<span><img class="img" src="images/mike2.png"
												alt="info"></span> <span class="item-details">Kith NYC
												Tank Top</span> <span class="col-sm-5">&nbsp;</span> <span
												class="price"> <span>Order Total</span> <span>$74.99</span>
											</span>
										</div>
										<div class="shipping-info">
											<div class="col-sm-6">
												<h2 class="order-date">Order Placed: January 31, 2017</h2>
												<br>
												<h2 class="label-header">Shipping Information</h2>
												Address: <br> City State Zip <br>
												<h2 class="label-header">Payment Method :</h2>
												<i class="fa fa-cc-visa fa-2x"></i> ****0236
											</div>
											<div class="col-sm-6">
												<h2 class="order-date">Estimated Delivery Time:
													00/00/0000</h2>
												<br>
												<h2 class="label-header">Order Summary</h2>
												<table class="table table-condensed table-stripped">
													<tr>
														<td>item(s) Subtotal:</td>
														<td align="right">$74.50</td>
													</tr>
													<tr>
														<td>Shipping & Handling:</td>
														<td align="right">$3.99</td>
													</tr>
													<tr>
														<td>Total before Tax:</td>
														<td align="right">$77.99</td>
													</tr>
													<tr>
														<td>Estimated Tax:</td>
														<td align="right">$4.5</td>
													</tr>
													<tr>
														<td>Grand Total</td>
														<td align="right">$89.25</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
									<div class="influenced">
										<div class="influence-title">People Influenced:</div>
										<ul class="list-inline list-unstyled mb0">
											<li><a href=""><img src="images/merchant1.png"
													alt=""></a></li>
											<li><a href=""><img src="images/merchant2.png"
													alt=""></a></li>
											<li><a href=""><img src="images/merchant3.png"
													alt=""></a></li>
											<li><a href=""><img src="images/merchant1.png"
													alt=""></a></li>
											<li><a href=""><img src="images/merchant2.png"
													alt=""></a></li>
											<li><a href=""><img src="images/merchant3.png"
													alt=""></a></li>
											<li><a href=""><img src="images/merchant1.png"
													alt=""></a></li>
										</ul>
									</div>
								</div>
								<!-- ./order-block -->
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
	<!-- .gift -->
	<!-- ./product details image modal -->
	<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->
</body>

</html>
