<!DOCTYPE html>
<html>

<head>

<%@include file="merchantStyles.jsp"%>

<!-- <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Address Settings</title>
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
bootstrap
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
owl carousel
<link rel="stylesheet" href="../vendor/owl/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="../vendor/owl/assets/owl.theme.default.min.css">
animate.css
<link rel="stylesheet" href="css/animate.css">
custom styles
<link rel="stylesheet" href="../B2b/css/app.css">
 --><!--[if IE]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.panel.panel-default.childs {
	
	height: 450px;
    overflow: auto;
    padding-bottom:20px;
}

#user-cart .panel {
	border: 1px solid #ccc;
}

#user-cart .panel .panel-heading, #user-cart .panel .panel-body,
	#user-cart .panel .panel-footer {
	border-radius: 0;
}

#user-cart .cards-container {
	width: 100% !important;
	max-width: 100%;
}

#user-cart .cards-container .panel-heading, #user-cart .cards-container .panel-footer
	{
	background: #ffffff;
	height: 48px;
}

#user-cart .cards-container .badge {
	background: #2e4af9 !important;
}

#user-cart .cards-container address {
	margin-bottom: 0;
}

#user-cart .custom-container {
	display: flex;
	padding: 10px 50px;
	justify-content: space-between;
	box-sizing: border-box;
	align-items: flex-start;
}

#user-cart .custom-container .right {
	text-align: right;
}

#user-cart .custom-container .childs.orders-list-container {
	flex-grow: 5;
	order: 1;
	margin: 5px;
}

#user-cart .custom-container .childs.orders-list-container .panel-body {
	position: relative;
}

#user-cart .custom-container .childs.orders-list-container .remove-btn {
	color: #d00;
	position: absolute;
	right: 20px;
	top: 4px;
	cursor: pointer;
}

#user-cart .custom-container .childs.cart-container {
	min-width: 250px;
	flex-grow: 1;
	margin: 5px;
	order: 2;
}

#user-cart .custom-container .childs.cart-container .panel {
	border: 1px solid #ccc;
}

#user-cart .custom-container .childs.cart-container .panel .panel-heading,
	#user-cart .custom-container .childs.cart-container .panel .panel-body,
	#user-cart .custom-container .childs.cart-container .panel .panel-footer
	{
	border-radius: 0;
}

#user-cart .custom-container .childs.cart-container .panel-heading {
	background: #ffffff;
	text-align: center;
}

#user-cart .custom-container .childs.cart-container .panel-body {
	padding: 0;
}

#user-cart .custom-container .childs.cart-container .table {
	margin-top: 10px;
	margin-bottom: 0;
}

#user-cart .custom-container .childs.cart-container .table tr,
	#user-cart .custom-container .childs.cart-container .table td,
	#user-cart .custom-container .childs.cart-container .table th {
	border: none;
	padding: 0 5px;
}

#user-cart .custom-container .childs.cart-container .border {
	border-top: 1px solid #aaa !important;
}

#user-cart .custom-container .childs.cart-container .border th,
	#user-cart .custom-container .childs.cart-container .border td {
	padding: 10px;
}

#user-cart .custom-container .childs.cart-container .paybutton {
	margin: 0 auto;
	display: block;
	border-radius: 3px;
	margin-bottom: 10px;
	padding: 6px 20px;
	background: #21b878;
}

#user-cart .custom-container .childs .balance {
	font-size: 16px;
	margin-top: 3px;
	margin-bottom: 3px;
}

#user-cart .custom-container .childs .balance span {
	margin-left: 10px;
	color: #21b878;
}

#user-cart .custom-container .childs #payment-modal .panel-heading {
	background: #ffffff;
}

#user-cart .custom-container .childs #payment-modal .close-btn {
	cursor: pointer;
	font-size: 12px;
	margin: 5px;
}

#user-cart .custom-container .childs #payment-modal label {
	font-weight: normal;
	font-size: 12px;
}

