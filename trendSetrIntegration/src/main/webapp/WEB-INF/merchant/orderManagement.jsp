<!DOCTYPE html>
<html>
<title>B2B Dashboard</title>
<head>
<!-- include merchant navigation -->
<%@include file="merchantStyles.jsp"%>
<style>
.admin-header {
	background-color: black;
}

html, body {
	background-color: #DEDEDE;
}

.logo-container h1 a {
	color: white;
	text-decoration: none;
}

.mdl-layout__header .mdl-layout__drawer-button:active {
	background-color: transparent !important;
	box-shadow: none !important;
	opacity: .5;
}

.mdl-layout__header {
	background-color: transparent !important;
	box-shadow: none !important;
}

.b2b-header-margin {
	position: relative;
	top: 30px;
}

.panel-footer h5 {
	color: grey;
}

.flex-container {
	padding: 0;
	margin: 0;
	display: -webkit-box;
	display: -moz-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	justify-content: space-between;
}

.flex-item {
	
}

.setings-back-div {
	margin-bottom: 20px;
}

.table tr td, .table tr th {
	color: black;
}

.order-detail, .order-detail:hover {
	text-decoration: none;
	color: black;
	cursor: pointer;
}


</style>
</head>

<body>
	<!-- header -->
	<%@include file="merchantNavigation.jsp"%>
	<!--header -->

	<!-- user settings -->
	<input type="hidden" id="hiddenUID"
		value="<%=session.getAttribute("userId")%>">
		
	<!-- <input type="hidden" id="hdnmerchantID" value=""> -->
		
	<section class="col-sm-12 b2b-header-margin" id="order-management">
		<section class="row">
			<section class="container">
				<section class="">
					<!--  user settings menu -->
					<div class="text-center" style="font-size: 30px;">Orders</div>
					<section class="col-sm-12 pending-products-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="text-center">Pending Orders</h4>
								</div>
								<div class="panel-body text-center">
									<div class="clearfix"></div>
									<div id="PendingOrders"></div>
									<div class="col-md-9"></div>
									<div class="col-md-3">
									<!-- <button class="btn btn-default order-process" data-target=""
										data-dismiss="" id="ProcessOrder">Processing Orders</button>
										</div> -->
								</div>
							</div>
						</section>
					</section>
					<!-- ./user settings content -->
					<section class="col-sm-12 fulfilled-products-content">
						<section class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="display-time">
										<p id="demo" style="font-size: 18px;"></p>
										<script>
											var d = new Date();
											var days = [ "Sunday", "Monday",
													"Tuesday", "Wednesday",
													"Thursday", "Friday",
													"Saturday" ];
											var months = [ "January",
													"February", "March",
													"April", "May", "June",
													"July", "August",
													"September", "October",
													"November", "December" ];
											var date = d.getDate();
											var year = d.getFullYear();

											document.getElementById("demo").innerHTML = days[d
													.getDay()]
													+ ", "
													+ months[d.getMonth()]
													+ " " + date + ", " + year;
											// document.getElementById("demo").innerHTML = ;
											// document.getElementById("demo").innerHTML = days[d.getDate()];
											// document.getElementById("demo").innerHTML = days[d.getYear()];

											/* document.getElementById("today-date").innerHTML = Date();*/
										</script>
									</div>
									<h4 class="text-center pull-left">Fulfilled Orders</h4>
									<div class="text-center pull-right">
										<select name="" id="year" class="form-control"
											style="width: 100px; float: right;">
											<option value="">2017</option>
											<option value="">2016</option>
											<option value="">2015</option>
											<option value="">2014</option>
											<option value="">2013</option>
											<option value="">2012</option>
										</select> <select name="" id="month" class="form-control"
											style="width: 100px; float: right; margin-right: 5px;">
											<option value="">Jan</option>
											<option value="">Feb</option>
											<option value="">Mar</option>
											<option value="">Apr</option>
											<option value="">May</option>
											<option value="">June</option>
											<option value="">July</option>
											<option value="">Aug</option>
											<option value="">Sep</option>
											<option value="">Oct</option>
											<option value="">Nov</option>
											<option value="">Dec</option>
										</select>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="panel-body text-center">
									<div class="clearfix" id="fullFilledOrders"></div>
									<!-- <table class="table table-hover text-center">
										<thead>
											<tr>
												<th class="text-center">Product Name</th>
												<th class="text-center">Date</th>
												<th class="text-center">Price</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><a href="orderDetail.jsp" class="order-detail">Product
														Name</a></td>
												<td>Date</td>
												<td>Price</td>
											</tr>
											<tr>
												<td><a href="orderDetail.jsp" class="order-detail">Product
														Name</a></td>
												<td>Date</td>
												<td>Price</td>
											</tr>
											<tr>
												<td><a href="orderDetail.jsp" class="order-detail">Product
														Name</a></td>
												<td>Date</td>
												<td>Price</td>
											</tr>
											<tr>
												<td><a href="orderDetail.jsp" class="order-detail">Product
														Name</a></td>
												<td>Date</td>
												<td>Price</td>
											</tr>
											<tr>
												<td><a href="orderDetail.jsp" class="order-detail">Product
														Name</a></td>
												<td>Date</td>
												<td>Price</td>
											</tr>
											<tr>
												<td><a href="orderDetail.jsp" class="order-detail">Product
														Name</a></td>
												<td>Date</td>
												<td>Price</td>
											</tr>
											<tr>
												<td><a href="orderDetail.jsp" class="order-detail">Product
														Name</a></td>
												<td>Date</td>
												<td>Price</td>
											</tr>
										</tbody>
									</table> -->
								</div>
							</div>
						</section>
					</section>
					
				</section>
			</section>
		</section>
	</section>
	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="add-bank-account-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<!-- product content -->
					<div class="col-sm-12">
						<button type="button" class="close" data-dismiss="modal">X</button>
						<div class="row">
							<div class="fullwidth">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="text-center">Add Bank Account</h4>
									</div>
									<div class="panel-body text-center">
										<div class="clearfix"></div>
										<form class="form-horizontal text-center">
											<div class="form-group">
												<label for="email" class="col-sm-3 control-label">Account
													Type</label>
												<div class="col-sm-9">
													<input type="email" class="form-control" id="email"
														placeholder="Account Type">
												</div>
											</div>
											<div class="form-group">
												<label for="newpswd" class="col-sm-3 control-label">Account
													Holder's Name</label>
												<div class="col-sm-9">
													<input type="newpassword" class="form-control" id="newpswd"
														placeholder="Account Holder's Name">
												</div>
											</div>
											<div class="form-group">
												<label for="confirmpswd" class="col-sm-3 control-label">Routing
													Number</label>
												<div class="col-sm-9">
													<input type="password" class="form-control"
														id="confirmpswd" placeholder="Roting Number">
												</div>
											</div>
											<div class="form-group">
												<label for="confirmpswd" class="col-sm-3 control-label">Account
													Number</label>
												<div class="col-sm-9">
													<input type="password" class="form-control"
														id="confirmpswd" placeholder="Account Number">
												</div>
											</div>
											<div class="form-group">
												<label for="confirmpswd" class="col-sm-3 control-label">Confirm
													Account Number</label>
												<div class="col-sm-9">
													<input type="password" class="form-control"
														id="confirmpswd" placeholder="Confirm Account Number">
												</div>
											</div>
										</form>
									</div>
									<div class="panel-footer text-center">
										<h5 class="text-center">By linking your bank account,
											you're instructing TrendSetr to verify your bank account
											information with a consumer reporting agency for fraud and
											risk prevention purposes. This will not affect your credit
											score.</h5>
										<h5 class="text-center">Disclaimer</h5>
										<div class="flex-container">
											<div class="flex-item cancel">
												<a href="">Cancel</a>
											</div>
											<div class="flex-item add-bank-account-button">Add</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ./product content -->
			</div>
		</div>
	</div>
	<!-- ./user settings -->
	<div class="clearfix"></div>
	<!-- .gift -->
	<!-- JS Files -->
	<%@include file="merchantFooter.jsp"%>



	<div id="PendingOrder"></div>


	<script>
		$(document).ready(function() {
			var pendingOrderHTML = "";
			var fullfilledOrderHTML = "";
			//alert($("#hiddenUID").val());
							$.ajax({
										type : "GET",
										contentType : "application/json; charset=utf-8",
										url : "/trendSetr/rest/order/"+$("#hiddenUID").val(),
										dataType : "json",
										success : function(responseData, status) {
											if (responseData != null) {

												pendingOrderHTML = pendingOrderHTML +'<table class="table table-hover text-center">'
														+ '<thead>'
														+ '<tr>'
														+ '<th class="text-center">Product Name</th>'
														+ '<th class="text-center">Date</th>'
														+ '<th class="text-center">Price</th></tr></thead>'
														+ '<tbody>';

														fullfilledOrderHTML = pendingOrderHTML;
												$.each(responseData, function(index, value) {
													//$("#hdnmerchantID").val(this.merchantId);
													var orderID = this.id;
													var orderSt = false;
													localStorage.setItem('merchantID', this.merchantId);
													$.each(this.orderItemList, function(index, value) {
														//alert(this.orderStatus);
																	if (this.orderStatus == 2) {
																		alert(orderID);
																		pendingOrderHTML = pendingOrderHTML

																				+ '<tr onClick = findOrders(this) oId = "'+orderID+'">'
																				+ '<td style="text-transform:capitalize;">'
																				 
																				+ '&nbsp; &nbsp; <a onClick="findOrders()" class="order-detail" orderStatus = "2" orderId="'+ orderID+'">'
																				+ this.product.name 
																				//+ '<span class="glyphicon glyphicon-pencil"></span></td>'
																				+ '<td><span >'
																				+ this.createdTime
																				+ '</span></td><td><span>'
																				+ this.productPrice
																				+ '</span></a></td>'
																				+ '</tr>';
																		orderSt = true;

																	}

																	else if (this.orderStatus == 1) {

																		fullfilledOrderHTML = fullfilledOrderHTML
																		+ '<tr onClick = findOrders(this) oId = "'+orderID+'">'
																		+ '<td style="text-transform:capitalize;">'
																		+ this.product.name
																		+ '&nbsp; &nbsp; <a onClick="findOrders()" class="order-detail" orderStatus = "2" orderId="'
																		+ orderID
																		+ '<span class="glyphicon glyphicon-pencil"></span></td>'
																		+ '<td><span >'
																		+ this.createdTime
																		+ '</span></td><td><span>'
																		+ this.productPrice
																		+ '</span></a></td>'
																		+ '</tr>';
																	}

																});
													//alert(pendingOrderHTML);
													if(orderSt) {
														pendingOrderHTML = pendingOrderHTML +'<button onClick = findOrders(this) oId = "'+orderID+'" class="btn btn-default order-process" data-target="" data-dismiss="" id="ProcessOrder">Processing Orders</button></div>';
													}
												});
												

												pendingOrderHTML = pendingOrderHTML
														+ "</tbody>"
														+ "</table>";
												fullfilledOrderHTML = fullfilledOrderHTML 
																	+ "</tbody>"
																	+ "</table>";
											}
											$("#PendingOrders").html(pendingOrderHTML);
											$("#fullFilledOrders").html(fullfilledOrderHTML);
												
										},
										error : function(request, status, error) {
											//alert("request.." + request);
											//alert("status.." + status);
											alert("error.." + error);
										}
									});
						})
						
		function findOrders(fldObj){
			var orderID = $(fldObj).attr('oId');
			alert(orderID);
			window.location.href =  "/trendSetrIntegration/merchant/orderDetail.jsp?orderID="+orderID;
		}
						
	</script>
</body>

</html>
