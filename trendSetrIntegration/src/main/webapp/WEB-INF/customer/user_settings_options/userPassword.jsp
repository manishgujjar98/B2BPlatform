<!DOCTYPE html>
<html>

<head>
<title>User Password</title>
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
					<section class="col-sm-9 settings-content" id="settings-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h1>Change Password (Page Title)</h1>
								</div>
								<form action="" method="post">
									<div class="panel-body">
										<div class="col-sm-8 col-sm-offset-2">
											<div class="form-group">
												<label for="old-password" class="control-label">Current
													Password</label> <input type="password" name="old_password"
													class="form-control">
											</div>
											<div class="form-group">
												<label for="new-password" class="control-label">New
													Password</label> <input type="password" name="new_password"
													class="form-control"> <span
													class="help-block text-center">Password must be
													alteast six(6) characters and include at least one (1)
													number or symbol </span>
											</div>
											<div class="form-group">
												<label for="confirm-password" class="control-label">Confirm
													Password</label> <input type="password" name="confirm_password"
													class="form-control">
											</div>
										</div>
									</div>
									<div class="panel-footer">
										<button class="btn btn-danger disabled" type="submit">Change
											Password</button>
									</div>
								</form>
							</div>
							<div class="msg-block warning">
								<strong>Incorrect Password! </strong>Your password has not
								changed!
							</div>
							<div class="msg-block success">
								<strong>Success! </strong>Your password has been updated!
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

	<!-- Trigger the modal with a button -->
	<!-- product model -->
	<!-- product modal-->
	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="product-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">X</button>
					<!-- product content -->
					<div class="col-sm-7">
						<div class="row">
							<div class="fullwidth">
								<div class="img-block custom-image">
									<img src="images/product2.jpg" class="img-responsive"
										alt="product image">
								</div>
								<div class="meta-data">
									<h1 class="meta-title">Product Name</h1>
									<h2 class="meta-title sub">Merchant Name</h2>
								</div>
								<div class="product-block">
									<div class="col-xs-4">
										<a href=""><img src="images/product2.jpg"
											alt="product name" class="img-responsive"></a>
									</div>
									<div class="col-xs-4">
										<a href=""><img src="images/product2.jpg"
											alt="product name" class="img-responsive"></a>
									</div>
									<div class="col-xs-4">
										<a href=""><img src="images/product2.jpg"
											alt="product name" class="img-responsive"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-5 text-center product-details">
						<div class="img-block">
							<img src="images/merchant1.png" alt="merchantimage">
						</div>
						<div class="product-options center-block">
							<div class="form-group">
								<select name="sizes" class="form-control">
									<option value="">Select Sizes</option>
									<option value="">Small</option>
									<option value="">Medium</option>
									<option value="">Large</option>
									<option value="">Large</option>
									<option value="">Large</option>
								</select>
							</div>
							<div class="form-group">
								<select name="sizes" class="form-control">
									<option value="">Select Colors</option>
									<option value="">Red</option>
									<option value="">Blue</option>
									<option value="">Green</option>
								</select>
							</div>
						</div>
						<div class="product-description">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Optio nobis explicabo repudiandae soluta recusandae, cumque
								quibusdam iste beatae ipsum maxime reiciendis necessitatibus,
								voluptatum dolorem hic natus! Repellendus eius quod, maiores.</p>
						</div>
						<div class="influenced">
							<ul class="list-inline list-unstyled mb0">
								<li><a href=""><img src="images/merchant1.png" alt=""></a>
								</li>
								<li><a href=""><img src="images/merchant2.png" alt=""></a>
								</li>
								<li><a href=""><img src="images/merchant3.png" alt=""></a>
								</li>
								<li><a href=""><img src="images/merchant1.png" alt=""></a>
								</li>
								<li><a href=""><img src="images/merchant2.png" alt=""></a>
								</li>
								<li><a href=""><img src="images/merchant3.png" alt=""></a>
								</li>
								<li><a href=""><img src="images/merchant1.png" alt=""></a>
								</li>
							</ul>
						</div>
						<div class="product-footer">
							<button class="btn btn-success quickbuy fullwidth"
								data-toggle="modal" data-target="#purchase-modal"
								data-dismiss="modal">Quick Buy</button>
						</div>
						<div class="product-footer">
							<button class="btn btn-primary addtocart">Add to Cart</button>
							<button class="btn btn-default gift" data-toggle="modal"
								data-target="#gift-modal" data-dismiss="modal">Gift</button>
						</div>
					</div>
					<!-- ./product content -->
				</div>
			</div>
		</div>
	</div>
	<!-- ./product modal -->
	<!-- purchase-modal -->
	<div class="modal fade" data-backdrop="static" id="purchase-modal"
		tabindex="-2">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<h1 class="modal-title">Purchase Complete</h1>
					<div class="form-group">
						<textarea name="postmessage" id="" class="form-control" rows="4"></textarea>
					</div>
					<div class="social-icons">
						<ul class="list-inline list-unstyled">
							<li><a href=""><i class="fa fa-facebook fa-4x"></i></a></li>
							<li><a href=""><i class="fa fa-twitter fa-4x"></i></a></li>
							<li><a href=""><i class="fa fa-instagram fa-4x"></i></a></li>
						</ul>
					</div>
					<footer>
						<button class="btn btn-default keep-private" data-dismiss="modal">Keep
							Private</button>
						<button class="btn btn-success quickbuy" data-dismiss="modal">Post</button>
					</footer>
				</div>
			</div>
		</div>
	</div>
	<!-- ./purchase modal -->
	<!-- gift -->
	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="gift-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<h1 class="modal-title">Select a friend</h1>
					<div class="form-group">
						<input type="search" name="search">
					</div>
					<div class="friend-list fullwidth">
						<ul class="list-inline list-unstyled">
							<li><a href=""><img src="images/circle2.jpg"
									alt="friends"> <span>Name</span> </a></li>
							<li><a href=""><img src="images/circle2.jpg"
									alt="friends"><span>Name</span></a></li>
							<li><a href=""><img src="images/circle2.jpg"
									alt="friends"><span>Name</span></a></li>
							<li><a href=""><img src="images/circle2.jpg"
									alt="friends"><span>Name</span></a></li>
						</ul>
						<ul class="list-inline list-unstyled">
							<li><a href=""><img src="images/circle2.jpg"
									alt="friends"> <span>Name</span> </a></li>
							<li><a href=""><img src="images/circle2.jpg"
									alt="friends"><span>Name</span></a></li>
							<li><a href=""><img src="images/circle2.jpg"
									alt="friends"><span>Name</span></a></li>
							<li><a href=""><img src="images/circle2.jpg"
									alt="friends"><span>Name</span></a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
					<footer class="fullwidth">
						<button class="btn btn-success quickbuy" data-dismiss="modal">Continue</button>
					</footer>
				</div>
			</div>
		</div>
	</div>
	<!-- .gift -->
	<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->
</body>

</html>