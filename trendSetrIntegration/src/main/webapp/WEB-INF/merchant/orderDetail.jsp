
<!DOCTYPE html>
<html>

<head>

<%@include file="merchantStyles.jsp"%>

<!-- <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Orders Details</title>
<link rel="shortcut icon" href="">
Material design icons
<link rel="stylesheet"
	href="https://storage.googleapis.com/code.getmdl.io/1.0.4/material.red-purple.min.css">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.2.1/material.indigo-pink.min.css" />
Material design fonts
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	type="text/css">
bootstrap date and time picker
<link rel="stylesheet"
	href="/trendSetrIntegration/css/bootstrap-datetimepicker-standalone.css" />
<link rel="stylesheet"
	href="/trendSetrIntegration/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet"
	href="/trendSetrIntegration/css/bootstrap-datetimepicker.min.css" />
bootstrap
<link rel="stylesheet"
	href="/trendSetrIntegration/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/trendSetrIntegration/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
custom styles
<link rel="stylesheet" href="/trendSetrIntegration/css/app.css"> -->
<!--[if IE]>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>


/* The Modal (background) */

.cus-align{
	font-size: 16px;
    font-weight: 600;
}
.modal-dialog {
	width: 750px;
	margin: 30px auto;
}
.modal-dialog.conFirmation{
	width: 450px;
	}
.modal-content.conFirmation{
	width: 450px;
    /* height: 200px; */
    text-align: center;
}

.modal-body {
	padding: 10px !important;
	/* height: 320px; */
	overflow: auto;
}

.modal-header-ups {
	margin: 5px 20px;
	padding: 0;
	text-align: center !important;
	color: #fff;
	background: linear-gradient(to bottom right, rgb(250, 184, 10),
		rgb(90, 65, 51));
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 5px;
	border: 1px solid #888;
	width: 80%;
	text-align: left;
	border-radius: 5px !important;
}
.modal-header.conFirmation{
	padding: 0;
}


/* The Close Button */
.modal-header .close2 {
    margin-top: -7px;
}
.close {
	color: #085eb9;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.close1 {
	color: #085eb9;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close1:hover, .close1:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.close2 {
	color: #085eb9;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close2:hover, .close2:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-footer.submit {
	text-align: center;
}

div#datetimepicker5 {
	z-index: 0;
}
</style>
</head>

