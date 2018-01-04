
$(document).ready(function() {
$.ajax({
	type : "GET",
	contentType : "application/json; charset=utf-8",
	url : "/trendSetr/rest/user/3",
	dataType : "json",
	success : function(responseData, status) {
		console.log(responseData);
		if (responseData != null) {
			var pendingMerchantHTML = "";
			var registerMerchantHTML = "";
			var pCount = 0, rCount = 0;
			var pendingMerchantHTML = pendingMerchantHTML
					+ '<table class="table table-hover text-center">'
					+ '<thead>'
					+ '<tr>'
					+ '<th class="text-center">Merchant Name</th>'
					+ '<th class="text-center"><span>Employee Name </span>&nbsp;<span>DateCreated</span></th></thead>'
					+ '<tbody>';

			registerMerchantHTML = pendingMerchantHTML;

			$.each(responseData,function(index,value) {
				if (this.status == 2) {
					pendingMerchantHTML = pendingMerchantHTML
							+ '<tr>'
							+ '<td>'
							+ this.firstName
							+ ' &nbsp; &nbsp; <a onClick="findMerchant(this)" merchnatStatus = "2" merchantId="'
							+ this.userId
							+ '" data-toggle="modal" data-target="#edit-merchant-modal"><span class="glyphicon glyphicon-pencil"></span></a></td>'
							+ '<td><span >'
							+ this.createdBy
							+ '</span>&nbsp;<span>'
							+ "   "
							+ this.createdTime
							+ '</span></td>'
							+ '<td><span >'
							+ '<a href="#" onclick="updateMerchant(this, true)" merchantId="'
							+ this.userId
							+ '">Make Registered <i class="fa fa-registered" aria-hidden="true"></i></a>'
							+ '</span></td>'
							+ '</tr>'
					pCount++;
				} else if (this.status == 1) {
					registerMerchantHTML = registerMerchantHTML
							+ '<tr>'
							+ '<td>'
							+ this.firstName
							+ '&nbsp; &nbsp; <a onClick="findMerchant(this)" merchnatStatus = "1" merchantId="'
							+ this.userId
							+ '" data-toggle="modal" data-target="#edit-merchant-modal"><span class="glyphicon glyphicon-pencil"></span></a></td>'
							+ '<td><span>'
							+ this.createdBy
							+ '</span>&nbsp;<span>'
							+ "   "
							+ this.createdTime
							+ '</span></td>'
							+ '</tr>'
					rCount++;
				}

			});
				pendingMerchantHTML = pendingMerchantHTML
						+ "</tbody>"
						+ "</table>";
				registerMerchantHTML = registerMerchantHTML
						+ "</tbody>"
						+ "</table>";
				$("#PendingMerchants").html(
						pendingMerchantHTML);
				$("#RegisteredMerchants").html(
						registerMerchantHTML);
				$("#PendingCountID").html(
						pCount);
				$("#RegisteredCountID").html(
						rCount);
				$("#PendingCountID1").html(
						pCount);
				$("#RegisteredCountID1").html(
						rCount);
			}
		},
		error : function(request, status, error) {
			alert("request.." + request);
			alert("status.." + status);
			alert("error.." + error);
		}
	});
});

		function findMerchant(fldObj, callback) {
			var merchantId = $(fldObj).attr("merchantId");
			var merchantStatus = $(fldObj).attr("merchnatStatus");
			$.ajax({
				type : "GET",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/user/merchant/" + merchantId,
				dataType : "json",
				success : function(responseData, status) {

					$("#fullname2").val(
							responseData.firstName + " "
									+ responseData.lastName);
					$("#email2").val(responseData.email);
					$("#phonenumber2").val(responseData.phoneNumber);
					$("#username").val(responseData.userId);
					$("#dob2").val(responseData.dateOfBirth);
					$("#address2").val(responseData.address.addressLine1);
					$("#city2").val(responseData.address.city);
					$("#country2").val(responseData.address.country);
					$("#state2").val(responseData.address.state);
					$("#zip2").val(responseData.address.zip);
					$("#storename2").val(responseData.profile.storeName);
					$("#hdnMerchantStatus").val(merchantStatus);
					if (callback) {
						callback();
					}
				},
				error : function(request, status, error) {
					alert("request.." + request);
					alert("status.." + status);
					alert("error.." + error);
				}
			});
		}

		function updateMerchant(fldObj, makeRegistered, makeDisabled) {
			/* alert($('#email2').val()); */
			var empname = $("#fullname2").val();
			debugger;
			var callback = function() {
				var flName = empname.split(" ");
				var st = makeRegistered ? "1" : $("#hdnMerchantStatus").val();
				st = makeDisabled ? "3" : st;

				var input = JSON.stringify({
					"firstName" : flName[0],
					"lastName" : flName[1],
					"userId" : $('#email2').val(),
					"dateOfBirth" : $('#dob2').val(),
					"roleId" : $('#userRoleId').val(),
					"phoneNumber" : $('#phonenumber2').val(),
					"email" : $('#email2').val(),
					"status" : st,
					"profile" : {
						"userId" : flName[0] + flName[1],
						"storeName" : $('#storename2').val(),
						"createdBy" : $("#loginUser").html().trim()
					},
					"address" : {
						"firstName" : flName[0],
						"lastName" : flName[1],
						"addressLine1" : $('#address2').val(),
						"city" : $('#city2').val(),
						"state" : $('#state2').val(),
						"zip" : $('#zip2').val(),
						"country" : $('#country2').val(),
						"phoneNumber" : $('#phonenumber2').val(),
						"status" : "st",
						"createdBy" : $("#loginUser").html().trim()
					},
					"createdBy" : $("#loginUser").html().trim()
				});

				$.ajax({
					type : "PUT",
					contentType : "application/json; charset=utf-8",
					url : "/trendSetr/rest/user",
					data : input,
					dataType : "json",
					success : function(responseData, status) {
						alert("Merchant updated Successfully!");
						location.reload();
						$("#editmerchant")[0].reset();
						$("#edit-merchant-modal").hide();
					},
					error : function(request, status, error) {
						/* alert("Error"); */
					}
				});
			}

			if (fldObj) {
				findMerchant(fldObj, callback);
			} else {
				callback();
			}

		}

		function addMerchant(merchantStatus) {
			var st = "";
			if (merchantStatus == 'ADDMERCHANT')
				st = "1";
			else
				st = "2";

			var input = JSON.stringify({
				"firstName" : $('#firstname').val(),
				"lastName" : $('#lastname').val(),
				"userId" : $('#email').val(),
				"roleId" : $('#userRoleId').val(),
				"dateOfBirth" : $('#dob').val(),
				"phoneNumber" : $('#phonenumber').val(),
				"email" : $('#email').val(),
				"status" : st,
				"profile" : {
					"userId" : $('#email').val(),
					"storeName" : $('#storename').val(),
					"createdBy" : $("#loginUser").html()
				},
				"address" : {
					"firstName" : $('#firstname').val(),
					"lastName" : $('#lastname').val(),
					"addressLine1" : $('#address').val(),
					"city" : $('#city').val(),
					"state" : $('#state').val(),
					"zip" : $('#zip').val(),
					"country" : $('#country').val(),
					"phoneNumber" : $('#phonenumber').val(),
					"status" : "1",
					"createdBy" : $("#loginUser").html()
				},
				"password" : "MERCHANT",
				"createdBy" : $("#loginUser").html()
			});
			/* alert(input); */
			console.log(input);
			$.ajax({
				type : "POST",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/user",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					/*
					 * document.addmerchant.action = "./admin/merchantSales.jsp"
					 * document.addmerchant.submit();
					 */
					$("#addmerchant")[0].reset();
					$("#add-merchant-modal").hide();
				},
				error : function(request, status, error) {
					alert("Error");
					$("#addmerchant")[0].reset();
					$("#add-merchant-modal").hide();
				}
			});
		}
		$('.upload-image').on('click', function(e) {
			e.preventDefault();
			$('.image-browse').trigger('click');
		});

		//only for debugging

		$('input[type=file]').on('change', function(e) {
			var file = e.target.files[0];
			var filePath = URL.createObjectURL(file);

			$('.upload-image .text').hide();
			$('.upload-image img').removeClass('hide');
			$('.upload-image img').attr('src', filePath).css({
				'width' : '100%'

			});
		});