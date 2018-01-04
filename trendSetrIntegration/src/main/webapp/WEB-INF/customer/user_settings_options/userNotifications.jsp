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
			<section class="container">
				<section class="row">
					<!--  user settings menu -->
					<section class="col-sm-3" id="settings-container">
						<%@include file="userSettingsMenu.jsp"%>
					</section>
					<!-- ./ user settings menu -->
					<!-- user settings content -->
					<section class="col-sm-9 settings-content"
						id="notifications-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h1>Notification Settings</h1>
								</div>
								<form action="" method="post">
									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-stripped table-condensed">
												<thead>
													<tr>
														<th></th>
														<th>Email</th>
														<th>Text</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>When someone sends you message</td>
														<td width="8%"><label class="switch"> <input
																type="checkbox" checked>
																<div class="slider round"></div>
														</label></td>
														<td width="9%"><label class="switch"> <input
																type="checkbox" checked>
																<div class="slider round"></div>
														</label></td>
													</tr>
													<tr>
														<td>When someone follows you</td>
														<td width="8%"><label class="switch"> <input
																type="checkbox" checked>
																<div class="slider round"></div>
														</label></td>
														<td width="9%"><label class="switch"> <input
																type="checkbox" checked>
																<div class="slider round"></div>
														</label></td>
													</tr>
													<tr>
														<td>When someone send you a gift</td>
														<td width="8%"><label class="switch"> <input
																type="checkbox">
																<div class="slider round"></div>
														</label></td>
														<td width="9%"><label class="switch"> <input
																type="checkbox">
																<div class="slider round"></div>
														</label></td>
													</tr>
													<tr>
														<td>When one of your post is trending</td>
														<td width="8%"><label class="switch"> <input
																type="checkbox">
																<div class="slider round"></div>
														</label></td>
														<td width="9%"><label class="switch"> <input
																type="checkbox" class="checked">
																<div class="slider round"></div>
														</label></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="panel-footer no-border-top">
										<button class="btn btn-danger">Save Changes</button>
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