<body>
	 <div id="loader"></div> 
	<input type="hidden" id="hiddenUID"
		value="<%=session.getAttribute("userId")%>">
	<input type="hidden" id="hiddenOID"
		value="<%=request.getParameter("orderID")%>">

	<input type="hidden" id="addresslistId" value="">

	<!-- header -->
	<%@include file="merchantNavigation.jsp"%>
	<!--header -->

	<section class="col-xs-12 b2b-header-margin" id="order-detail">
		<section class="">
			<section class="">
				<section class="">
					<!-- user settings content -->
					<div class="order-history-invoice-div">
						<h4 class="pull-left">Order Detail</h4>
						<h4 class="pull-right">
							<a href="">Back</a>
						</h4>
						<div class="clearfix"></div>
					</div>
					<section class="col-sm-8 settings-content invoice"
						style="padding-left: 0px;">
						<section>
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="order-header">
										<img class="img-circle" src="../images/mike2.png" id="customerImage"
											alt="orderimage"> <span id="customerNameID">Customer
											Name</span>
									</div>
								</div>
								<form action="" method="post">
									<div class="panel-body text-center">
										<!-- order-details -->
										<div class="order-details">
											<div class="order-info">
												<!-- <span class="col-sm-4 text-left"><img class="img"
													src="../images/mike2.png" alt="info"></span> -->
												<div class="">
													<table class="table" id="orderProductsID">
														<!-- <tbody>
														<thead class="align-center">
															<tr>
																<th class="align-center">Product Image</th>
																<th class="align-center">Product Name</th>
																<th class="align-center">Sku ID</th>
																<th class="align-center">Quantity</th>
																<th class="align-center">Quantity_Price</th>
															</tr>
														</thead>

														<tr>
															<td border="0"><img class="img"
																src="../images/mike2.png" alt="info"></td>
															<td>Lee cooper</td>
															<td>12345</td>
															<td>Shipping</td>
															<td>$3.99</td>
														</tr>
														<tr>
															<td border="0"><img class="img"
																src="../images/mike2.png" alt="info"></td>
															<td>Allen solly:</td>
															<td>12345</td>
															<td>Shipping</td>
															<td>$3.99</td>
														</tr>
														<tr>
															<td border="0"><img class="img"
																src="../images/mike2.png" alt="info"></td>
															<td>Tommy Hilfigher:</td>
															<td>12345</td>
															<td>Shipping</td>
															<td>$3.99</td>
														</tr>
														</tbody> -->
													</table>
												</div>
												<!-- <span
													class="item-details col-sm-4 ">ProductName</span> 
													<span>Sku ID</span>
													<span>Quantity</span>
													<span>Quantity_Price</span> -->
												<!-- <span
													class="price col-sm-4"> <span>Order Total</span> <span>$74.99</span>
												</span -->
											</div>
											<div class="clearfix"></div>

											<div class="shipping-info">
												<h2 class="order-date">
													<b>Order Placed: January 31, 2017</b>
												</h2>
												<div class="col-sm-3">
													<h2 class="label-header">
														<b>Shipping Address</b>
													</h2>
													<div class="shipping-address" id="shippingAdrId">
														</h2>
														<label id="addressToID">100 Avalon Bay Dr</label> <br>
														<label id="phoneToID">589-965-8745</label><br> <label
															id="cityToID"> Lawrenceville</label> <label
															id="stateToID">NJ</label> <label id="countryToId">US</label>
														<label id="zipcodeToID">08648</label>
													</div>


													<div>
														<h2 class="label-header">
															<b>Size</b>
														</h2>
														<select name="" id="shippingSize" class="form-control-cus"
															required="">
															<option>Choose Size</option>
															<option>Choose Size 1</option>
															<option>Choose Size 2</option>
														</select>
														<!-- <input type="text" name="size" class="form-control"
															placeholder="Enter Size"> -->
													</div>
													<h2 class="label-header">
														<b>Weight</b>
													</h2>
													<div>
														<input type="text" name="weight" class="form-control"
															placeholder="Enter Weight in lbs" id="boxWeightID">
													</div>
												</div>
												<div class="col-sm-3">

													<div class="shipping-address" id="AddMerchantAddressID"></div>
													<h2 class="label-header">
														<b>If Another Address</b>
													</h2>

													<div>
														<select name="" id="sub-Address" class="form-control-cus"
															required="">

														</select>
													</div>

												</div>
												<div class="col-sm-6">
													<br>
													<h2 class="label-header" style="margin-top: 0;">
														<b>Order Summary</b>
													</h2>
													<table
														class="table table-condensed table-stripped table-bordered">
														<tr>
															<td>item(s) Subtotal:</td>
															<td align="right" id="productPriceID">$74.50</td>
														</tr>
														<tr>
															<td>Shipping & Handling:</td>
															<td align="right" id="shippingRateId">$3.99</td>
														</tr>
														<tr>
															<td>Total before Tax:</td>
															<td align="right" id="beforeTaxID">$77.99</td>
														</tr>
														<tr>
															<td>Estimated Tax to be collected:</td>
															<td align="right" id="taxRateId">$4.5</td>
														</tr>
														<tr>
															<td>Grand Total</td>
															<td align="right" id="grandTotalID">$89.25</td>
														</tr>
													</table>
												</div>
											</div>
										</div>
										<!-- ./order-details -->
									</div>
								</form>
							</div>
						</section>
					</section>
					<!-- ./user settings content -->
					<!--  user settings menu -->
					<section class="col-sm-4" id="shipping-container">
						<section class="">
							<div class="panel panel-default" style="padding-bottom: 30px;">
								<div class="panel-heading text-center">
									<h3>TrendSetr Shipping</h3>
								</div>
								<div class="panel-body text-center">
									<h2 class="panel-heading" >Pick Up</h2>
									<div class="">
										<div class="">
											<div>
												<div class="form-group">
													<div class='input-group date' id='datetimepicker5'>
														<input type='text' class="form-control"
															id='datetimepicker' /> <span class="input-group-addon">
															<span class="glyphicon glyphicon-calendar"></span>
														</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button class="btn btn-default pick-up mt20" data-target=""
										data-dismiss="" id="PickUp" >Pick Up</button>
									<h2 class="panel-heading">Drop Off</h2>
									<button id="printLableID" class="btn btn-primary print-label">Print
										Label</button>
									<button class="btn btn-primary nearest-store" id="myBtn">Locate
										a nearest UPS Store</button>
									<!-- <button class="btn btn-primary nearest-store" data-toggle="modal" data-target="#locate-store">Locate a
										nearest UPS Store</button> -->
									<!-- Locate-store modal-->
