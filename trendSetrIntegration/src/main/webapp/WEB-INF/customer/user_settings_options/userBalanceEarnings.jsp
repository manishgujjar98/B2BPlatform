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
					<section class="col-sm-9 settings-content" id="balance-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h1>Balance and Earnings</h1>
								</div>
								<form action="" method="post">
									<div class="panel-body text-center">
										<figure>
											<img src="/trendSetrIntegration/images/TSlogo2.png"
												alt="TrendLogo">
											<caption>
												<h1>TrendSetr Balance</h1>
												<h2>
													<span class="price">$00.00</span>
												</h2>
											</caption>
										</figure>
										<div class="total-earnings">
											<h1>Total Earnings: $00.00</h1>
										</div>
									</div>
									<div class="panel-footer">
										<button class="btn btn-danger">Transfer to Bank</button>
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
	<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->
</body>

</html>