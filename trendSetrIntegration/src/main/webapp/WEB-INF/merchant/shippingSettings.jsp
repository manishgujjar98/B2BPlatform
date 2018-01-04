<!DOCTYPE html>
<html>

<head>

	<%@include file="merchantStyles.jsp"%>

   <!--  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Shipping Settings</title>
    <link rel="shortcut icon" href="">
    Material design icons
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.4/material.red-purple.min.css">
    <link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.indigo-pink.min.css" />
    Material design fonts
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
    bootstrap
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    custom styles
    <link rel="stylesheet" href="css/app.css"> -->
    <!--[if IE]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    <style>
    .admin-header {
        background-color: black;
    }
        .mycheckbox{
  margin-top:5px;
  margin-left:5px;
}

    .btn span.glyphicon {    			
	opacity: 0;				
}
.btn.active span.glyphicon {				
	opacity: 1;				
}
    .logo-container h1 a {
        color: white;
        text-decoration: none;
    }
    a:hover{
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
    
    .b2b-header-margin{
        position: relative;
        top: 30px;
    }
        
/*custom css */       
        /* 
.table-borderless > tbody > tr > td,
.table-borderless > tbody > tr > th,
.table-borderless > tfoot > tr > td,
.table-borderless > tfoot > tr > th,
.table-borderless > thead > tr > td,
.table-borderless > thead > tr > th {
border: none;
}
.table-hover>tbody>tr:hover{
background-color: #fff;
} */


span.glyphicon.glyphicon-trash{
margin-top:10px;}
        .add-btn{
     border: 1px solid #337ab7;
    border-radius: 100%;
    padding: 5px;
    background: #337ab7;
    color: #fff !important;
    cursor: pointer;
    font-size: 18px;
        }
.mycheckboxdiv{
text-align:right;
display: inline-block;
    
}
        .padd-10{
            padding: 10px;
        }
        .padd-right-10{
            padding-right: 10px;
        }
        .padd-left-10{
            padding-left: 10px;
        }
        .padd-top-15{
            padding-top: 15px;
        }
        
        .form-control-cus{
        height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        }
        .checkbox input[type=checkbox], .checkbox-inline input[type=checkbox], .radio input[type=radio], .radio-inline input[type=radio]{
                margin-left: 0px;
        }
        
        /*custom css */
        
        
        
    </style>
</head>

<body>
    <!-- header -->
    
    <%@include file="merchantNavigation.jsp"%>
    
    <input type="hidden" id="hiddenUID"
		value="<%=session.getAttribute("userId")%>">
    <!-- <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        <header class="mdl-layout__header">
            <div class="mdl-layout__header-row " style="background:#000000; border-bottom:  solid #FFFFFF;">
                <span class="mdl-layout-title" style=" margin-left:auto; margin-right:auto; display:block; position: absolute;
    width: 100%; left: 0; top: 0;text-align: center; padding-top:25px;">TrendSetr</span>
                <div class="mdl-layout-spacer"></div>
                <nav class="mdl-navigation mdl-layout__header--transparent">
                    <button id="demo-menu-lower-right" class="mdl-button mdl-js-button mdl-button--icon">
                        <i> <a class="mdl-navigation__link" href="#" style=" width:32px; height:32px; background-color:#FFFFFF;"></a></i>
                    </button>
                    <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu " for="demo-menu-lower-right" style="top:15px">
                        <li style=" margin-left:35px;">
                            <div style=" height: 100px; width: 100px; border-radius: 50%; 
  background-color: #7D7D7D; "></div>
                        </li>
                        <li style="text-align:center; color:#000000; font-weight: bold;">Merchant Name</li>
                        <li class="mdl-menu__item" style="text-align:center;">View TrendSetr Profile</li>
                        <li class="mdl-menu__item" style="text-align:center;">Sign Out</li>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="mdl-layout__drawer" style="overflow:hidden; background:rgba(0, 0, 0, 0.75); border:none; ">
            <span class="mdl-layout-title" style=" top:85px; right:-25px;"><div style=" height: 100px;
  width: 100px;
  border-radius: 50%; 
  background-color: #7D7D7D; "></div></span>
            <span class="mdl-layout-title" style="top:85px; color:#FFFFFF">Merchant Name</span>
            <nav class="mdl-navigation" style="padding-top: 86px;">
                <a class="mdl-navigation__link" href="">Dashboard</a>
                <a class="mdl-navigation__link" href="">Product Management</a>
                <a class="mdl-navigation__link" href="">Order Management</a>
                <a class="mdl-navigation__link" href="">Ad Management</a>
                <a class="mdl-navigation__link" href="">Account Settings</a>
            </nav>
        </div>
    </div> -->
    <!--header -->
    <!-- user settings -->
    <section class="col-sm-12 b2b-header-margin" id="b2b-notifications">
        <section class="row">
            <section class="container">
                <section class="">
                    <!--  user settings menu -->
                    <section class="col-sm-3" id="settings-container">
                        <section class="row">
                           <!--  <ul class="list-group no-border-bottom">
                                <li class="list-group-item"><a href="#"><i class="f12 fa-user-o"></i> Account Information</a></li>
                                <li class="list-group-item"><a href=""><i class="fa fa-dollar"></i> Banking</a></li>
                                <li class="list-group-item"><a href=""><i class="fa fa-book"></i> Notifications</a></li>
                            </ul>
                            <ul class="list-group no-border-top">
                                <li class="list-group-item"><a href=""><i class="fa fa-file-o"></i> Tax Forms</a></li>
                                <li class="list-group-item active"><a href=""><i class="fa fa-truck"></i> Shipping</a></li>
                                <li class="list-group-item"><a href=""><i class="fa fa-credit-card"></i> Privacy</a></li>
                                
                            </ul> -->
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
								<li class="list-group-item active"><a href="./shippingSettings.jsp"><i
										class="fa fa-truck "></i> Shipping</a></li>
								<li class="list-group-item"><a href=""><i
										class="fa fa-credit-card"></i> Privacy</a></li>
										<li class="list-group-item"><a href="./addressTab.jsp"><i
										class="fa fa-credit-card"></i> Address</a></li>
							</ul>
                        </section>
                    </section>
                    <!-- ./ user settings menu -->
                    <!-- user settings content -->
                    <section class="col-sm-9 settings-content" id="balance-content">
                        <section class="row">
                            <div class="panel panel-default">
                                <div class="panel padd-left-10">
                                    <h4 class="pull-left">Shipping</h4>
                                    
                                    <span class="clearfix"></span>
                                </div>
                                <div class="text-center">
                                    <div class="table-responsive" id="shippingDivID">
                                        <table  class="variant-table table table-hover text-center table-borderless" id="variant-table">
                                            <thead>
                                                <tr >
                                                    <th>Box Title</th>
                                                    <th>Lengths</th>
                                                    <th>width</th>
                                                    <th>Height</th>
                                                    
                                                </tr>
                                            </thead>
                                           <tbody id="shippingbodyId">
                                                <tr id="variantrow1">
                                                    <td border="none">
                                                        <input type="text" class="form-control" id="title1" placeholder="Enter Title" required="">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" id="lenght1" placeholder="Enter Lenght" required="">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" id="width1" placeholder="Enter Width" required="">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" id="height1" placeholder="Enter Height" required="">
                                                    </td>
                                                    <td>
														<button id="variantrow1" onclick="variantDelete(this)">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</td>
                                                    <!--<td align="middle" class="padd-top-15" style="padding-top: 15px;">
                                                        <a class="add-btn" onclick="myFunction()" class="add-row"> + </a>
                                                    </td>-->
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="6" align="middle">
                                                       <a class="add-btn" onclick="myFunction(this)" id="addrow1" class="add-row"> + </a>
                                                    </td>
                                                </tr>

                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                                <div class="panel padd-left-10">
                                    <h4 class="pull-left">Pay Options</h4>
                                    
                                    <span class="clearfix"></span>
                                </div>
                              <div class="form-group ">
                                   
                                   <label class="radio-inline padd-10">
                                   <input type="radio" name="radioGroup" id="radio1" value="option1"> 1
                                       <span class="padd-right-10"> &nbsp; &nbsp; All Merchant </span>
                                      </label>
                                    <label class="radio-inline padd-10">
                                    <input type="radio" name="radioGroup" id="radio2" value="option2"> 2
                                    
                                        <span class="padd-right-10"> &nbsp; &nbsp;  All Customer </span>
                                     </label>
                                    <label class="radio-inline padd-10">
                                     <input type="radio" name="radioGroup" id="radio3" value="option3"> 3
                                        <span class="padd-right-10"> &nbsp; &nbsp;  50/50 </span>
                                    </label>
                                    <label>
                                       <span class="padd-right-10"> Custom </span>
                                        <input type="text" class="form-control-cus" id="customPay" placeholder="Enter Custom amount" value="Enter Custom amount" required="">
                                   </label>
                                   <button type="button" class="btn btn-primary pull-right" onclick="updateMSDetails()" style="margin-right:10px; margin-top:20px;">Save</button>
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
    
    <!-- JS Files -->
	<%@include file="merchantFooter.jsp"%>
	
	
    <!-- <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    Material desig nscript
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
    owl carousel
    <script src="vendor/owl/owl.carousel.min.js"></script>
    wow
    <script src="js/wow.min.js"></script>
    <script src="js/app.js"></script> -->
     <script>
     function myFunction(fldObj) {
			var rowCount = $(fldObj).attr('id');
			rowCount = rowCount.replace(/[A-Za-z$-]/g, "");
			rowCount = parseInt(rowCount);
			var maxRowNum = [];

			var gtinVals = $("#shippingDivID").find("tr");
			console.log(gtinVals);
			$.each(gtinVals, function(index, obj) {
				var rowIdVal = $(obj).attr('id');
				if (rowIdVal != undefined) {
					rowIdVal = rowIdVal.replace(/[A-Za-z$-]/g, "");
					rowIdVal = parseInt(rowIdVal);
					maxRowNum.push(rowIdVal);
				}
			});

			var gtinRows = Math.max.apply(Math, maxRowNum);
			gtinRows = gtinRows + 1;
			var gnitTable = "";
			gnitTable = gnitTable
					+ +'<tr id="variantrow'+gtinRows+'">'
					+ '<tr id="variantrow'+gtinRows+'">'
					/* + '<td><input type="checkbox" class="form-control" name="sale" id="sale'+gtinRows+'"></td>' */
					+ '<td><input type="text" class="form-control" id="title'+gtinRows+'" placeholder="Enter Title" required=""></td>'
					+ '<td><input type="text" class="form-control" id="lenght'+gtinRows+'" placeholder="Enter Lenght" required=""></td>'
					+ '<td><input type="text" class="form-control" id="width'+gtinRows+'" placeholder="Enter Width" required=""></td>'
					+ '<td><input type="text" class="form-control" id="height'+gtinRows+'" placeholder="Enter Height" required=""> </td>'
					+ '<td> <button id = "variantrow'
					+ gtinRows
					+ '" onclick="variantDelete(this)"> <span class="glyphicon glyphicon-trash"></span> </button> </td> </tr>';
			$('#shippingbodyId tr:last').after(gnitTable);

		}
     
     function variantDelete(fldObj) {
			var rowId = $(fldObj).attr('id');
			$("#" + rowId).remove();
		}
     
     function SaveAddressDetails(){
    	 var gtinVals = $("#shippingbodyId").find("tr");
			var variants = "";
			$.each(gtinVals, function(index, obj) {
				var rowIdVal = $(obj).attr('id');
				if (rowIdVal != undefined) {
					var subgtinVals = $("#" + rowIdVal).find(
							"input[type='text']");
					var variant = '{';
					$.each(subgtinVals, function(index, subobj) {
						var textboxID = $(subobj).attr('id');
						//alert($("#"+textboxID).val());

						if (textboxID.startsWith("title"))
							variant = variant + '"title": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("lenght"))
							variant = variant + '"lenght": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("width"))
							variant = variant + '"width": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("height"))
							variant = variant + '"height": "'
									+ $("#" + textboxID).val() + '"';

					});//removeStock

					if (index + 1 == gtinVals.length)
						variant = variant + '}';
					else
						variant = variant + '},';
					variants = variants + variant;
				}
			});
    	 alert(variants);
    	 
    	 var input = '{';

			input = input + '"userId": "' + $("#hiddenUID").val() + '",'
					+ '"shipping": [' + variants + ']';
			input = input + '}';
			
			alert(input);
			
			$.ajax({
				type : "POST",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/shipping/addMerchantShippingDetails",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					getmsDetails();
				},
				error : function(request, status, error) {
					getmsDetails();

				}
			});
     }
     
     $(document).ready( function() {
    	 getmsDetails();	
	 });
     
     function getmsDetails(){
    	 alert($("#hiddenUID").val());
    	 $('#shippingbodyId').empty();
			$('#shippingbodyId').append("<tr id='samplrTrID'></tr>");
    	 $.ajax({
				type : "GET",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/shipping/"
						+ $("#hiddenUID").val(),
				dataType : "json",
				success : function(responseData, status) {
					//	console.log(responseData);
					//console.log("response Data Check!")
					if (responseData != null) {
						if(responseData.merchantPercent == 100){
							$("#radio1").attr('checked', 'checked');
							$("#radio2").prop('checked', false);
							$("#radio3").prop('checked', false);
							$("#customPay").val("");
						} else if(responseData.merchantPercent == 0){
							$("#radio2").attr('checked', 'checked');
							$("#radio1").prop('checked', false);
							$("#radio3").prop('checked', false);
							$("#customPay").val("");
						} else if(responseData.merchantPercent == 50){
							$("#radio3").attr('checked', 'checked');
							$("#radio1").prop('checked', false);
							$("#radio2").prop('checked', false);
							$("#customPay").val("");
						} else {
							alert("hi");
							$("#radio3").prop('checked', false);
							$("#radio1").prop('checked', false);
							$("#radio2").prop('checked', false);
							$("#customPay").val(responseData.merchantPercent);
						}
						
						
						var gtinRows = 0;
						$
								.each(
										responseData.shipping,
										function(index,
												value) {
											var gnitTable = "";

											gnitTable = gnitTable
													+ +'<tr id="'+this.id+'">'
													+ '<tr id="'+this.id+'">'
													+ '<td><input type="text" class="form-control" name="title" id="title'+this.id+'" placeholder="Enter Title" value="'+this.title+'" required=""></td>'
													+ '<td><input type="text" class="form-control" name="title" id="lenght'+this.id+'" placeholder="Enter Length" value="'+this.lenght+'" required=""></td>'
													+ '<td><input type="text" class="form-control" name="title" id="width'+this.id+'" placeholder="Enter width" value="'+this.width+'" required=""></td>'
													+ '<td><input type="text" class="form-control" name="title" id="height'+this.id+'" placeholder="Enter height" value="'+this.height+'" required=""></td>'
													+ '<td> <button id="'
													+ this.id
													+ '" onclick="variantDelete(this)"> <span class="glyphicon glyphicon-trash"></span> </button> </td> </tr>';
											$('#shippingbodyId tr:last').after(gnitTable);
											gtinRows++;
										});
						$('#variantrow1').remove();
						$('#samplrTrID').remove();
					}
				},
				error : function(request, status, error) {
					alert("request.." + request);
					alert("status.." + status);
					alert("error.." + error);
				}

		})
     }
     
     function updateMSDetails(){
    	 
    	 var gtinVals = $("#shippingbodyId").find("tr");
			var variants = "";
			$.each(gtinVals, function(index, obj) {
				var rowIdVal = $(obj).attr('id');
				if (rowIdVal != undefined) {
					var subgtinVals = $("#" + rowIdVal).find(
							"input[type='text']");
					var variant = '{';
					variant = variant + '"id": "' + rowIdVal + '",';
					$.each(subgtinVals, function(index, subobj) {
						var textboxID = $(subobj).attr('id');
						//alert($("#"+textboxID).val());

						if (textboxID.startsWith("title"))
							variant = variant + '"title": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("lenght"))
							variant = variant + '"lenght": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("width"))
							variant = variant + '"width": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("height"))
							variant = variant + '"height": "'
									+ $("#" + textboxID).val() + '"';

					});//removeStock

					if (index + 1 == gtinVals.length)
						variant = variant + '}';
					else
						variant = variant + '},';
					variants = variants + variant;
				}
			});
 	 alert(variants);
 	 
 	 var merchantPrecentval = merchantPercent();
 	 
 	 var input = '{';

			input = input + '"userId": "' + $("#hiddenUID").val() + '",'
						  + '"merchantPercent": "' + merchantPrecentval + '",'
					+ '"shipping": [' + variants + ']';
			input = input + '}';
			
			alert(input);
			
			$.ajax({
				type : "PUT",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/shipping/updateMSdetails",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					getmsDetails();
				},
				error : function(request, status, error) {
					getmsDetails();

				}
			});
    	 
     }
     
     function merchantPercent(){
    	 var flagVal = "";
    	 if ($('#radio1').is(':checked'))
    		 flagVal = 100;
    	 if ($('#radio2').is(':checked'))
    		 flagVal = 0;
    	 if ($('#radio3').is(':checked'))
    		 flagVal = 50;
    	 
    	 var cusPay = $("#customPay").val();
    	
    	 if(cusPay <100 && cusPay != null && cusPay != ""){
    		 alert("hi");
    		 flagVal = 100-cusPay;
    	 }
    	 
    	 alert(flagVal);
    	 
    	 return flagVal;
     }
    </script>
</body>

</html>