<img alt="" id="displayImageID" src="">
									<div id="myModal" class="modal">

										<!-- Modal content -->
										<!-- current shipping modal-->

										<div class="modal-dialog">
											<div class="modal-content">
												<span class="close">×</span>
												<div class="modal-header-ups">

													<div class="title">
														<h4>UPS Stores</h4>
													</div>
													<span class="clearfix"></span>
												</div>
												<div class="modal-body">

													<table class="table">
														<tbody>
														</tbody>
														<thead class="align-center">
															<tr>
																<th>Address</th>
																<th>Telephone</th>
																<th>Store Timimgs</th>
															</tr>
														</thead>

														<tbody id="nearUpsStoreID">
															<tr>
																<td border="0"><input class="checkbox-ups-store"
																	id="changeAddress" type="checkbox"> <span
																	class="cardupstoreaddress"> First Name Last Name
																		<br> 000 N. TrendSetr Road <br> Town,
																		Street, City <br> Country
																</span></td>
																<td>12345</td>
																<td>12345</td>

															</tr>
															<tr>
																<td border="0"><input class="checkbox-ups-store"
																	id="changeAddress" type="checkbox"> <span
																	class="cardupstoreaddress"> First Name Last Name
																		<br> 000 N. TrendSetr Road <br> Town,
																		Street, City <br> Country
																</span></td>
																<td>12345</td>
																<td>12345</td>
															</tr>
															<tr>
																<td border="0"><input class="checkbox-ups-store"
																	id="changeAddress" type="checkbox"> <span
																	class="cardupstoreaddress"> First Name Last Name
																		<br> 000 N. TrendSetr Road <br> Town,
																		Street, City <br> Country
																</span></td>
																<td>12345</td>
																<td>12345</td>
															</tr>
														</tbody>
													</table>
													<!-- <div class="card-body-upsStore">
														<span class="pull-left"><input id="changeAddress"
															type="checkbox"></span> <span class="cardupstoreaddress">
															First Name Last Name <br> 000 N. TrendSetr Road <br>
															Town, Street, City <br> Country
														</span> <span class="pull-right padd-right50"> Telephone <br>
															0000000
														</span>

													</div>
													<div class="card-body-upsStore">
														<span class="pull-left"><input id="changeAddress"
															type="checkbox"></span> <span class="cardupstoreaddress">
															First Name Last Name <br> 000 N. TrendSetr Road <br>
															Town, Street, City <br> Country
														</span> <span class="pull-right padd-right50"> Telephone <br>
															0000000
														</span>

													</div> -->
												</div>


											</div>
										</div>
										<!-- ./current shipping -->

									</div>


									<!-- ./Locate-store -->
									
									<!-- Confirm Secure Popoup -->

									<div id="confirmSecure" class="modal">
										<!-- Modal content -->

										<div class="modal-dialog conFirmation">
											<div class="modal-content conFirmation">
												<!-- <span class="close2">×</span> -->
												<div class="modal-header conFirmation">
												<span class="close2">×</span>
													<!-- <button type="button" class="close2" data-dismiss="modal" aria-hidden="true">×</button> -->
											    </div>
												<div class="modal-body">
													<div id="confirmation" class="card-body-upsStore">
														<span id="globalInputId"> <br>
															First Name Last Name <br>
															000 N. TrendSetr Road <br> Town, Street, City <br>
															Country<br>
														</span>
														
														<span class="pull-left cus-align">Please confirm to Drop off the Package?</span>
														<!-- manesh image -->
														<!-- <img alt="" id="displayImageID" src=""> -->
													</div>
													
													<div id="shippingCheck" class="card-body-upsStore" style="display: none;">
														<span class="pull-left p10 pt40">Your Shipment is ready Please check your Label in Print-label</span>
														 
													</div>
													
													<div id="HideConfirmBtn" class="modal-footer submit ">
														<button id="Confirmbtn" class="btn btn-primary" onclick="createShipping()">Confirm</button>
														<button class="btn btn-danger">Cancel</button>
													</div>
												</div>
											</div>
										</div>


									</div>
									
									<!-- Confirm Secure popup -->



									<!-- Pick-Up Popoup -->

									<div id="pickUpAddress" class="modal">
										<!-- Modal content -->

										<div class="modal-dialog">
											<div class="modal-content">
												<span class="close1">×</span>
												<div class="modal-header">
													<span>Your Shipment is Created Succeefully:<span id="shipmentId">XXXX</span> </span> <span
														class="clearfix"></span>
												</div>
												<div class="modal-body">

													<div class="card-body-upsStore" >
														<span class="pull-left"></span> <span id="globalInputId1"
															class="cardupstoreaddress"> First Name Last Name <br>
															000 N. TrendSetr Road <br> Town, Street, City <br>
															Country
														</span>

													</div>
													<div class="card-body-upsStore">
														<span class="pull-left"></span> <span
															class="cardupstoreaddress"> Ready Time <input id="readyTimeID"
															type="time"></input> Close Time <input id="closeTimeID"
															type="time"></input>
														</span>
													</div>
													<div>
														<button class="btn btn-primary" onClick="getPickUp()">Submit</button>
													</div>
													<hr>
													<div>Total Charges for Pick up: <span id="pickUpChargeSId"></span></div>
												</div>
												<hr>

												<!-- <div class="modal-footer submit">
													<button class="btn btn-primary">Submit</button>
												</div> -->

											</div>
										</div>


									</div>
								</div>
							</div>
						</section>
					</section>




					<!-- ./ user settings menu -->
				</section>
			</section>
		</section>
	</section>
	<!-- ./user settings -->
	<div class="clearfix"></div>

	<!-- JS Files -->
	<%@include file="merchantFooter.jsp"%>

	<!-- .gift -->
	<!-- <script type="text/javascript"
		src="/trendSetrIntegration/js/jquery.min.js"></script>
	<script type="text/javascript" src="js/moment.js"></script>
    <script type="text/javascript" src="js/transition.js"></script>
    <script type="text/javascript" src="js/collapse.js"></script>-->
	<script type="text/javascript"
		src="/trendSetrIntegration/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script type="text/javascript"
		src="/trendSetrIntegration/js/bootstrap-datetimepicker.js"></script>
	<!--Material desig nscript
	<script
		src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
	<script src="/trendSetrIntegration/js/app.js"></script> -->
	<script>
		var localAddList = [];
		//for size-adding @manesh
		var localSizeList = [];
		//adding one more varibale for calculating price by @manesh 12/11/2017
		var allProductPrice = 0;
		//to get from one function and to direct it into taxjar API
		var rateAmount =0;
		//adding to collect all product into one array
		var productList = [];
		
		$(document).ready(function() {
			$('#datetimepicker').datetimepicker();
			//alert(localStorage.getItem('merchantID'));
			getOrderDetails();
			getMerChantAddressDetails();
			getMerchantShipDetails();
		})

		var addressLineTo;
			var stateTo;
			var cityTo;
			var zipcodeTo;
			var phoneTo;
			var countryTo;
			var custumerFirstName;
			var customerLastName;
		function getOrderDetails() {
			var orderProductsHtml = "";
			var ShippingAdr = "";
			$.ajax({
				type : "GET",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/order/orderInfo/"
						+ $("#hiddenOID").val(),
				dataType : "json",
				success : function(responseData, status) {
					productList = responseData;
					orderProductsHtml = orderProductsHtml + '<tbody>'+
															'<thead class="align-center">'+
															'<tr>'+
															'<th class="align-center">Product Image</th>'+
															'<th class="align-center">Product Name</th>'+
							   								'<th class="align-center">Sku ID</th>'+
							              					'<th class="align-center">Quantity</th>'+
															'<th class="align-center">Quantity_Price</th>'+
										   					'</tr>'+
															'</thead>';

					var i =0;
					$.each(responseData,
							function(index, value) {
								//adding by manesh
													
								addressLineTo =this.address.addressLine1;
								stateTo = this.address.state;
								cityTo = this.address.city;
								zipcodeTo = this.address.zip;
								phoneTo = this.address.phoneNumber;
								countryTo = this.address.country;
		
								custumerFirstName = this.user.firstName;
								customerLastName = this.user.lastName;						
								//alert(this.user.profile.profileImage);
								$("#customerNameID").html(this.user.firstName +" "+this.user.lastName);
								$("#customerImage").attr('src', this.user.profile.profileImage);
								if(i==0){
						ShippingAdr = ShippingAdr								
								+ this.address.addressLine1;
						if (this.address.addressLine2 != null
								&& this.address.addressLine2 != "") {
							ShippingAdr = ShippingAdr
									+ ','
									+ this.address.addressLine2
						}
						ShippingAdr = ShippingAdr
								+ ' &nbsp;'
								//manish
								+ '<br>'
								+ this.address.phoneNumber
								+ ' &nbsp; '
								+ '<br>'
								+ this.address.city
								+ ' &nbsp; &nbsp; '
								+ this.address.state
								+ ' &nbsp; &nbsp;'
								+ '<br> '
								+ this.address.country
								+ ' &nbsp; &nbsp;  '
								+ this.address.zip
								+ ''
								+ '<br>';
								$("#shippingAdrId").html(ShippingAdr);
								i++;
								}
								orderProductsHtml = orderProductsHtml + '<tr>'+
																		'<td border="0"><img class="img-circle" src="'+this.product.productImages.image+'" alt="info"></td>'+
																		'<td>'+this.product.name+'</td>'+
																		'<td>'+this.product.productVariant.skuId+'</td>'+
																		'<td>'+this.product.productVariant.quantity+'</td>'+
																		'<td>$'+this.product.productVariant.price+'</td>'+
																		'</tr>'+
																		'</tbody>';
								allProductPrice = allProductPrice + this.product.productVariant.price;
							});
					
					$("#productPriceID").html(allProductPrice);

					$("#orderProductsID").html(orderProductsHtml);
				},
				error : function(request, status, error) {
					//alert("request.." + request);
					//alert("status.." + status);
					alert("error.." + error);
				}

			});
		}

		function getMerChantAddressDetails() {
			var userId = $("#hiddenUID").val();

			$
					.ajax({
						type : "GET",
						contentType : "application/json; charset=utf-8",
						url : "/trendSetr/rest/addresses/address/" + userId,
						dataType : "json",
						success : function(responseData, status) {
							localAddList = responseData;
							var dropDowns = '<option value="0">Select Address</option> ';
							var primaryMerAdd = "";
							var addFlag = true;
							$
									.each(
											responseData,
											function(index, value) {
												dropDowns += '<option value="'+this.id+'">'
														+ this.addressLine1
														+ '</option> ';
												if (this.status == 1 && addFlag) {
													primaryMerAdd = primaryMerAdd
															+ '<h2 class="label-header"><b>Merchant Address</b></h2>'
															+ this.addressLine1;
													if (this.addressLine2 != null
															&& this.addressLine2 != "") {
														primaryMerAdd = primaryMerAdd
																+ ','
																+ this.addressLine2
													}
													primaryMerAdd = primaryMerAdd
															+ ' &nbsp;'
															//manish
															+ '<br>'
															+ this.phoneNumber
															+ ' &nbsp; '
															+ '<br>'
															+ this.city
															+ ' &nbsp; &nbsp; '
															+ this.state
															+ ' &nbsp; &nbsp;'
															+ '<br> '
															+ this.country
															+ ' &nbsp; &nbsp;  '
															+ this.zip
															+ ''
															+ '<br>';
													addFlag = false;
												}
											});
							$("#AddMerchantAddressID").html(primaryMerAdd);
							$("#sub-Address").html(dropDowns);

						},
						error : function(request, status, error) {
							alert("Error");

						}
					});
		}

		function getMerchantShipDetails() {
			var userId = $("#hiddenUID").val();

			$.ajax({
				type : "GET",
				contentType : "application/json; charset=utf-8",
				//url : "/trendSetr/rest/shipping/orderSiza/" + userId,
				url : "/trendSetr/rest/shipping/orderSize/" + userId,
				dataType : "json",
				success : function(responseData, status) {
					localSizeList = responseData;
					//alert(responseData);
					var dropDowns = '<option value="0">Choose Size</option> ';
					$.each(responseData, function(index, value) {
						dropDowns += '<option value="'+this+'">' + this.title
								+ '</option> ';
					});
					$("#shippingSize").html(dropDowns);

				},
				error : function(request, status, error) {
					alert("Error");

				}
			});
		}
	var globalAdrId = "";
		$("#sub-Address")
				.change(
						function() {
							$("#loader").fadeIn("slow");
							var addressID = this.value;
							globalAdrId= this.value;
							var selectAdd = "";
							$
									.each(
											localAddList,
											function(index, value) {
												if (this.id == addressID) {
													selectAdd = selectAdd
															+ '<h2 class="label-header"><b>Merchant Address</b></h2>'
															+ this.addressLine1
															+','
															+ this.addressLine2
															+ '<br> '
															+ this.phoneNumber
															+ ' &nbsp; '
															+ this.city
															+ ' &nbsp; &nbsp; '
															+ this.state
															+ ' &nbsp; &nbsp;'
															+ '<br> '
															+ this.country
															+ ' &nbsp; &nbsp;  '
															+ this.zip + ''
															+ '<br>';
													///
												}
											});
							$("#AddMerchantAddressID").html(selectAdd);
							//Enable to work B2B Rate API fully working
							getRateApiAmount(addressID);
													 
							//b2b 
							setTimeout(
										function() {
							getCompletePurchase(addressID);
							setTimeout(
									function() {
							var pPrice = $("#productPriceID").html().replace("$","");
							var sPrice=$("#shippingRateId").html().replace("$","");
							var bPrice = parseFloat(pPrice)+parseFloat(sPrice);
							var tPrice = $("#taxRateId").html().replace("$","");
							var gPrice = bPrice + parseFloat(tPrice);
							$("#beforeTaxID").html("$"+bPrice);
							
							$("#grandTotalID").html("$"+gPrice);
									}, 2000);
							$("#loader").fadeOut("slow");
							
										}, 3000);

						});
		//B2B Rate API
			
		var productLength = "";
			var productHeight = "";
			var productWidth = "";
			var productPercent= "";
			
