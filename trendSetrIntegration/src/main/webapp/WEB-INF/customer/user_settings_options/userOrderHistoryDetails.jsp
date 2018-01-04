<!DOCTYPE html>
<html>


<script>
<!--
	$(document).ready(function() {
		e.preventDefault();
		function disableBack() {
			window.history.forward()
		}
		window.onload = disableBack();
		window.onpageshow = function(evt) {
			if (evt.persisted)
				disableBack()
		}
	});
	-->
	window.history.forward();
</script>



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
					<section class="col-sm-9 settings-content" id="order-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h1>order history</h1>
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
														alt="info"></span> <span class="item-details">Kith
														NYC Tank Top</span> <span classs="estimated-time">Estimated
														Delivery Time: 00/00/00</span> <span class="price"> <span>Order
															Total</span> <span>$74.99</span>
													</span>
												</div>
												<div class="shipping-info">
													<div class="shipping-details">
														<div class="order-placed">
															<span>Order Placed</span> <span>January 31, 2017</span>
														</div>
														<div class="order-ship-to">
															<span>Ship To</span> <span>Name of Address <i
																class="caret"></i></span>
														</div>
														<div class="influenced">
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
													<div class="shipping-tracking">
														<ul class="list-unstyled text-center">
															<li><a href="">Track Package</a></li>
															<li><a href="">Contact Merchant</a></li>
															<li><a href="">Invoice</a></li>
														</ul>
													</div>
												</div>
											</div>
											<div class="order-details">
												<div class="order-info">
													<span><img class="img" src="images/mike2.png"
														alt="info"></span> <span class="item-details">Kith
														NYC Tank Top</span> <span classs="estimated-time">Estimated
														Delivery Time: 00/00/00</span> <span class="price"> <span>Order
															Total</span> <span>$74.99</span>
													</span>
												</div>
												<div class="shipping-info">
													<div class="shipping-details">
														<div class="order-placed">
															<span>Order Placed</span> <span>January 31, 2017</span>
														</div>
														<div class="order-ship-to">
															<span>Ship To</span> <span>Name of Address <i
																class="caret"></i></span>
														</div>
														<div class="influenced">
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
													<div class="shipping-tracking">
														<ul class="list-unstyled text-center">
															<li><a href="">Track Package</a></li>
															<li><a href="">Contact Merchant</a></li>
															<li><a href="">Invoice</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<!-- ./order-block -->
										<!-- order-block -->
										<div class="order-block">
											<div class="order-header">
												<img src="images/mike2.png" alt="orderimage"> <span>Kith
													NYC</span>
											</div>
											<div class="order-details">
												<div class="order-info">
													<span><img class="img" src="images/mike2.png"
														alt="info"></span> <span class="item-details">Kith
														NYC Tank Top</span> <span classs="estimated-time">Estimated
														Delivery Time: 00/00/00</span> <span class="price"> <span>Order
															Total</span> <span>$74.99</span>
													</span>
												</div>
												<div class="shipping-info">
													<div class="shipping-details">
														<div class="order-placed">
															<span>Order Placed</span> <span>January 31, 2017</span>
														</div>
														<div class="order-ship-to">
															<span>Ship To</span> <span>Name of Address <i
																class="caret"></i></span>
														</div>
														<div class="influenced">
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
													<div class="shipping-tracking">
														<ul class="list-unstyled text-center">
															<li><a href="">Track Package</a></li>
															<li><a href="">Contact Merchant</a></li>
															<li><a href="">Invoice</a></li>
														</ul>
													</div>
												</div>
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
