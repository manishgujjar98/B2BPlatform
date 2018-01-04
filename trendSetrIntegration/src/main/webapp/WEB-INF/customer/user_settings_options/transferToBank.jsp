<!DOCTYPE html>
<html>

<!-- header -->
<header id="header">
	<%@include file="customerNavigation.jsp"%>
</header>
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
				<section class="col-sm-9 settings-content" id="transfer-content">
					<section class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="pull-left">
									<h1>Transfer to Bank</h1>
								</div>
								<div class="pull-right">TrendSetr Balance: $00.00</div>
								<div class="clearfix"></div>
							</div>
							<div class="panel-body">
								<div class="form-container">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="form-group">
												<label>Amount To Transfer</label> <input type="text"
													class="form-control" placeholder="$00">
											</div>
											<div class="form-group">
												<label>Select Bank</label> <select name="banke"
													class="form-control">
													<option value="">Name of Bank</option>
													<option value="">Chase</option>
													<option value="">Bank of America</option>
													<option value="">Citi</option>
												</select>
											</div>
											<div class="form-group">
												<label>Bank Account Number</label> <input type="text"
													class="form-control" placeholder="000000000">
											</div>
											<div class="form-group">
												<label>Bank Account Routing Number</label> <input
													type="text" class="form-control" placeholder="Na ***6969">
											</div>
											<div class="form-group text-center">
												<small><a href="">Disclaimer</a></small>
											</div>
										</div>
									</div>

								</div>

							</div>
							<div class="panel-footer text-center">
								<button class="btn btn-danger" type="submit">Transfer
									Now</button>
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
<!-- .gift -->
<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->
</body>

</html>