function getRateApiAmount(addressID) {
			
			var boxWeightTo = $("#boxWeightID").val();
			var productSize = $("#shippingSize option:selected").text();
			
			//alert("TEST : "+productSize);
			if(productSize == null && productSize == ""){
				alert("Please select product size");
				return false;
			}
			var input = "";
			$.each(localSizeList,
					function(index, value) {
				if(this.title == productSize){
					productLength = this.lenght;
					productHeight = this.height;
					productWidth = this.width;
					productPercent = this.merchant_percent;
				}
			});	
			
			$.each(localAddList,
					function(index, value) {
						if (this.id == addressID) {
							input = '{' + '"fromAddress":{'
									+ '"firstName":"yo",' + '"lastName":"dan",' +
							'"addressLine1":"'
							if (this.addressLine2 != null
									&& this.addressLine2 != "") {
								input = input + this.addressLine1 + ' , '
										+ this.addressLine2

							} else {
								input = input + this.addressLine1
							}
							input = input + '" ,' + '"city":"' + this.city
									+ '",' + '"state":"' + this.state + '",'
									+ '"zip":"' + this.zip + '",'
									+ '"phoneNumber":"' + this.phoneNumber
									+ '"' + '},' + '"toAddress":{'
									+ '"firstName":"Alex",'
									+ '"lastName":"Lamann",'
									+ '"addressLine1": "' + addressLineTo
									+ '",' + '"city": "' + cityTo + '",'
									+ '"state": "' + stateTo + '",'
									+ '"zip": "' + zipcodeTo + '",'
									+ '"phoneNumber": "' + phoneTo + '"' +

									'},' + '"packageInfo":{' + '"length":"'+productLength+'",'
									+ '"width":"'+productWidth+'",' + '"height":"'+productHeight+'",'
									+ '"weight":"' + boxWeightTo + '",' + '"description":""'
									+ '}' + '}'; 
							}
					});

			//alert(input);

			 $
					.ajax({
						type : "POST",
						contentType : "application/json; charset=utf-8",
						url : "/trendSetr/rest/orders/" + $("#hiddenOID").val()
								+ "/shippings/rate",
						data : input,
						dataType : "json",
						success : function(responseData, status) {
							
							if(productPercent == "100"){
								$("#shippingRateId").html("0");
								rateAmount = 0;
							}else if(productPercent == "0"){
								$("#shippingRateId").html(responseData.RateResponse.RatedShipment.TotalCharges.MonetaryValue);
								rateAmount = responseData.RateResponse.RatedShipment.TotalCharges.MonetaryValue;
							}else if(productPercent == "50"){
								$("#shippingRateId").html(responseData.RateResponse.RatedShipment.TotalCharges.MonetaryValue/2);
								rateAmount = responseData.RateResponse.RatedShipment.TotalCharges.MonetaryValue/2;
							}else{
								$("#shippingRateId").html((responseData.RateResponse.RatedShipment.TotalCharges.MonetaryValue * productPercent)/100);
								rateAmount = (responseData.RateResponse.RatedShipment.TotalCharges.MonetaryValue * productPercent)/100;
							}
						},
						error : function(request, status, error) {
							alert("Rate not working Error");

						}
					}); 

		}
		
		
		//B2B TaxJar @Manish
