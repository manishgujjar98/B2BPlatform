<!DOCTYPE html>
<html>

<head>
<title>Order Order History</title>
<!-- Add Styles here -->
<%@include file="customerStyles.jsp"%>
<!-- ./Add Styles here -->

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
					<section class="col-sm-9 settings-content" id="order-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h1>order history</h1>
								</div>
								<form action="" method="post">
									<div class="panel-body text-center">
										<h1 class="material-icons">whatshot</h1>
										<h2>You have yet to make purchase!</h2>
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