#user-cart .custom-container .childs input.form-control {
	background: #f5f2f1;
}

.cards-container .card-title {
	font-size: 14px !important;
	color: #b59f98 !important;
	font-weight: normal;
	margin-bottom: 2px;
	margin-top: 2px;
}
address{
	font-size:14px;
}

@media all and (max-width: 768px) {
	#user-cart .custom-container {
		width: 100%;
		padding: 2px;
		display: block;
	}
	.right {
		text-align: center !important;
	}
}

@media all and (min-width: 1100px) {
	.cart-container {
		min-width: 300px !important;
	}
}

@media all and (min-width: 768px) and (max-width: 1200px) {
	.cart-container {
		flex-grow: 3 !important;
	}
	.custom-container {
		padding: 10px 5px !important;
	}
}

@media all and (max-width: 1200px) {
	#user-cart #payment-modal.col-sm-6 {
		width: 100%;
	}
}

.mt15 {
	margin-top: 15px;
}

.admin-header {
	background-color: black;
}

.logo-container h1 a {
	color: white;
	text-decoration: none;
}

a:hover {
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
/*   addressTab Custom css  */
.panel-heading-bg {
	padding: 10px;
	border-bottom: 1px solid #f5f5f5;
}

.mrgn-rit-10 {
	margin-right: 10px;
}

.padd-10 {
	padding: 10px;
}

.align-center {
	text-align: center;
}

.checkbox-size {
	width: 18px;
	height: 18px;
}

select.form-control.custm-bgclr {
	background: #f5f2f1;
}
.card-body{
	padding:10px;
	border-bottom: 1px solid #ddd;
}
</style>
</head>

<body>

	<input type="hidden" id="hiddenUID"
		value="<%=session.getAttribute("userId")%>">
	<!-- header -->
		<%@include file="merchantNavigation.jsp"%>
	<!--header -->
	<!--<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	 	<header class="mdl-layout__header">
			<div class="mdl-layout__header-row "
				style="background: #000000; border-bottom: solid #FFFFFF;">
				<span class="mdl-layout-title"
					style="margin-left: auto; margin-right: auto; display: block; position: absolute; width: 100%; left: 0; top: 0; text-align: center; padding-top: 25px;">TrendSetr</span>
				<div class="mdl-layout-spacer"></div>
				<nav class="mdl-navigation mdl-layout__header--transparent">
					<button id="demo-menu-lower-right"
						class="mdl-button mdl-js-button mdl-button--icon">
						<i> <a class="mdl-navigation__link" href="#"
							style="width: 32px; height: 32px; background-color: #FFFFFF;"></a></i>
					</button>
					<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu "
						for="demo-menu-lower-right" style="top: 15px">
						<li style="margin-left: 35px;">
							<div
								style="height: 100px; width: 100px; border-radius: 50%; background-color: #7D7D7D;"></div>
						</li>
						<li style="text-align: center; color: #000000; font-weight: bold;">Merchant
							Name</li>
						<li class="mdl-menu__item" style="text-align: center;">View
							TrendSetr Profile</li>
						<li class="mdl-menu__item" style="text-align: center;">Sign
							Out</li>
					</ul>
				</nav>
			</div>
		</header> 
		<div class="mdl-layout__drawer"
			style="overflow: hidden; background: rgba(0, 0, 0, 0.75); border: none;">
			<span class="mdl-layout-title" style="top: 85px; right: -25px;"><div
					style="height: 100px; width: 100px; border-radius: 50%; background-color: #7D7D7D;"></div></span>
			<span class="mdl-layout-title" style="top: 85px; color: #FFFFFF">Merchant
				Name</span>
			<nav class="mdl-navigation" style="padding-top: 86px;">
				<a class="mdl-navigation__link" href="">Dashboard</a> <a
					class="mdl-navigation__link" href="">Product Management</a> <a
					class="mdl-navigation__link" href="">Order Management</a> <a
					class="mdl-navigation__link" href="">Ad Management</a> <a
					class="mdl-navigation__link" href="">Account Settings</a>
			</nav>
		</div>
	</div>-->
	<!--header -->
	<!-- user settings -->
	<section class="col-sm-12 b2b-header-margin" id="user-cart">
		<section class="row">
			<section class="container">
				
					<!--  user settings menu -->
					<section class="col-sm-3"
						id="settings-container">
						<section class="row">
							<ul class="list-group no-border-bottom">
								<li class="list-group-item "><a
									href="./accountSettings.jsp"><i class="fa fa-user-o"></i>
										Account Information</a></li>
								<li class="list-group-item"><a href="./b2bBanking.jsp"><i
										class="fa fa-dollar"></i> Banking</a></li>
								<li class="list-group-item "><a
									href="./b2bNotifications.jsp"><i class="fa fa-book"></i>
										Notifications</a></li>
							</ul>
							<ul class="list-group no-border-top">
								<li class="list-group-item"><a href=""><i
										class="fa fa-file-o"></i> Tax Forms</a></li>
								<li class="list-group-item"><a href="./shippingSettings.jsp"><i
										class="fa fa-truck "></i> Shipping</a></li>
								<li class="list-group-item"><a href=""><i
										class="fa fa-credit-card"></i> Privacy</a></li>
										<li class="list-group-item active"><a href="./addressTab.jsp"><i
										class="fa fa-credit-card"></i> Address</a></li>
							</ul>
						</section>
					</section>
					<!-- ./ user settings menu -->
					<!-- user settings content -->
					<section class="col-sm-9 settings-content" id="balance-content">
						<section class="row">
							<div class="panel panel-default childs ">
								<div class="panel-body" id="AddDtlsShow">
									<form class="form-horizontal">
										<div class="cards-container">
											<div class="panel panel-default cards">
												<div class="panel-heading bgwhite">
												<h1 class="pull-left" style="font-size:24px; margin:0;">Shipping Address</h1>
													<!--<span class="pull-left">(Name)</span> <span class="badge pull-right">Current</span>-->
													<button
														class="pull-right btn btn-default btn-danger btn-sm"
														onclick="deleteAddList()">Delete</button>
													<span class="clearfix"></span>
												</div>
												 <div id="AddressListID"> 

												</div>
												<!--<div class="panel-footer"> <span class="pull-left">Add New Shipping Information</span> <span class="pull-right"><input type="radio" name="new_payment"></span> <span class="clearfix"></span> </div>-->
											</div>
										</div>
									</form>

								</div>

								<div class="col-sm-12" id="payment-modal">
									<div class="row ml0">
										<div id="AddAddres" style="display: none;border-bottom: 1px solid #ccc;margin-bottom: 10px;">
									 <form id="myForm" method="post" ">
											<div class="panel-body">
												<div class="col-xs-12">
													<div class="form-group">
														<label>First Name</label> <input type="text" name="name"
															id="adFName" class="form-control">
													</div>
												</div>
												<div class="col-xs-12">
													<div class="form-group">
														<label>Last Name</label> <input type="text"
															name="address_nickname" id="adLName" class="form-control">
													</div>
												</div>
												<div class="col-xs-12">
													<div class="row">
														<div class="form-group">
															<div class="col-sm-6">
																<label>Address Line 1</label> <input type="text"
																	name="address_line_1" id="adALine1"
																	class="form-control">
															</div>
															<div class="col-sm-6">
																<label>Address Line 2(Optional)</label> <input
																	type="text" name="address_line_2" id="adALine2"
																	class="form-control">
															</div>
														</div>
													</div>
												</div>
												<div class="col-xs-12">
													<div class="row">
														<div class="form-group">
															<div class="col-sm-6 mt15">
																<label>Country</label> <input type="text" name="country"
																	id="adCountry" class="form-control" readonly value="US">
															</div>
															<div class="col-sm-6 mt15">
																<label>City</label> <input type="text" name="city"
																	id="adCity" class="form-control">
															</div>
														</div>
													</div>
												</div>
												<div class="col-xs-12">
													<div class="row">
														<div class="form-group">
															<div class="col-sm-5 mt15">
																<label>State</label>
																
																	<select name="state"  required="" id="adState" class="form-control custm-bgclr">
																	<option value="sample">State</option>
															<option value="AL">Alabama</option>
															<option value="AK">Alaska</option>
															<option value="AZ">Arizona</option>
															<option value="AR">Arkansas</option>
															<option value="CA">California</option>
															<option value="CO">Colorado</option>
															<option value="CT">Connecticut</option>
															<option value="DE">Delaware</option>
															<option value="DC">District of Columbia</option>
															<option value="FL">Florida</option>
															<option value="GA">Georgia</option>
															<option value="HI">Hawaii</option>
															<option value="ID">Idaho</option>
															<option value="IL">Illinois</option>
															<option value="IN">Indiana</option>
															<option value="IA">Iowa</option>
															<option value="KS">Kansas</option>
															<option value="KY">Kentucky</option>
															<option value="LA">Louisiana</option>
															<option value="ME">Maine</option>
															<option value="MD">Maryland</option>
															<option value="MA">Massachusetts</option>
															<option value="MI">Michigan</option>
															<option value="MN">Minnesota</option>
															<option value="MS">Mississippi</option>
															<option value="MO">Missouri</option>
															<option value="MT">Montana</option>
															<option value="NE">Nebraska</option>
															<option value="NV">Nevada</option>
															<option value="NH">New Hampshire</option>
															<option value="NJ">New Jersey</option>
															<option value="NM">New Mexico</option>
															<option value="NY">New York</option>
															<option value="NC">North Carolina</option>
															<option value="ND">North Dakota</option>
															<option value="OH">Ohio</option>
															<option value="OK">Oklahoma</option>
															<option value="OR">Oregon</option>
															<option value="PA">Pennsylvania</option>
															<option value="RI">Rhode Island</option>
															<option value="SC">South Carolina</option>
															<option value="SD">South Dakota</option>
															<option value="TN">Tennessee</option>
															<option value="TX">Texas</option>
															<option value="UT">Utah</option>
															<option value="VT">Vermont</option>
															<option value="VA">Virginia</option>
															<option value="WA">Washington</option>
															<option value="WV">West Virginia</option>
															<option value="WI">Wisconsin</option>
															<option value="WY">Wyoming</option>
																	</select>																		
																
															</div>
															<div class="col-sm-2 mt15">
																<label>Zip</label> <input type="text" id="adZip"
																	name="zip" class="form-control">
															</div>
															<div class="col-sm-5 mt15">
																<label>Phone Number (optional)</label> <input
																	type="text" id="adPhNumber" name="phone"
																	class="form-control">
															</div>
														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="col-xs-12 mt15">
														<button type="button" id="AddressDtls"
															class="btn btn-primary pull-right"
															onclick="SaveAddressDetails()">Save</button>
														<button type="button" onclick="myFunction()"
															class="btn btn-danger pull-right mrgn-rit-10">Reset</button>
													 <!-- <input type="button" onclick="myFunction()" value="Reset form"> -->
													</div>
												</div>
												<div class="clearfix"></div>
											</div>
											</form> 
										</div>
									</div>
								</div>
								<div class="align-center">
									<a href="#myModal" class="btn btn-primary btn-sm"
										data-toggle="modal" id="AddAnthrAddress">Add New Address </a>
								</div>
							</div>
						</section>
					</section>
					<!-- ./user settings content -->
				
			</section>
		</section>
	</section>
	<!-- ./user settings -->
	<div class="clearfix"></div>
	<!-- .gift -->
	
	<!-- JS Files -->
	<%@include file="merchantFooter.jsp"%>
	
	
	<!-- <script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	Material desig nscript
	<script
		src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
	owl carousel
	<script src="../vendor/owl/owl.carousel.min.js"></script>
	wow
	<script src="../js/wow.min.js"></script>
	<script src="../js/app.js"></script> -->
	<script>
	function myFunction() {
	    document.getElementById("myForm").reset();
	}
        $(document).ready(function () {
            $("#AddAnthrAddress").click(function () {
                $("#AddAddres").show();
            });
            $("#AddressDtls").click(function () {
                $("#AddDtlsShow").show();
                $("#AddAddres").hide();
            });
            
            getAddressList();
        });
        
        function SaveAddressDetails(){
        	//alert($('#adState :selected').val());
        	var input = '{';
        	input = input + '"firstName": "' + $("#adFName").val() + '",'
					+ '"lastName": "' + $("#adLName").val() + '",'
					+ '"addressLine1": "' + $("#adALine1").val() + '",'
					+ '"addressLine2": "' + $("#adALine2").val() + '",'
					+ '"country": "' + $("#adCountry").val() + '",'
					+ '"city": "' + $("#adCity").val() + '",'
					+ '"state": "'
					+$('#adState :selected').val()  + '",'
					+ '"zip": "' + $("#adZip").val() + '",'
					+ '"phoneNumber": "' + $("#adPhNumber").val() + '",'
					+ '"status": "1",'
					+ '"userId": "' + $("#hiddenUID").val() + '"';
        	input = input + '}';
			alert(input);
			
  
        	$.ajax({
				type : "POST",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/addresses",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					getAddressList();
				},
				error : function(request, status, error) {
					alert("Error");
					//document.addproduct.action = "./productManagement.jsp"
					//document.addproduct.submit();

				} 
			});
        	
        	$("#myForm").trigger("reset");
        	
        }
        
        function getAddressList(){
    		var userId = $("#hiddenUID").val();
    		$.ajax({
				type : "GET",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/addresses/address/"+userId,
				dataType : "json",
				success : function(responseData, status) {
					var addressListHtml = "";
					$.each(responseData, function(index, value) {
						addressListHtml = addressListHtml + '<div class="card-body">'
									  + '<span class="pull-left" style="width:198px;">'
                    				  + '<address >'
                        			  + this.firstName+' '+this.lastName+' '
                        			  + '<br> '+this.addressLine1;
                        			  
										if (this.addressLine2 != null && this.addressLine2 != ""){
											addressListHtml = addressListHtml + ','
										+ this.addressLine2
										}
										addressListHtml = addressListHtml + '<br>'
                        			  +this.city+', '+this.state+' #'+this.zip+''
                        			  + '<br> '+this.country+''
                        			  + '</address>'
									  +'</span>'
									  + '<span class="pull-left">'
                        			  + '<address>'
                        			  + '<h1 class="card-title">TELEPHONE</h1> '+this.phoneNumber+''
                        			  + '<br>'
                        			  + '</address>'
                        			  + '</span>'
                        			  + '<span class="pull-right"><input type="checkbox" addId="'+this.id+'" name="new_payment'+this.id+'" class="checkbox-size"></span>'
                        			  + '</div>';
					});
					
					$("#AddressListID").html(addressListHtml);
					

				},
				error : function(request, status, error) {
					alert("Error");

				}
			});
    	}
        
        function deleteAddList(){
			var deleteIdList = "";
			$('#AddressListID input:checked').each(function() {
			    deleteIdList = deleteIdList + $(this).attr('addId') + ',';
			});
			
			deleteIdList = deleteIdList.slice(0, -1);
			alert("/trendSetr/rest/addresses/address/deleteList/"+deleteIdList);
			
			$.ajax({
				type : "GET",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/addresses/address/deleteList/"+deleteIdList,
				dataType : "json",
				success : function(responseData, status) {
					getAddressList();

				},
				error : function(request, status, error) {
					//alert("Error");
					getAddressList();

				}
			});
		}
    </script>
</body>

</html>