function getCompletePurchase(addressID){
	//global address to used in ups pickup and locate store
	var globalInput = "";
	$.each(localAddList, function(index, value) {
		if (this.id == globalAdrId) {
			//alert(globalAdrId);
			globalInput = globalInput +'<span>'+
			'<b>'+'Selected Address'+'</b>'+'<br>'+
			 this.addressLine1+'<br>'+
			   this.city+'<br>'+
			    this.state+'\xa0'+
			    this.zip+'<br>'+
			    'Phone:'+this.phoneNumber+'<br>'+
			'</span>';
			//adding by manesh
		}
	});
	$("#globalInputId").html(globalInput);
	$("#globalInputId1").html(globalInput);
	
			var input = '{';
			$
			.each(
					localAddList,
					function(index, value) {
						if (this.id == addressID) {
							var localinput = [];
							$.each(productList,
									  function(index, value) {
								var pList = '{'+
								  	   '"id": ' + this.product.productVariant.skuId + ','+
								  	 				'"quantity":'+this.product.productVariant.quantity +','+
							      					'"product_tax_code": "20010",'+
							      					'"unit_price":'+this.product.productVariant.price+',' +
								  					'"discount": 0'+
								  					'}';
								 localinput.push(pList)	;
								  }); 
							//alert(localinput);
							  input = input + '"address": {'+ 
								    '"from_country": "'+this.country+'",'+
								    '"from_zip": "'+this.zip+'",'+
								    '"from_state": "'+this.state+'",'+
								    '"from_city": "'+this.city+'",'+
								    '"from_street": "'+this.addressLine1+'",'+
								    '"to_country": "'+countryTo + '",'+
								    '"to_zip": "'+zipcodeTo + '",'+
								    '"to_state": "'+stateTo + '",'+
								    '"to_city": "'+cityTo + '",'+
								    '"to_street":"'+addressLineTo + '"'+
								  '},'+
								  '"amount": "'+allProductPrice+'",'+
								  '"shipping": '+rateAmount+','+
								  '"lineItems": ['+localinput+' ]' +
								'}';
						}//amount comes from shipping rate API 
						
					});
							//alert(input);
							
							$.ajax({
								type : "POST",
								contentType : "application/json",
								url : "/trendSetr/rest/tax/taxForOrder",
								data : input,
								dataType : "json",
								success : function(data, status, xhr) {
									//alert(data.tax.amountToCollect);				
									$("#taxRateId").html(data.tax.amountToCollect);
									//alert("Tax calculated suucessfully");
								},
								error : function(request, status, error) {
									alert("Tax Not working Error");
								}
							});//end of ajax
						
							
			
		}
		//end of taxJar
		//creating Pick up
		function getPickUp(){
			//from address
			var fromAddress = "";
			$.each(localAddList, function(index, value) {
				if (this.id == globalAdrId) {
					alert(globalAdrId);
					fromAddress = 
						  '"fromAddress": {'+
						    '"companyName": "trendSetr",'+
						    '"contactName": "Vamsi",'+
						    '"addressLine1": "'+this.addressLine1+'",'+
						    '"city": "'+this.city+'",'+
						    '"state": "'+this.state+'",'+
						    '"zip": "'+this.zip+'",'+
						    '"phoneNumber": "'+this.phoneNumber+'"'+
						  '},';
				}
			});
			alert($("#datetimepicker").val());
			var year = "";
			var month = "";
			var day = "";
			if($("#datetimepicker").val() != null && $("#datetimepicker").val() != ""){
				var pickDate = new Date($("#datetimepicker").val());
				year = pickDate.getFullYear();
				month = ''+(pickDate.getMonth()+1);
				day = ''+pickDate.getDate();
			}
			var input = '{'+
				  '"orderID": "'+ $("#hiddenOID").val()+'",'+
				  fromAddress+
				  '"pickUP": {'+
				    '"closeTime": "'+$("#closeTimeID").val().replace(":","")+'",'+
				    '"readyTime": "'+$("#readyTimeID").val().replace(":","")+'",'+
				    '"pickupDate": "'+year+month+day+'",'+
				    '"quantity": "1"'+
				  '}'+
				'}';
			alert(input);	
			
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "/trendSetr/rest/orders/"+$("#hiddenOID").val()+"/shippings/"+$("#shipmentId").html()+"/pickup",
			data : input,
			dataType : "json",
			success : function(data, status, xhr) {
			alert(data.PickupCreationResponse.RateResult.GrandTotalOfAllCharge);	
			$("#pickUpChargeSId").html(data.PickupCreationResponse.RateResult.GrandTotalOfAllCharge);
			},
			error : function(request, status, error) {
				alert("Pick up Error");
			}
		});//end of ajax 
		}
		//end of pick up
		
		
		//creating shipping
		function createShipping(){
		//from address
			var fromAddress = "";
			$.each(localAddList, function(index, value) {
				if (this.id == globalAdrId) {
					alert(globalAdrId);
					fromAddress = 
						  '"fromAddress": {'+
							    '"firstName":"'+"ADDIDAS"+'",'+
							    '"lastName":"'+"PUMA"+'",'+
							 '"addressLine1": "'+this.addressLine1+'",'+
						    '"city": "'+this.city+'",'+
						    '"state": "'+this.state+'",'+
						    '"zip": "'+this.zip+'",'+
						    '"phoneNumber": "'+this.phoneNumber+'"'+
						  '},';
				}
			});
		var merchantId = localStorage.getItem('merchantID');	
		var boxWeightTo = $("#boxWeightID").val();

		var input = 	'{'+
				  '"orderID":"'+ $("#hiddenOID").val()+'",'+
				  '"merchantID":"' + merchantId + '",'+
				  '"productIds":['+
				    '"PRD171186887",'+
				    '"PRD196497162",'+
				    '"PRD619982250"'+
				  '],'+
				  '"packageInfo":{'+
				    '"length":"'+this.productLength+'",'+
				    '"width":"'+this.productWidth+'",'+
				    '"height":"'+this.productHeight+'",'+
				    '"dimensionUnits":"inches",'+
				    '"dimensionUnitsCode":"IN",'+
				    '"weight":"'+boxWeightTo+'",'+
				    '"weightUnits":"Pounds",'+
				    '"weightUnitsCode":"LBS",'+
				    '"description":"Description"'+
				  '},'+
				  fromAddress
				  +	
				  '"toAddress": {'+
				    '"firstName":"'+custumerFirstName+'",'+
				    '"lastName":"'+customerLastName+'",'+
				    '"addressLine1": "'+addressLineTo+'",'+
				    '"city": "'+cityTo+'",'+
				    '"state": "'+stateTo+'",'+
				    '"zip": "'+zipcodeTo+'",'+
				    '"phoneNumber": "'+phoneTo+'"'+
				  '}'+
				'}';
				//to print value
			

			
		 	$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/trendSetr/rest/orders/"+ $("#hiddenOID").val()+"/shippings",
					data : input,
					dataType : "json",
					success : function(data, status, xhr) {
						var shipObj = $.parseJSON(data.shippingResponse);
						//alert(shipObj.ShipmentResponse.ShipmentResults.PackageResults.ShippingLabel.GraphicImage);
						alert(shipObj.ShipmentResponse.ShipmentResults.PackageResults.ShippingLabel.GraphicImage);
						$("#shipmentId").html(data.id);
						$("#displayImageID").attr('src',"data:image/pdf;base64,"+shipObj.ShipmentResponse.ShipmentResults.PackageResults.ShippingLabel.GraphicImage+"")
						var pdfFile = "data:image/pdf;base64,"+shipObj.ShipmentResponse.ShipmentResults.PackageResults.ShippingLabel.GraphicImage;
						window.open(pdfFile);
						//var byteData  = base64ToArrayBuffer(shipObj.ShipmentResponse.ShipmentResults.PackageResults.ShippingLabel.GraphicImage);
						//saveByteArray("Sample", byteData);
					},
					error : function(request, status, error) {
						alert("Shipping Error");
					}
				});//end of ajax 
				
				
		}
		//
		function base64ToArrayBuffer(base64) {
    		var binaryString = window.atob(base64);
    		var binaryLen = binaryString.length;
    		var bytes = new Uint8Array(binaryLen);
    		for (var i = 0; i < binaryLen; i++) {
       			var ascii = binaryString.charCodeAt(i);
       			bytes[i] = ascii;
    		}
    		return bytes;
 		}

		//
		var link = document.createElement('button');
		function saveByteArray(reportName, byteData) {
			//alert(byteData);
    		var blob = new Blob([byteData]);
    		//var link = document.createElement('button');
    		//link.setAttribute("id", "printLableID");
    		link.href = window.URL.createObjectURL(blob);
    		alert(link.href);
    		var fileName = reportName + ".pdf";
   	 		link.download = fileName;
    		link.click();
		};

		//
		$("#Confirmbtn").click(function(){
			$("#confirmation").hide();
			$("#HideConfirmBtn").hide();
			$("#shippingCheck").show();
			$(".modal-content.conFirmation").css("height" , "150px");
		});
		
		setTimeout(function() {
			fullyLoaded();
		}, 1000);
		function fullyLoaded() {
			$("#loader").fadeOut("slow");
			//$("#loader").fadeIn("slow");
		}

		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			//alert("hi");
			var input = "";
			$.each(localAddList, function(index, value) {
				if (this.id == globalAdrId) {
					//alert(globalAdrId);
					input = '{'+

						  '"fromAddress": {'+
						    '"addressLine1": "'+this.addressLine1+'",'+
						    '"city": "'+this.city+'",'+
						    '"state": "'+this.state+'",'+
						    '"zip": "'+this.zip+'",'+
						    '"phoneNumber": "'+this.phoneNumber+'"'+
						  '}}';
				}
			});
			//alert(input);
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/trendSetr/rest/stores",
				data : input,
				dataType : "json",
				success : function(data, status, xhr) {
					var storeInfo = data.LocatorResponse.SearchResults.DropLocation;
					var nearUpsStoreHtml = "";
					$.each(storeInfo,
							function(index, value) {
						//alert(this.AddressKeyFormat.AddressLine);	
						nearUpsStoreHtml = nearUpsStoreHtml + '<tr>'+
						'<td border="0"><input class="checkbox-ups-store id="changeAddress" onclick="custom_alert()" type="checkbox"> <span class="cardupstoreaddress">'+
								''+this.AddressKeyFormat.ConsigneeName+''+
								'<br> '+this.AddressKeyFormat.AddressLine+' <br> '+this.AddressKeyFormat.PoliticalDivision2+','+
								' '+this.AddressKeyFormat.PoliticalDivision1+' <br> '+this.AddressKeyFormat.CountryCode+'<br>'+
								''+this.AddressKeyFormat.PostcodePrimaryLow+'-'+this.AddressKeyFormat.PostcodeExtendedLow+''+
						'</span></td>'+
						'<td>'+this.PhoneNumber+'</td>'+
						'<td>'+this.StandardHoursOfOperation+'</td>'+

					'</tr>';
						//adding by manesh
					});
					$("#nearUpsStoreID").html(nearUpsStoreHtml);
				},
				error : function(request, status, error) {
					alert("Tax Not working Error");
				}
			});//end of ajax
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		
		
		// Get the modal
		var modal1 = document.getElementById('pickUpAddress');

		// Get the button that opens the modal
		var btn1 = document.getElementById("PickUp");

		// Get the <span> element that closes the modal
		var span1 = document.getElementsByClassName("close1")[0];

		// When the user clicks the button, open the modal 
		btn1.onclick = function() {
			createShipping();
			modal1.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span1.onclick = function() {
			modal1.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal1.style.display = "none";
			}
		}
		
		// Get the modal
		var modal2 = document.getElementById('confirmSecure');

		// Get the button that opens the modal
		var btn2 = document.getElementById("changeAddress");

		// Get the <span> element that closes the modal
		var span2 = document.getElementsByClassName("close2")[0];

		// When the user clicks the button, open the modal 
		btn2.onclick = function() {
			modal2.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span2.onclick = function() {
			modal2.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal2.style.display = "none";
			}
		}
		
		
		//function custom_alert( message, title ) {
		function custom_alert() {
		   	$("#myModal").hide();
		   	$("#confirmSecure").show();
		}
		
	</script>
</body>

</html>


