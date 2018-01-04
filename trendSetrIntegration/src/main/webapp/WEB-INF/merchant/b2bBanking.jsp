<!DOCTYPE html>
<html>
<title>B2B Banking</title>
<head>
<!-- Include Merchant Navigation -->
<%@include file="merchantStyles.jsp"%>


<style>
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

.panel-footer h5 {
	color: grey;
}

.flex-container {
	padding: 0;
	margin: 0;
	display: flex;
	justify-content: space-between;
}

.flex-item {
	
}

.btn .btn-sample {
	background-color: #315CF2;
	color: white;
}

.list-group-item a {
	color: black;
}

.list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover
	{
	text-shadow: none;
	color: white;
}

.setings-back-div {
	margin-bottom: 20px;
}

#add-bank-account-modal .modal-dialog {
	width: 600px;
}
</style>
</head>

<body>
	<%@include file="merchantNavigation.jsp"%>
	<!-- user settings -->
	<input type="hidden" id="hiddenUID"
		value="<%=session.getAttribute("userId")%>">
	<section class="col-sm-12 b2b-header-margin" id="b2b-banking">
		<section class="row">
			<section class="container">

				<!--  user settings menu -->
				<!-- <div class="setings-back-div">
					<div class="pull-left">Settings</div>
					<button class="btn btn-primary pull-right back-button"
						style="font-size: 18px; padding: 5px 35px 5px 35px;">Back</button>
					<div class="clearfix"></div>
				</div> -->
				<section class="col-sm-3" id="settings-container">
					<section class="row">
						<ul class="list-group no-border-bottom">
							<li class="list-group-item"><a
								href="./accountSettings.jsp"><i
									class="fa fa-user-o"></i> Account Information</a></li>
							<li class="list-group-item active"><a
								href="./b2bBanking.jsp"><i
									class="fa fa-dollar"></i> Banking</a></li>
							<li class="list-group-item"><a
								href="./b2bNotifications.jsp"><i
									class="fa fa-book"></i> Notifications</a></li>
						</ul>
						<ul class="list-group no-border-top">
							<li class="list-group-item"><a href=""><i
									class="fa fa-file-o"></i> Tax Forms</a></li>
							<li class="list-group-item"><a href=""><i
									class="fa fa-truck"></i> Shipping</a></li>
							<li class="list-group-item"><a href=""><i
									class="fa fa-credit-card"></i> Privacy</a></li>
						</ul>
					</section>
				</section>
				<!-- ./ user settings menu -->
				<!-- user settings content -->
				<section class="col-sm-9 settings-content" id="balance-content">
					<section class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="text-center">Disclaimer</h4>
								<button class="btn btn-primary" data-toggle="modal"
									onClick="clearForm()" data-target="#add-bank-account-modal"
									style="float: right; margin-top: -35px;">Add Bank
									Account</button>


							</div>
							<div class="panel-body text-center">
								<div class="clearfix"></div>
								<form class="form-horizontal text-center">
									<div class="form-group">
										<table class="table table-hover text-center">
											<thead>
												<tr>
													<th class="text-center">Bank Name</th>
													<th class="text-center">Bank Account</th>
													<th class="text-center">Verification Status</th>
													<th class="text-center">Edit</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Bank Name</td>
													<td>***********2133</td>
													<td>Approved</td>
													<td><a href=""><span
															class="glyphicon glyphicon-pencil"></span></a></td>
												</tr>
												<tr>
													<td>Bank Name</td>
													<td>***********2133</td>
													<td>Approved</td>
													<td><a href=""><span
															class="glyphicon glyphicon-pencil"></span></a></td>
												</tr>
												<tr>
													<td>Bank Name</td>
													<td>***********2133</td>
													<td>Approved</td>
													<td><a href=""><span
															class="glyphicon glyphicon-pencil"></span></a></td>
												</tr>
												<tr>
													<td>Bank Name</td>
													<td>***********2133</td>
													<td>Approved</td>
													<td><a href=""><span
															class="glyphicon glyphicon-pencil"></span></a></td>
												</tr>
											</tbody>
										</table>
									</div>
								</form>
							</div>
						</div>
					</section>
				</section>
				<!-- ./user settings content -->
			</section>
		</section>
	</section>

	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="add-bank-account-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<!-- product content -->
					<div class="">
						<button type="button" class="close" data-dismiss="modal">X</button>
						<div class="">
							<div class="">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="text-center">Add Bank Account</h4>
									</div>
									<div class="panel-body text-center">
										<div class="clearfix"></div>
										<form class="form-horizontal text-center"
											name="addbankaccountform">
											<div class="form-group">
												<label for="bankname" class="col-sm-4 control-label">Bank
													Name </label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="bankname"
														id="bankname" placeholder="Bank Name">
												</div>
											</div>

											<div class="form-group">
												<label for="accounttype" class="col-sm-4 control-label">Account
													Type</label>
												<div class="col-sm-8">
													<select name="accounttype" id="accounttype"
														class="form-control" required>
														<option value="">Select Account Type</option>
														<option value="1">Checking</option>
														<option value="2">Savings</option>

													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="name" class="col-sm-4 control-label">Account
													Holder's Name</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="name"
														id="name" placeholder="Account Holder's Name">
												</div>
											</div>
											<div class="form-group">
												<label for="routingnumber" class="col-sm-4 control-label">Routing
													Number</label>
												<div class="col-sm-8">
													<input type="text" class="form-control"
														name="routingnumber" id="routingnumber"
														placeholder="Roting Number">
												</div>
											</div>
											<div class="form-group">
												<label for="accountnumber" class="col-sm-4 control-label">Account
													Number</label>
												<div class="col-sm-8">
													<input type="text" class="form-control"
														name="accountnumber" id="accountnumber"
														placeholder="Account Number">
												</div>
											</div>
											<div class="form-group">
												<label for="confirmaccountnumber"
													class="col-sm-4 control-label">Confirm Account
													Number</label>
												<div class="col-sm-8">
													<input type="text" class="form-control"
														name="confirmaccountnumber" id="confirmaccountnumber"
														placeholder="Confirm Account Number">
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="modal-footer text-center">
									<h5 class="text-center">By linking your bank account,
										you're instructing TrendSetr to verify your bank account
										information with a consumer reporting agency for fraud and
										risk prevention purposes. This will not affect your credit
										score.</h5>
									<h5 class="text-center">Disclaimer</h5>
									<div class="cancel-add-buttons-div">
										<button onClick="clearForm()"
											class="btn btn-danger pull-left cancel-button">Cancel</button>
										<button onClick="myFunction()"
											class="btn btn-primary pull-right add-bank-account-button">Add</button>
										<div class="clearfix"></div>
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




	<!-- ./user settings -->
	<div class="clearfix"></div>
	<!-- Include JS Files -->
	<%@include file="merchantFooter.jsp"%>
	<!-- ./Include JS Files -->
	
	<script>
		function myFunction() {
			var pass1 = document.getElementById("accountnumber").value;
			var pass2 = document.getElementById("confirmaccountnumber").value;
			if (pass1 != pass2) {
				alert("Account numbers Do not match");
				document.getElementById("accountnumber").style.borderColor = "#E34234";
				document.getElementById("confirmaccountnumber").style.borderColor = "#E34234";
				
			} else {
				alert("Account numbers Match!!!");
				addBankAccount();
			}
		}
	</script>
	<script type="text/javascript">
		function clearForm() {
			$('#bankname').val("");
			$('#accounttype').val("");
			$('#name').val("");
			$('#routingnumber').val("");
			$('#accountnumber').val("");
			$('#confirmaccountnumber').val("");
		}

		$(document).ready(function() {
			//alert("Test");
			/* alert($("#hiddenUID").val()); */

		});

		function addBankAccount() {
			alert("Add Account");

			var input = JSON.stringify({
				"userId" : $('#hiddenUID').val(),
				"bankName" : $('#bankname').val(),
				"defaultAccount" : $('#accounttype').val(),
				"name" : $('#name').val(),
				"routingNumber" : $('#routingnumber').val(),
				"accountNumber" : $('#accountnumber').val()

			});
			console.log(input);
			alert(input);

			$
					.ajax({
						type : "POST",
						contentType : "application/json; charset=utf-8",
						url : "/trendSetr/rest/bankaccounts",
						data : input,
						dataType : "json",
						success : function(responseData, status) {
							alert("Bank Acc insert successfully");
							document.addbankaccountform.action = "../merchant/b2bBanking.jsp"
							document.addbankaccountform.submit();
						},
						error : function(request, status, error) {
							alert(status);
							alert("Error");

						}
					});
		}
	</script>

</body>

</html>




