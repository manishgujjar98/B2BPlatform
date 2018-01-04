<%-- <!DOCTYPE html>
<html>
<title>Product Management</title>
<head>
<!-- include merchant navigation -->
<%@include file="merchantStyles.jsp"%>

<style>
.admin-header {
	background-color: black;
}

html, body {
	background-color: #EEEEEE;
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

.header-div {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
	align-items: flex-end;
}

.product {
	padding-bottom: 10px;
}

.product a {
	display: block;
	width: 100%;
	color: #fff;
	text-decoration: none;
	text-shadow: none;
	font-size: 16px;
}

.product a figure img {
	height: 360px;
}

.product figure {
	position: relative;
}

.product figure figcaption {
	position: absolute;
	padding: 20px 0;
	left: 0;
	right: 0;
	bottom: 0;
}

.product figure figcaption div {
	position: absolute;
	background-size: cover;
	background-repeat: no-repeat;
	background-position-y: 100%;
	filter: blur(3px) contrast(60%);
	left: 0;
	right: 0;
	bottom: 0;
	height: 50px;
}

.product figure figcaption span {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}

.list-inline li .product img {
	width: 200px;
	height: 250px;
}

.product-name-price {
	color: black;
	font-size: 16px;
	line-height: 15px;
	font-weight: 300;
	font-size: 16px;
}

#add-product-modal .modal-dialog {
	width: 90%;
}

.flex-container {
	margin-bottom: 20px;
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
}

#mytop4 .form-search .search-container i {
	padding: 5px;
	float: left;
	width: 30px;
}

#mytop4 .form-search .search-container input {
	border: 0;
	left: 40px;
	height: inherit !important;
	background: transparent;
	float: left;
	width: 87%;
}

#mytop4 .form-search .search-container input:focus {
	outline: none;
}

.add {
	text-decoration: none;
	font-size: 30px;
	width: 50px;
	height: 50px;
	display: block;
	text-align: center;
	color: white;
	border: 1px;
	border-radius: 50%;
	background-color: #315cf2;
	height: 50px;
}

.add span {
	font-size: 30px;
	font-weight: 400;
	text-decoration: none;
}

#add-product-modal .modal-content {
	background: #EEEEEE;
}

.variant-table thead {
	background-color: #F5F5F5;
}

.add-row-plus .add-row {
	color: #73B7FC;
	font-size: 40px;
	outline: none;
}

.add-row-plus:active {
	border: none;
}

.box {
	width: 365px;
	height: 450px;
	border: 1px solid #ccc;
	display: block;
	cursor: pointer;
	overflow: hidden;
	padding: 5px;
	margin-left: 17px;
	box-sizing: border-box;
}

.box img {
	width: 360px;
	height: 450px;
}

.box span {
	display: flex;
	justify-content: center;
	align-items: center;
}

.boxsec {
	width: 120px;
	height: 160px;
	border: 1px solid #ccc;
	display: block;
	padding: 5px;
	cursor: pointer;
	overflow: hidden;
	box-sizing: border-box;
}

.boxsec img {
	width: 120px;
	height: 160px;
}

.boxsec span {
	display: flex;
	justify-content: center;
	align-items: center;
}

.box {
	width: 250px;
	height: 300px;
	border: 1px solid #ccc;
	display: block;
	cursor: pointer;
	overflow: hidden;
	padding: 5px;
	box-sizing: border-box;
}

.box img {
	width: 240px;
	height: 290px;
}

.box span {
	display: flex;
	justify-content: center;
	align-items: center;
}

html, body {
			width: 100%;
			height: 100%;
		}

</style>

</head>

<body>
	<!-- header -->
	<%@include file="merchantNavigation.jsp"%>
	<!--header -->
	<!-- user settings -->
	<div id="spin"></div>
	<section class="col-xs-12 b2b-header-margin" id="product-management">
		<section class="row">
			<div class="container">
				<div class="header-div flex-container text-center">
					<h4 class="flex-item">Product Management</h4>
					<div class="flex-item">
						<button class="btn btn-sample my-top-4-button" data-toggle="modal"
							data-target="#mytop4-modal" data-dismiss="modal"
							style="background-color: #315CF2; color: white; font-size: 18px; padding: 5px 35px 5px 35px;">My
							Top 4</button>
					</div>
					<button class="flex-item add" data-toggle="modal"
						onClick="newProductPU()" data-target="#add-product-modal">

						<span>+</span>

					</button>

				</div>
				<ul class="list-inline list-unstyled text-center" id="listProdcutID">
					<!--  <li>
						<div class="product">
							<a href="#" data-toggle="modal" data-target="#edit-product-modal">
								<figure>
									<img src="/trendSetrIntegration/images/merchant3.png" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/merchant3.png);"></div>
										<span>
											<ul class="product-name-price list-unstyled text-center">
												<li>Product Name</li>
												<li>Product Price</li>
											</ul>
										</span>
									</figcaption>
								</figure>
							</a>
						</div>
					</li>  -->

				</ul>
			</div>

		</section>
	</section>
	<input type="hidden" id="hiddenUID"
		value="<%=session.getAttribute("userId")%>">
	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="add-product-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
<div id="spin1"></div>
					<form class="form-horizontal text-center" name="addproduct">
						<div class="flex-container mt20">

							<button type="button" class="" data-dismiss="modal"
								style="left: 8px; top: 0px; z-index: 9999999; border: none; background-color: inherit; margin-left: 20px; font-size: 20px; outline: none;">
								<b>X</b>
							</button>
							<div class="" style="font-size: 25px;">
								<b>Item Details</b>
							</div>
							<button class="btn btn-sample text-center add-product-button"
								id="saveProductId" type="submit" onclick="addProduct()"
								style="background-color: #315CF2; color: white; padding: 5px 35px 5px 35px; font-size: 16px; margin-right: 20px;">Save</button>
							<button class="btn btn-sample text-center add-product-button"
								style="display: none; background-color: #315CF2; color: white; padding: 5px 35px 5px 35px; font-size: 16px; margin-right: 20px;"
								id="updateProductId" type="submit" onclick="updateProduct()">Update</button>

						</div>
						<div class="col-sm-4">

							<div class="col-xs-12">
								<div
									class="box upload-image img-block custom-image product-primary-img">
									<span class="text">Upload Photo</span> <img src=""
										id="displayImageID" alt="" class="hide">
								</div>
								<input type="file" name="image" id="image"
									style="visibility: hidden;" class="image-browse img-responsive"
									onchange="uploadimg()"> <input type="hidden"
									id="productimage"> <input type="hidden"
									id="productimageID">

							</div>

							<div class="center-block mt-20">

								<div class="col-xs-4">
									<div
										class="first-img boxsec upload-image img-block custom-image">
										<span class="text">Upload Photo</span> <img src=""
											id="displayImageID1" alt="" class="hide">
									</div>
									<input type="file" name="image1" id="image1"
										style="visibility: hidden;"
										class="image-browse img-responsive" onchange="uploadimg1()">
									<input type="hidden" id="productimage1"> <input
										type="hidden" id="productimageID1">

								</div>
								<div class="col-xs-4">
									<div
										class="second-img boxsec upload-image img-block custom-image">
										<span class="text">Upload Photo</span> <img src=""
											id="displayImageID2" alt="" class="hide">
									</div>
									<input type="file" name="image2" id="image2"
										style="visibility: hidden;"
										class="image-browse img-responsive" onchange="uploadimg2()">
									<input type="hidden" id="productimage2">
									<inputtype ="hidden" id="productimageID2">
								</div>
								<div class="col-xs-4">
									<div
										class="third-img boxsec upload-image img-block custom-image">
										<span class="text">Upload Photo</span> <img src=""
											id="displayImageID3" alt="" class="hide">
									</div>
									<input type="file" name="image3" id="image3"
										style="visibility: hidden;"
										class="image-browse img-responsive" onchange="uploadimg3()">
									<input type="hidden" id="productimage3"> <input
										type="hidden" id="productimageID3">

								</div>


								</section>
							</div>

						</div>
						<div class="col-sm-8 text-center product-details">
							<div class="panel-body text-center">
								<div class="form-group">
									<label for="productname" class="col-sm-2 control-label"
										style="text-align: left; padding-right: 5px;">Product
										Name</label> <input type="hidden" id="hiddenProductID"></input>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="productname"
											id="productname" placeholder="Enter Product Name" required>
									</div>
								</div>
								<div class="form-group text-center">
									<label for="gender" class="col-sm-2 control-label"
										style="text-align: left;">Select Gender</label>
									<div class="col-sm-10">
										<select name="gender" id="gender" class="form-control"
											onChange="getCategory()" required>
											<option value="0">Select Gender</option>
											<option value="1">Men</option>
											<option value="2">Women</option>
										</select>
									</div>
								</div>
								<div class="form-group text-center">
									<label for="category" class="col-sm-2 control-label"
										style="text-align: left;">Category</label>
									<div class="col-sm-10">
										<select name="category" id="category" class="form-control"
											required>
											<option value="">Select Category</option>
											<option value="1">Shirts</option>
											<option value="12">Category 2</option>
											<option value="13">Category 3</option>
											<option value="14">Category 4</option>
											<option value="15">Category 5</option>
										</select>
									</div>
								</div>
								<div class="form-group text-center">
									<label for="sub-category" class="col-sm-2 control-label"
										style="text-align: left;">Sub-Category</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="subcategory"
											id="subcategory" placeholder="Enter the product subcategory"
											required>
										<!-- <select name="subcategory" id="subcategory"
											class="form-control" required>
											<option value="">Select Sub-Category</option>
											<option value="1">Sub-Category 1</option>
											<option value="2">Sub-Category 2</option>
											<option value="3">Sub-Category 3</option>
										</select> -->
									</div>
								</div>

								<div class="form-group">
									<label for="description" class="col-sm-12 control-label"
										style="text-align: left;">Description</label>
									<div class="col-sm-12 mt10">
										<textarea rows="18" cols="50" class="form-control"
											name="description" id="description"
											placeholder="Enter the product descripton here" required>
											</textarea>
									</div>
								</div>
							</div>


						</div>

						<div class="col-sm-12 panel panel-default" style="margin: 0 auto;">
							<div class="heading">
								<h4 class="pull-left">Variant</h4>
								<div class="clearfix"></div>
							</div>
							<div class="panel-body text-center">
								<div class="table-responsive" id="divVariants">
									<table
										class="variant-table table table-hover table-bordered text-center"
										id="variant-table">
										<thead>
											<tr>
												<!-- <th class="text-center">Remove from sale</th> -->
												<th class="text-center">SKU</th>
												<th class="text-center">Color</th>
												<th class="text-center">Size</th>
												<th class="text-center">Price</th>
												<th class="text-center">Current Stock</th>
												<th class="text-center">Add Stock</th>
												<th class="text-center">Delete Stock</th>
											</tr>
										</thead>
										<tbody id="varianttbodyid">
											<tr id="variantrow1">
												<!-- <td><input type="checkbox" class="form-control"
													name="sale" id="sale"></td>
 -->
												<td><input type="text" class="form-control" name="sku"
													id="sku1" placeholder="Enter SKU" required></td>
												<td><input type="text" class="form-control"
													name="colour" id="colour1" placeholder="Enter Color"
													required></td>
												<td><input type="text" class="form-control" name="size"
													id="size1" placeholder="Enter Size" required></td>
												<td><input type="text" class="form-control"
													name="price" id="price1" placeholder="Enter Price" required></td>
												<td><input type="text" class="form-control"
													name="currentstock" id="currentstock"
													placeholder="Current Stock"></td>
												<td><input type="text" class="form-control"
													name="addstock" id="addstock" placeholder="Add Stock"></td>
												<td>
													<button id="variantrow1" onclick="variantDelete(this)">
														<span class="glyphicon glyphicon-trash"></span>
													</button>
												</td>

												<!-- <tr> -->
												<!-- <td class="text-center" colspan="6" align="center">
													<button id="addrow1" onclick="myFunction(this)"
														class="add-row">+</button>
												</td> -->
											</tr>
											<!-- </tr> -->
										</tbody>
										<tr>
											<td class="text-center add-row-plus" colspan="8"
												align="center">
												<button id="addrow1" onclick="myFunction(this)"
													class="add-row"
													style="border: none; background: transparent;">+</button>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>

						<!-- ./product content -->
						<!-- ./user settings content -->
					</form>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="clearfix"></div>

	<!-- ./product modal -->
	<!-- JS Files -->
	<script src="https://sdk.amazonaws.com/js/aws-sdk-2.77.0.min.js"></script>
	<%@include file="merchantFooter.jsp"%>
	<script>
		$(document)
				.ready(
						function() {
							//createAlbum("productimages");
							$("#spin").spinner({
								background: "rgba(0,0,0,0.6)"
								, html: "<i class='fa fa-repeat' style='color: #fff;'></i>"
							});
							$("#spin").show();
							$("#listProdcutID").hide();
							$
									.ajax({
										type : "GET",
										contentType : "application/json; charset=utf-8",
										url : "/trendSetr/rest/products/"
												+ $("#hiddenUID").val(),
										dataType : "json",
										success : function(responseData, status) {
											//	console.log(responseData);
											//console.log("response Data Check!")
											if (responseData != null) {
												/* console
														.log("response Data Check!")
												console.log(responseData) */
												var productListHTML = "";
												$
														.each(
																responseData,
																function(index,
																		value) {
																	/* var pv = JSON.stringify(this.productVariant);
																	var pv1 = JSON.parse(pv); //this.productVariant.price;
																	alert(pv1.price); */
																	/* 	console.log(this.productVariant.price); */
																	//alert(this.productImages.image);
																	productListHTML = productListHTML
																			+ '<li>'
																			+ '<div class="product">'
																			+ '<a href="#" onClick="getImageData(this)" pid = '
																			+ this.id
																			+ ' data-toggle="modal" data-target="#add-product-modal">'
																			+ '<figure>'
																			+ '<img src="'+this.productImages.image+'" alt="img">'
																			+ '<figcaption>'
																			+ '<div style="background-image: url('
																			+ this.productImages.image
																			+ ');"></div>'
																			+ '<span>'
																			+ '<ul class="product-name-price list-unstyled text-center">'
																			+ '<li style="text-transform:capitalize;"><b>'
																			+ this.name
																			+ " - $"
																			+ this.productVariant.price
																			+ '</b></li>'
																			+ '</ul>'
																			+ '</span>'
																			+ '</figcaption>'
																			+ '</figure>'
																			+ '</a>'
																			+ '</div>'
																			+ '</li>';
																});

											}
											$("#listProdcutID").html(
													productListHTML);
										},
										error : function(request, status, error) {
											alert("request.." + request);
											alert("status.." + status);
											alert("error.." + error);
										}

									});
							setTimeout(function(){
								$("#spin").hide();
							}, 2000);
							$("#listProdcutID").show();

						})

		function getImageData(fldObj) {
			$("#saveProductId").hide();
			$("#updateProductId").show();
			var productID = $(fldObj).attr("pid");
			$('#varianttbodyid').empty();
			$('#varianttbodyid').append("<tr id='samplrTrID'></tr>");

			$('#displayImageID').attr('src', "").removeClass('show');
			$('.upload-image > span:first-child').show();

			$('#displayImageID1').attr('src', "").removeClass('show');
			$('.upload-image > span:first-child').show();

			$('#displayImageID2').attr('src', "").removeClass('show');
			$('.upload-image > span:first-child').show();

			$('#displayImageID3').attr('src', "").removeClass('show');
			$('.upload-image > span:first-child').show();

			$
					.ajax({
						type : "GET",
						contentType : "application/json; charset=utf-8",
						url : "/trendSetr/rest/products/product/" + productID,
						dataType : "json",
						success : function(responseData, status) {
							console.log(responseData);
							if (responseData != null) {
								// alert(responseData[0].gender);
								$("#hiddenProductID").val(responseData[0].id);
								$("#productname").val(responseData[0].name);
								$("#gender").val(responseData[0].gender)
										.change();

								setTimeout(
										function() {
											$("#category").val(
													responseData[0].categoryId)
													.change();
											$("#subcategory")
													.val(
															responseData[0].subcategoryId)
													.change();

											$("#description")
													.val(
															responseData[0].description);
											$
													.each(
															responseData[0].productImagesList,
															function(index,
																	value) {

																var i = 0;
																//alert(this.type);
																if (this.type == "Primary") {
																	$(
																			"#productimageID")
																			.val(
																					this.id);
																	$(
																			'#displayImageID')
																			.attr(
																					'src',
																					this.image)
																			.removeClass(
																					'hide');
																	$(
																			'.upload-image > span:first-child')
																			.hide();
																	$(
																			"#productimage")
																			.val(
																					this.image);
																} else if (this.type == "Secondary1") {

																	$(
																			"#productimageID1")
																			.val(
																					this.id);

																	$(
																			'#displayImageID1')
																			.attr(
																					'src',
																					this.image)
																			.removeClass(
																					'hide');
																	$(
																			'.upload-image > span:first-child')
																			.hide();
																	$(
																			"#productimage1")
																			.val(
																					this.image);

																} else if (this.type == "Secondary2") {
																	$(
																			"#productimageID2")
																			.val(
																					this.id);

																	$(
																			'#displayImageID2')
																			.attr(
																					'src',
																					this.image)
																			.removeClass(
																					'hide');
																	$(
																			'.upload-image > span:first-child')
																			.hide();
																	$(
																			"#productimage2")
																			.val(
																					this.image);

																} else if (this.type == "Secondary3") {
																	$(
																			"#productimageID3")
																			.val(
																					this.id);

																	$(
																			'#displayImageID3')
																			.attr(
																					'src',
																					this.image)
																			.removeClass(
																					'hide');
																	$(
																			'.upload-image > span:first-child')
																			.hide();
																	$(
																			"#productimage3")
																			.val(
																					this.image);

																}
															});

											var gtinRows = 0;
											$
													.each(
															responseData[0].productVariantList,
															function(index,
																	value) {
																var gnitTable = "";

																gnitTable = gnitTable
																		+ +'<tr id="'+this.id+'">'
																		+ '<tr id="'+this.id+'">'
																		/* + '<td><input type="checkbox" class="form-control" name="sale" id="sale'+this.id+'"></td>' */
																		+ '<td><input type="text" class="form-control" name="sku" id="sku'+this.id+'" placeholder="Enter SKU" value="'+this.skuId+'" required></td>'
																		+ '<td><input type="text" class="form-control" name="colour" id="colour'+this.id+'" placeholder="Enter Color" value="'+this.colour+'" required></td>'
																		+ '<td><input type="text" class="form-control" name="size" id="size'+this.id+'" placeholder="Enter Size" value="'+this.size+'" required></td>'
																		+ '<td><input type="text" class="form-control" name="price" id="price'+this.id+'" placeholder="Enter Price" value="'+this.price+'" required> </td>'
																		+ '<td><input type="text" class="form-control" name="currentstock" id="cStock'+this.id+'" placeholder="Enter Current Stock" value="'+this.quantity+'" readonly> </td>'
																		+ '<td><input type="text" class="form-control" name="addstock" id="aStock'+this.id+'" placeholder="Add Stock" value="'+this.addStock+'" > </td>'
																		+ '<td><input type="text" class="form-control" name="removestock" id="rStock'+this.id+'" placeholder="Remove Stock" value="'+this.removeStock+'" > </td>'
																		+ '<td> <button id="'
																		+ this.id
																		+ '" onclick="variantDelete(this)"> <span class="glyphicon glyphicon-trash"></span> </button> </td> </tr>';
																/* + '<td class="text-center" colspan="8" align="center"> <button id="addrow'
																+ gtinRows
																+ '" onclick="myFunction(this)" class="add-row">+ </button></td> </tr>'; */
																$(
																		'#varianttbodyid tr:last')
																		.after(
																				gnitTable);
																gtinRows++;
															});
											$('#variantrow1').remove();
											$('#samplrTrID').remove();
										}, 1000);
							}
						},
						error : function(request, status, error) {
							alert("request.." + request);
							alert("status.." + status);
							alert("error.." + error);
						}

					});

		}

		function myFunction(fldObj) {
			var rowCount = $(fldObj).attr('id');
			rowCount = rowCount.replace(/[A-Za-z$-]/g, "");
			rowCount = parseInt(rowCount);
			var maxRowNum = [];

			var gtinVals = $("#divVariants").find("tr");
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
					+ '<td><input type="text" class="form-control" name="sku" id="sku'+gtinRows+'" placeholder="Enter SKU" required></td>'
					+ '<td><input type="text" class="form-control" name="colour" id="colour'+gtinRows+'" placeholder="Enter Color" required></td>'
					+ '<td><input type="text" class="form-control" name="size" id="size'+gtinRows+'" placeholder="Enter Size" required></td>'
					+ '<td><input type="text" class="form-control" name="price" id="price'+gtinRows+'" placeholder="Enter Price" required> </td>'
					+ '<td><input type="text" class="form-control" name="currentStock" id="cStock'+gtinRows+'" placeholder="Current Stock" value="0" readonly></td>'
					+ '<td><input type="text" class="form-control" name="addStock" id="aStock'+gtinRows+'" placeholder="Add Stock" required></td>'
					+ '<td><input type="text" class="form-control" name="removeStock" id="rStock'+gtinRows+'" placeholder="Remove Stock" required></td>'
					+ '<td> <button id = "variantrow'
					+ gtinRows
					+ '" onclick="variantDelete(this)"> <span class="glyphicon glyphicon-trash"></span> </button> </td> </tr>';
			/* + '<td class="text-center" colspan="8" align="center"> <button id="addrow'
			+ gtinRows
			+ '" onclick="myFunction(this)" class="add-row">+ </button></td> </tr>'; */
			$('#varianttbodyid tr:last').after(gnitTable);

		}

		function save() {
		}
		/* for deleting variants row */

		$('document').on('click', '#deletebutton', function(e) {
			$(this).closest('tr').remove()
		});
	</script>
	<script>
		function addProduct() {
			$("#saveProductId").hide();
			$("#updateProductId").show();
			var gtinVals = $("#divVariants").find("tr");
			console.log(gtinVals[1]);
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

						if (textboxID.startsWith("sku"))
							variant = variant + '"skuId": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("colour"))
							variant = variant + '"colour": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("size"))
							variant = variant + '"size": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("price"))
							variant = variant + '"price": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("cStock"))
							variant = variant + '"quantity": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("aStock"))
							variant = variant + '"addStock": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("rStock"))
							variant = variant + '"removeStock": "'
									+ $("#" + textboxID).val() + '"';

					});//removeStock

					if (index + 2 == gtinVals.length)
						variant = variant + '}';
					else
						variant = variant + '},';
					variants = variants + variant;
				}
			});

			if ($("#productimage").val() == "")
					 {
				alert("please select primary image")
				return false;
			} else {

				var productImage = '{';
				productImage = productImage + '"image": "'
						+ $("#productimage").val() + '",' + '"type": "Primary"';
				productImage = productImage + '},';
				productImage = productImage + '{' + '"image": "'
						+ $("#productimage1").val() + '",'
						+ '"type": "Secondary1"';
				productImage = productImage + '},';
				productImage = productImage + '{' + '"image": "'
						+ $("#productimage2").val() + '",'
						+ '"type": "Secondary2"';
				productImage = productImage + '},';
				productImage = productImage + '{' + '"image": "'
						+ $("#productimage3").val() + '",'
						+ '"type": "Secondary3"';
				productImage = productImage + '}';

			}

			//alert(productImage);

			var input = '{';

			input = input + '"name": "' + $('#productname').val() + '",'
					+ '"gender": "' + $('#gender').val() + '",'
					+ '"categoryId": "' + $('#category').val() + '",'
					+ '"subcategoryId": "' + $('#subcategory').val() + '",'
					+ '"categoryName": "'
					+ $('#category option:selected').text() + '",'
					+ '"createdBy": "' + $("#hiddenUID").val() + '",'
					+ '"description": "' + $('#description').val() + '",'
					+ '"productVariantList": [' + variants + '],'
					+ '"productImagesList": [' + productImage + ']';
			//"productVariantList" : [variants];
			input = input + '}';
			//alert(input);
			$.ajax({
				type : "POST",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/products/addproduct",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					document.addproduct.action = "./productManagement.jsp"
					document.addproduct.submit();
				},
				error : function(request, status, error) {
					//alert("Error");
					document.addproduct.action = "./productManagement.jsp"
					document.addproduct.submit();

				}
			});

		}

		function updateProduct() {
			var gtinVals = $("#divVariants").find("tr");
			console.log(gtinVals[1]);
			var variants = "";
			//alert(gtinVals.length);
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

						if (textboxID.startsWith("sku"))
							variant = variant + '"skuId": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("colour"))
							variant = variant + '"colour": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("size"))
							variant = variant + '"size": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("price"))
							variant = variant + '"price": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("cStock"))
							variant = variant + '"quantity": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("aStock"))
							variant = variant + '"addStock": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("rStock"))
							variant = variant + '"removeStock": "'
									+ $("#" + textboxID).val() + '"';
					});
					if (index + 2 == gtinVals.length)
						variant = variant + '}';
					else
						variant = variant + '},';
					variants = variants + variant;
				}
			});
			if ($("#productimage").val() == "") {
				alert("please select primary image")
				return false;
			} else {

				var productImage = '{';
				productImage = productImage + '"image": "'
						+ $("#productimage").val() + '",'
						+ '"type": "Primary",' + '"id": "'
						+ $("#productimageID").val() + '"';
				productImage = productImage + '},';
				productImage = productImage + '{' + '"image": "'
						+ $("#productimage1").val() + '",'
						+ '"type": "Secondary1",' + '"id": "'
						+ $("#productimageID1").val() + '"';
				productImage = productImage + '},';
				productImage = productImage + '{' + '"image": "'
						+ $("#productimage2").val() + '",'
						+ '"type": "Secondary2",' + '"id": "'
						+ $("#productimageID2").val() + '"';

				productImage = productImage + '},';
				productImage = productImage + '{' + '"image": "'
						+ $("#productimage3").val() + '",'
						+ '"type": "Secondary3",' + '"id": "'
						+ $("#productimageID3").val() + '"';
				productImage = productImage + '}';
			}

			var input = '{';

			input = input + '"id": "' + $("#hiddenProductID").val() + '",'
					+ '"name": "' + $('#productname').val() + '",'
					+ '"categoryId": "' + $('#category').val() + '",'
					+ '"subcategoryId": "' + $('#subcategory').val() + '",'
					+ '"gender": "' + $('#gender').val() + '",'
					+ '"categoryName":"'
					+ $('#category option:selected').text() + '",'
					+ '"createdBy": "' + $("#hiddenUID").val() + '",'
					+ '"description": "' + $('#description').val() + '",'
					+ '"productVariantList": [' + variants + '],'
					+ '"productImagesList": [' + productImage + ']';
			//"productVariantList" : [variants];
			input = input + '}';
			$.ajax({
				type : "PUT",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/products",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					document.addproduct.action = "./productManagement.jsp"
					document.addproduct.submit();
				},
				error : function(request, status, error) {
					document.addproduct.action = "./productManagement.jsp"
					document.addproduct.submit();

				}
			});
		}

		function variantDelete(fldObj) {
			var rowId = $(fldObj).attr('id');
			$("#" + rowId).remove();
		}

		function getCategory() {

			$
					.ajax({
						type : "GET",
						contentType : "application/json; charset=utf-8",
						url : "/trendSetr/rest/products/product/category/"
								+ $("#gender").val(),
						dataType : "json",
						success : function(responseData, status) {

							var dropDowns = '<option value="0">Select Category</option> ';

							$.each(responseData, function(index, value) {
								dropDowns += '<option value="'+this.id+'">'
										+ this.categoryName + '</option> ';
							});

							$("#category").html(dropDowns);

						},
						error : function(request, status, error) {
							alert("Error");

						}
					});

		}

		function newProductPU() {
			$("#saveProductId").show();
			$("#updateProductId").hide();
			$("#productimage").val("");
			$("#productimage1").val("");
			$("#productimage2").val("");
			$("#productimage3").val("");
			$("#productname").val("");
			$("#gender").val("");
			$("#category").val("");
			$("#subcategory").val("");
			$("#description").val("");
			$('#varianttbodyid').empty();
			$('#varianttbodyid').append("<tr id='samplrTrID'></tr>");
			var initial = '<tr id="variantrow1">'
					/* + '<td><input type="checkbox" class="form-control" name="sale" id="sale"></td>' */
					+ '<td><input type="text" class="form-control" name="sku" id="sku1" placeholder="Enter SKU" required></td>'
					+ '<td><input type="text" class="form-control" name="colour" id="colour1" placeholder="Enter Color" required></td>'
					+ '<td><input type="text" class="form-control" name="size" id="size1" placeholder="Enter Size" required> </td>'
					+ '<td><input type="text" class="form-control" name="price" id="price1" placeholder="Enter Price" required></td>'
					+ '<td><input type="text" class="form-control" name="currentStock" id="cStock1" placeholder="Current Stock" value="0" readonly></td>'
					+ '<td><input type="text" class="form-control" name="addStock" id="aStock1" placeholder="Add Stock" required></td>'
					+ '<td><input type="text" class="form-control" name="removeStock" id="rStock1" placeholder="Remove Stock" required></td>'
					+ '<td><button id="variantrow1" onclick="variantDelete(this)"><span class="glyphicon glyphicon-trash"></span></button></td>'
					/* + '<td class="text-center" colspan="6" align="center"> <button id="addrow1" onclick="myFunction(this)" class="add-row">+</button></td>' */
					+ '</tr>"';
			$('#varianttbodyid tr:last').after(initial);
			$('#varianttbodyid').append(initial);
			$('#samplrTrID').remove();
			$('#variantrow1').remove();
		}

		// AWS intgration for products to save in s3

		$('.upload-image').on('click', function(e) {
			e.preventDefault();
			$(this).next().trigger('click');
		});

		// only for debugging

		/*   $('input[type=file]').on('change', function(e) {
			e.preventDefault();
			var file = e.target.files[0];
			var filePath = URL.createObjectURL(file);
			alert("pavan "+ filePath);
			$('#displayImageID .text').hide();
			$('#displayImageID').removeClass('hide');
			$('#displayImageID').attr('src', filePath);
			addPhoto("productimages", e.target.files);
		});  */

		/* $('#profileimage').on('change', function(e) {
			e.preventDefault();
			var file = e.target.files[0];
			var filePath = URL.createObjectURL(file);
			alert(filePath);
			$('#profileimage .text').hide();
			$('#profileimage').removeClass('hide');
			$('#profileimage').attr('src', filePath);
			addPhoto("productimages", e.target.files);
		}); */

		//aws upload
		var albumBucketName = 'trendsetr';
		var bucketRegion = 'us-east-2';
		var IdentityPoolId = 'us-east-2:c5c0765a-bd5e-44b8-b23e-7505377a7644';

		AWS.config.update({
			region : bucketRegion,
			credentials : new AWS.CognitoIdentityCredentials({
				IdentityPoolId : IdentityPoolId
			})
		});

		var s3 = new AWS.S3({
			apiVersion : '2006-03-01',
			params : {
				Bucket : albumBucketName
			}
		});

		//creates an album if does not exists
		function createAlbum(albumName) {
			alert("hi");
			albumName = albumName.trim();
			if (!albumName) {
				return alert('Album names must contain at least one non-space character.');
			}
			if (albumName.indexOf('/') !== -1) {
				return alert('Album names cannot contain slashes.');
			}
			var albumKey = encodeURIComponent(albumName) + '/';
			alert(albumKey);
			s3.headObject({
				Key : albumKey
			}, function(err, data) {
				if (!err) {
					return false;
				}
				if (err.code !== 'NotFound') {
					return alert('There was an error creating your album: '
							+ err.message);
				}
				s3.putObject({
					Key : albumKey
				}, function(err, data) {
					if (err) {
						return alert('There was an error creating your album: '
								+ err.message);
					} else {
						alert("sucess");
					}
				});
			});
		}

		//createAlbum("productimages");

		function addPhoto(albumName, files, imageType) {
			//var files = document.getElementById('photoupload').files;
			if (!files.length) {
				return alert('Please choose a file to upload first.');
			}
			var file = files[0];
			var fileName = file.name;
			var albumPhotosKey = encodeURIComponent(albumName) + '//';

			var photoKey = albumPhotosKey + fileName;
			$("#spin1").spinner({
				background: "rgba(0,0,0,0.6)"
				, html: "<i class='fa fa-repeat' style='color: #fff;'></i>"
			});
			$("#spin1").show();
			s3.upload({
				Key : photoKey,
				Body : file,
				ACL : 'public-read'
			}, function(err, data) {
				if (err) {
					return alert('There was an error uploading your photo: ',
							err.message);
				}
				alert('Successfully uploaded photo.');
				console.log(data);
				if (imageType == "uploadimg")
					$("#productimage").val(data.Location);
				else if (imageType == "uploadimg1")
					$("#productimage1").val(data.Location);
				else if (imageType == "uploadimg2")
					$("#productimage2").val(data.Location);
				else if (imageType == "uploadimg3")
					$("#productimage3").val(data.Location);
				setTimeout(function(){
					$("#spin1").hide();
				}, 2000);
			});
		}

		function uploadimg() {
			var file = $('#image')[0].files[0]
			var filePath = URL.createObjectURL(file);

			$('#displayImageID .text').hide();
			$('#displayImageID').removeClass('hide');
			$('#displayImageID').attr('src', filePath);
			addPhoto("productimages", $('#image')[0].files, "uploadimg");
		}

		function uploadimg1() {
			var file = $('#image1')[0].files[0]
			var filePath = URL.createObjectURL(file);

			$('#displayImageID1 .text').hide();
			$('#displayImageID1').removeClass('hide');
			$('#displayImageID1').attr('src', filePath);
			addPhoto("productimages", $('#image1')[0].files, "uploadimg1");
		}

		function uploadimg2() {
			var file = $('#image2')[0].files[0]
			var filePath = URL.createObjectURL(file);

			$('#displayImageID2 .text').hide();
			$('#displayImageID2').removeClass('hide');
			$('#displayImageID2').attr('src', filePath);
			addPhoto("productimages", $('#image2')[0].files, "uploadimg2");
		}

		function uploadimg3() {
			var file = $('#image3')[0].files[0]
			var filePath = URL.createObjectURL(file);

			$('#displayImageID3 .text').hide();
			$('#displayImageID3').removeClass('hide');
			$('#displayImageID3').attr('src', filePath);
			addPhoto("productimages", $('#image3')[0].files, "uploadimg3");
		}
		
		$(function(){
			$("#spin").spinner({
				background: "rgba(0,0,0,0.6)"
				, html: "<i class='fa fa-repeat' style='color: #fff;'></i>"
			});
			
			$("#show").click(function(){
				$("#spin").show();

				setTimeout(function(){
					$("#spin").hide();
				}, 1000);
			});
		});
	</script>
</body>

</html>
 --%>
 
 
 
 <!DOCTYPE html>
<html>
<title>Product Management</title>
<head>
<!-- include merchant navigation -->
<%@include file="merchantStyles.jsp"%>

<style>
.admin-header {
	background-color: black;
}

html, body {
	background-color: #EEEEEE;
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

.header-div {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
	align-items: flex-end;
}

.product {
	padding-bottom: 10px;
}

.product a {
	display: block;
	width: 100%;
	color: #fff;
	text-decoration: none;
	text-shadow: none;
	font-size: 16px;
}

.product a figure img {
	height: 360px;
}

.product figure {
	position: relative;
}

.product figure figcaption {
	position: absolute;
	padding: 20px 0;
	left: 0;
	right: 0;
	bottom: 0;
}

.product figure figcaption div {
	position: absolute;
	background-size: cover;
	background-repeat: no-repeat;
	background-position-y: 100%;
	filter: blur(3px) contrast(60%);
	left: 0;
	right: 0;
	bottom: 0;
	height: 50px;
}

.product figure figcaption span {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}

.list-inline li .product img {
	width: 200px;
	height: 250px;
}

.product-name-price {
	color: black;
	font-size: 16px;
	line-height: 15px;
	font-weight: 300;
	font-size: 16px;
}

#add-product-modal .modal-dialog {
	width: 90%;
}

.flex-container {
	margin-bottom: 20px;
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
}

#mytop4 .form-search .search-container i {
	padding: 5px;
	float: left;
	width: 30px;
}

#mytop4 .form-search .search-container input {
	border: 0;
	left: 40px;
	height: inherit !important;
	background: transparent;
	float: left;
	width: 87%;
}

#mytop4 .form-search .search-container input:focus {
	outline: none;
}

.add {
	text-decoration: none;
	font-size: 30px;
	width: 50px;
	height: 50px;
	display: block;
	text-align: center;
	color: white;
	border: 1px;
	border-radius: 50%;
	background-color: #315cf2;
	height: 50px;
}

.add span {
	font-size: 30px;
	font-weight: 400;
	text-decoration: none;
}

#add-product-modal .modal-content {
	background: #EEEEEE;
}

.variant-table thead {
	background-color: #F5F5F5;
}

.add-row-plus .add-row {
	color: #73B7FC;
	font-size: 40px;
	outline: none;
}

.add-row-plus:active {
	border: none;
}

.box {
	width: 365px;
	height: 450px;
	border: 1px solid #ccc;
	display: block;
	cursor: pointer;
	overflow: hidden;
	padding: 5px;
	margin-left: 17px;
	box-sizing: border-box;
}

.box img {
	width: 360px;
	height: 450px;
}

.box span {
	display: flex;
	justify-content: center;
	align-items: center;
}

.boxsec {
	width: 120px;
	height: 160px;
	border: 1px solid #ccc;
	display: block;
	padding: 5px;
	cursor: pointer;
	overflow: hidden;
	box-sizing: border-box;
}

.boxsec img {
	width: 120px;
	height: 160px;
}

.boxsec span {
	display: flex;
	justify-content: center;
	align-items: center;
}

.box {
	width: 250px;
	height: 300px;
	border: 1px solid #ccc;
	display: block;
	cursor: pointer;
	overflow: hidden;
	padding: 5px;
	box-sizing: border-box;
}

.box img {
	width: 240px;
	height: 290px;
}

.box span {
	display: flex;
	justify-content: center;
	align-items: center;
}

html, body {
			width: 100%;
			height: 100%;
		}

</style>

</head>

<body>
	<!-- header -->
	<%@include file="merchantNavigation.jsp"%>
	<!--header -->
	<!-- user settings -->
	<div id="spin"></div>
	<section class="col-xs-12 b2b-header-margin" id="product-management">
		<section class="row">
			<div class="container">
				<div class="header-div flex-container text-center">
					<h4 class="flex-item">Product Management</h4>
					<div class="flex-item">
						<button class="btn btn-sample my-top-4-button" data-toggle="modal"
							data-target="#mytop4-modal" data-dismiss="modal"
							style="background-color: #315CF2; color: white; font-size: 18px; padding: 5px 35px 5px 35px;">My
							Top 4</button>
					</div>
					<button class="flex-item add" data-toggle="modal"
						onClick="newProductPU()" data-target="#add-product-modal">

						<span>+</span>

					</button>

				</div>
				<ul class="list-inline list-unstyled text-center" id="listProdcutID">
					<!--  <li>
						<div class="product">
							<a href="#" data-toggle="modal" data-target="#edit-product-modal">
								<figure>
									<img src="/trendSetrIntegration/images/merchant3.png" alt="img">
									<figcaption>
										<div
											style="background-image: url(/trendSetrIntegration/images/merchant3.png);"></div>
										<span>
											<ul class="product-name-price list-unstyled text-center">
												<li>Product Name</li>
												<li>Product Price</li>
											</ul>
										</span>
									</figcaption>
								</figure>
							</a>
						</div>
					</li>  -->

				</ul>
			</div>

		</section>
	</section>
	<input type="hidden" id="hiddenUID"
		value="<%=session.getAttribute("userId")%>">
	<div class="modal fade" data-keyboard="false" data-backdrop="static"
		id="add-product-modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
<div id="spin1"></div>
					<form class="form-horizontal text-center" name="addproduct">
						<div class="flex-container mt20">

							<button type="button" class="" data-dismiss="modal"
								style="left: 8px; top: 0px; z-index: 9999999; border: none; background-color: inherit; margin-left: 20px; font-size: 20px; outline: none;">
								<b>X</b>
							</button>
							<div class="" style="font-size: 25px;">
								<b>Item Details</b>
							</div>
							<button class="btn btn-sample text-center add-product-button"
								id="saveProductId" type="submit" onclick="addProduct()"
								style="background-color: #315CF2; color: white; padding: 5px 35px 5px 35px; font-size: 16px; margin-right: 20px;">Save</button>
							<button class="btn btn-sample text-center add-product-button"
								style="display: none; background-color: #315CF2; color: white; padding: 5px 35px 5px 35px; font-size: 16px; margin-right: 20px;"
								id="updateProductId" type="submit" onclick="updateProduct()">Update</button>

						</div>
						<div class="col-sm-4">

							<div class="col-xs-12">
								<div
									class="box upload-image img-block custom-image product-primary-img">
									<span class="text">Upload Photo</span> <img src=""
										id="displayImageID" alt="" class="hide">
								</div>
								<input type="file" name="image" id="image"
									style="visibility: hidden;" class="image-browse img-responsive"
									onchange="uploadimg()"> <input type="hidden"
									id="productimage"> <input type="hidden"
									id="productimageID">

							</div>

							<div class="center-block mt-20">

								<div class="col-xs-4">
									<div
										class="first-img boxsec upload-image img-block custom-image">
										<span class="text">Upload Photo</span> <img src=""
											id="displayImageID1" alt="" class="hide">
									</div>
									<input type="file" name="image1" id="image1"
										style="visibility: hidden;"
										class="image-browse img-responsive" onchange="uploadimg1()">
									<input type="hidden" id="productimage1"> <input
										type="hidden" id="productimageID1">

								</div>
								<div class="col-xs-4">
									<div
										class="second-img boxsec upload-image img-block custom-image">
										<span class="text">Upload Photo</span> <img src=""
											id="displayImageID2" alt="" class="hide">
									</div>
									<input type="file" name="image2" id="image2"
										style="visibility: hidden;"
										class="image-browse img-responsive" onchange="uploadimg2()">
									<input type="hidden" id="productimage2">
									<inputtype ="hidden" id="productimageID2">
								</div>
								<div class="col-xs-4">
									<div
										class="third-img boxsec upload-image img-block custom-image">
										<span class="text">Upload Photo</span> <img src=""
											id="displayImageID3" alt="" class="hide">
									</div>
									<input type="file" name="image3" id="image3"
										style="visibility: hidden;"
										class="image-browse img-responsive" onchange="uploadimg3()">
									<input type="hidden" id="productimage3"> <input
										type="hidden" id="productimageID3">

								</div>


								</section>
							</div>

						</div>
						<div class="col-sm-8 text-center product-details">
							<div class="panel-body text-center">
								<div class="form-group">
									<label for="productname" class="col-sm-2 control-label"
										style="text-align: left; padding-right: 5px;">Product
										Name</label> <input type="hidden" id="hiddenProductID"></input>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="productname"
											id="productname" placeholder="Enter Product Name" required>
									</div>
								</div>
								<div class="form-group text-center">
									<label for="gender" class="col-sm-2 control-label"
										style="text-align: left;">Select Gender</label>
									<div class="col-sm-10">
										<select name="gender" id="gender" class="form-control"
											onChange="getCategory()" required>
											<option value="">Select Gender</option>
											<option value="1">Men</option>
											<option value="2">Women</option>
										</select>
									</div>
								</div>
								<div class="form-group text-center">
									<label for="category" class="col-sm-2 control-label"
										style="text-align: left;">Category</label>
									<div class="col-sm-10">
										<select name="category" id="category" class="form-control"
											required>
											<option value="">Select Category</option>
											<option value="1">Shirts</option>
											<option value="12">Category 2</option>
											<option value="13">Category 3</option>
											<option value="14">Category 4</option>
											<option value="15">Category 5</option>
										</select>
									</div>
								</div>
								<div class="form-group text-center">
									<label for="sub-category" class="col-sm-2 control-label"
										style="text-align: left;">Sub-Category</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="subcategory"
											id="subcategory" placeholder="Enter the product subcategory"
											required>
										<!-- <select name="subcategory" id="subcategory"
											class="form-control" required>
											<option value="">Select Sub-Category</option>
											<option value="1">Sub-Category 1</option>
											<option value="2">Sub-Category 2</option>
											<option value="3">Sub-Category 3</option>
										</select> -->
									</div>
								</div>

								<div class="form-group">
									<label for="description" class="col-sm-12 control-label"
										style="text-align: left;">Description</label>
									<div class="col-sm-12 mt10">
										<textarea rows="18" cols="50" class="form-control"
											name="description" id="description"
											placeholder="Enter the product descripton here" required>
											</textarea>
									</div>
								</div>
							</div>


						</div>

						<div class="col-sm-12 panel panel-default" style="margin: 0 auto;">
							<div class="heading">
								<h4 class="pull-left">Variant</h4>
								<div class="clearfix"></div>
							</div>
							<div class="panel-body text-center">
								<div class="table-responsive" id="divVariants">
									<table
										class="variant-table table table-hover table-bordered text-center"
										id="variant-table">
										<thead>
											<tr>
												<!-- <th class="text-center">Remove from sale</th> -->
												<th class="text-center">SKU</th>
												<th class="text-center">Color</th>
												<th class="text-center">Size</th>
												<th class="text-center">Price</th>
											    <th class="text-center">Weight</th>
											    <th class="text-center">Current Stock</th>
												<th class="text-center">Add Stock</th>
												<th class="text-center">Delete Stock</th>
											</tr>
										</thead>
										<tbody id="varianttbodyid">
											<tr id="variantrow1">
												<!-- <td><input type="checkbox" class="form-control"
													name="sale" id="sale"></td>
 -->
												<td><input type="text" class="form-control" name="sku"
													id="sku1" placeholder="Enter SKU" required></td>
												<td><input type="text" class="form-control"
													name="colour" id="colour1" placeholder="Enter Color"
													required></td>
												<td><input type="text" class="form-control" name="size"
													id="size1" placeholder="Enter Size" required></td>
												<td><input type="text" class="form-control"
													name="price" id="price1" placeholder="Enter Price" required></td>
												<td><input type="text" class="form-control"
													name="weight" id="weight" placeholder="Enter weight" required></td>
												<td><input type="text" class="form-control"
													name="currentstock" id="currentstock"
													placeholder="Current Stock"></td>
												<td><input type="text" class="form-control"
													name="addstock" id="addstock" placeholder="Add Stock"></td>
												<td>
													<button id="variantrow1" onclick="variantDelete(this)">
														<span class="glyphicon glyphicon-trash"></span>
													</button>
												</td>

												<!-- <tr> -->
												<!-- <td class="text-center" colspan="6" align="center">
													<button id="addrow1" onclick="myFunction(this)"
														class="add-row">+</button>
												</td> -->
											</tr>
											<!-- </tr> -->
										</tbody>
										<tr>
											<td class="text-center add-row-plus" colspan="8"
												align="center">
												<button id="addrow1" onclick="myFunction(this)"
													class="add-row"
													style="border: none; background: transparent;">+</button>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>

						<!-- ./product content -->
						<!-- ./user settings content -->
					</form>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="clearfix"></div>

	<!-- ./product modal -->
	<!-- JS Files -->
	<script src="https://sdk.amazonaws.com/js/aws-sdk-2.77.0.min.js"></script>
	<%@include file="merchantFooter.jsp"%>
	<script>
		$(document)
				.ready(
						function() {
							//createAlbum("productimages");
							$("#spin").spinner({
								background: "rgba(0,0,0,0.6)"
								, html: "<i class='fa fa-repeat' style='color: #fff;'></i>"
							});
							$("#spin").show();
							$("#listProdcutID").hide();
							$
									.ajax({
										type : "GET",
										contentType : "application/json; charset=utf-8",
										url : "/trendSetr/rest/products/"
												+ $("#hiddenUID").val(),
										dataType : "json",
										success : function(responseData, status) {
											//	console.log(responseData);
											//console.log("response Data Check!")
											if (responseData != null) {
												/* console
														.log("response Data Check!")
												console.log(responseData) */
												var productListHTML = "";
												$
														.each(
																responseData,
																function(index,
																		value) {
																	/* var pv = JSON.stringify(this.productVariant);
																	var pv1 = JSON.parse(pv); //this.productVariant.price;
																	alert(pv1.price); */
																	/* 	console.log(this.productVariant.price); */
																	//alert(this.productImages.image);
																	productListHTML = productListHTML
																			+ '<li>'
																			+ '<div class="product">'
																			+ '<a href="#" onClick="getImageData(this)" pid = '
																			+ this.id
																			+ ' data-toggle="modal" data-target="#add-product-modal">'
																			+ '<figure>'
																			+ '<img src="'+this.productImages.image+'" alt="img">'
																			+ '<figcaption>'
																			+ '<div style="background-image: url('
																			+ this.productImages.image
																			+ ');"></div>'
																			+ '<span>'
																			+ '<ul class="product-name-price list-unstyled text-center">'
																			+ '<li style="text-transform:capitalize;"><b>'
																			+ this.name
																			+ " - $"
																			+ this.productVariant.price
																			+ '</b></li>'
																			+ '</ul>'
																			+ '</span>'
																			+ '</figcaption>'
																			+ '</figure>'
																			+ '</a>'
																			+ '</div>'
																			+ '</li>';
																});

											}
											$("#listProdcutID").html(
													productListHTML);
										},
										error : function(request, status, error) {
											alert("request.." + request);
											alert("status.." + status);
											alert("error.." + error);
										}

									});
							setTimeout(function(){
								$("#spin").hide();
							}, 2000);
							$("#listProdcutID").show();

						})

		function getImageData(fldObj) {
			$("#saveProductId").hide();
			$("#updateProductId").show();
			var productID = $(fldObj).attr("pid");
			$('#varianttbodyid').empty();
			$('#varianttbodyid').append("<tr id='samplrTrID'></tr>");

			$('#displayImageID').attr('src', "").removeClass('show');
			$('.upload-image > span:first-child').show();

			$('#displayImageID1').attr('src', "").removeClass('show');
			$('.upload-image > span:first-child').show();

			$('#displayImageID2').attr('src', "").removeClass('show');
			$('.upload-image > span:first-child').show();

			$('#displayImageID3').attr('src', "").removeClass('show');
			$('.upload-image > span:first-child').show();

			$
					.ajax({
						type : "GET",
						contentType : "application/json; charset=utf-8",
						url : "/trendSetr/rest/products/product/" + productID,
						dataType : "json",
						success : function(responseData, status) {
							console.log(responseData);
							if (responseData != null) {
								// alert(responseData[0].gender);
								$("#hiddenProductID").val(responseData[0].id);
								$("#productname").val(responseData[0].name);
								$("#gender").val(responseData[0].gender)
										.change();

								setTimeout(
										function() {
											$("#category").val(
													responseData[0].categoryId)
													.change();
											$("#subcategory")
													.val(
															responseData[0].subcategoryId)
													.change();

											$("#description")
													.val(
															responseData[0].description);
											$
													.each(
															responseData[0].productImagesList,
															function(index,
																	value) {

																var i = 0;
																//alert(this.type);
																if (this.type == "Primary") {
																	$(
																			"#productimageID")
																			.val(
																					this.id);
																	$(
																			'#displayImageID')
																			.attr(
																					'src',
																					this.image)
																			.removeClass(
																					'hide');
																	$(
																			'.upload-image > span:first-child')
																			.hide();
																	$(
																			"#productimage")
																			.val(
																					this.image);
																} else if (this.type == "Secondary1") {

																	$(
																			"#productimageID1")
																			.val(
																					this.id);

																	$(
																			'#displayImageID1')
																			.attr(
																					'src',
																					this.image)
																			.removeClass(
																					'hide');
																	$(
																			'.upload-image > span:first-child')
																			.hide();
																	$(
																			"#productimage1")
																			.val(
																					this.image);

																} else if (this.type == "Secondary2") {
																	$(
																			"#productimageID2")
																			.val(
																					this.id);

																	$(
																			'#displayImageID2')
																			.attr(
																					'src',
																					this.image)
																			.removeClass(
																					'hide');
																	$(
																			'.upload-image > span:first-child')
																			.hide();
																	$(
																			"#productimage2")
																			.val(
																					this.image);

																} else if (this.type == "Secondary3") {
																	$(
																			"#productimageID3")
																			.val(
																					this.id);

																	$(
																			'#displayImageID3')
																			.attr(
																					'src',
																					this.image)
																			.removeClass(
																					'hide');
																	$(
																			'.upload-image > span:first-child')
																			.hide();
																	$(
																			"#productimage3")
																			.val(
																					this.image);

																}
															});

											var gtinRows = 0;
											$
													.each(
															responseData[0].productVariantList,
															function(index,
																	value) {
																var gnitTable = "";

																gnitTable = gnitTable
																		+ +'<tr id="'+this.id+'">'
																		+ '<tr id="'+this.id+'">'
																		/* + '<td><input type="checkbox" class="form-control" name="sale" id="sale'+this.id+'"></td>' */
																		+ '<td><input type="text" class="form-control" name="sku" id="sku'+this.id+'" placeholder="Enter SKU" value="'+this.skuId+'" required></td>'
																		+ '<td><input type="text" class="form-control" name="colour" id="colour'+this.id+'" placeholder="Enter Color" value="'+this.colour+'" required></td>'
																		+ '<td><input type="text" class="form-control" name="size" id="size'+this.id+'" placeholder="Enter Size" value="'+this.size+'" required></td>'
																		+ '<td><input type="text" class="form-control" name="price" id="price'+this.id+'" placeholder="Enter Price" value="'+this.price+'" required> </td>'
																		+ '<td><input type="text" class="form-control" name="weight" id="weight'+this.id+'" placeholder="Enter weight" value="'+this.weight+'" required> </td>'
																		+ '<td><input type="text" class="form-control" name="currentstock" id="cStock'+this.id+'" placeholder="Enter Current Stock" value="'+this.quantity+'" readonly> </td>'
																		+ '<td><input type="text" class="form-control" name="addstock" id="aStock'+this.id+'" placeholder="Add Stock" value="'+this.addStock+'" > </td>'
																		+ '<td><input type="text" class="form-control" name="removestock" id="rStock'+this.id+'" placeholder="Remove Stock" value="'+this.removeStock+'" > </td>'
																		+ '<td> <button id="'
																		+ this.id
																		+ '" onclick="variantDelete(this)"> <span class="glyphicon glyphicon-trash"></span> </button> </td> </tr>';
																/* + '<td class="text-center" colspan="8" align="center"> <button id="addrow'
																+ gtinRows
																+ '" onclick="myFunction(this)" class="add-row">+ </button></td> </tr>'; */
																$(
																		'#varianttbodyid tr:last')
																		.after(
																				gnitTable);
																gtinRows++;
															});
											$('#variantrow1').remove();
											$('#samplrTrID').remove();
										}, 1000);
							}
						},
						error : function(request, status, error) {
							alert("request.." + request);
							alert("status.." + status);
							alert("error.." + error);
						}

					});

		}

		function myFunction(fldObj) {
			var rowCount = $(fldObj).attr('id');
			rowCount = rowCount.replace(/[A-Za-z$-]/g, "");
			rowCount = parseInt(rowCount);
			var maxRowNum = [];

			var gtinVals = $("#divVariants").find("tr");
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
					+ '<td><input type="text" class="form-control" name="sku" id="sku'+gtinRows+'" placeholder="Enter SKU" required></td>'
					+ '<td><input type="text" class="form-control" name="colour" id="colour'+gtinRows+'" placeholder="Enter Color" required></td>'
					+ '<td><input type="text" class="form-control" name="size" id="size'+gtinRows+'" placeholder="Enter Size" required></td>'
					+ '<td><input type="text" class="form-control" name="price" id="price'+gtinRows+'" placeholder="Enter Price" required> </td>'
					+ '<td><input type="text" class="form-control" name="price" id="weight'+gtinRows+'" placeholder="Enter weight" required> </td>'
					+ '<td><input type="text" class="form-control" name="currentStock" id="cStock'+gtinRows+'" placeholder="Current Stock" value="0" readonly></td>'
					+ '<td><input type="text" class="form-control" name="addStock" id="aStock'+gtinRows+'" placeholder="Add Stock" required></td>'
					+ '<td><input type="text" class="form-control" name="removeStock" id="rStock'+gtinRows+'" placeholder="Remove Stock" required></td>'
					+ '<td> <button id = "variantrow'
					+ gtinRows
					+ '" onclick="variantDelete(this)"> <span class="glyphicon glyphicon-trash"></span> </button> </td> </tr>';
			/* + '<td class="text-center" colspan="8" align="center"> <button id="addrow'
			+ gtinRows
			+ '" onclick="myFunction(this)" class="add-row">+ </button></td> </tr>'; */
			$('#varianttbodyid tr:last').after(gnitTable);

		}

		function save() {
		}
		/* for deleting variants row */

		$('document').on('click', '#deletebutton', function(e) {
			$(this).closest('tr').remove()
		});
	</script>
	<script>
		function addProduct() {
			$("#saveProductId").hide();
			$("#updateProductId").show();
			var gtinVals = $("#divVariants").find("tr");
			console.log(gtinVals[1]);
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

						if (textboxID.startsWith("sku"))
							variant = variant + '"skuId": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("colour"))
							variant = variant + '"colour": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("size"))
							variant = variant + '"size": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("price"))
							variant = variant + '"price": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("weight"))
							variant = variant + '"weight": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("cStock"))
							variant = variant + '"quantity": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("aStock"))
							variant = variant + '"addStock": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("rStock"))
							variant = variant + '"removeStock": "'
									+ $("#" + textboxID).val() + '"';

					});//removeStock

					if (index + 2 == gtinVals.length)
						variant = variant + '}';
					else
						variant = variant + '},';
					variants = variants + variant;
				}
			});

			if ($("#productimage").val() == "")
					 {
				alert("please select primary image")
				return false;
			} else {

				var productImage = '{';
				productImage = productImage + '"image": "'
						+ $("#productimage").val() + '",' + '"type": "Primary"';
				productImage = productImage + '},';
				productImage = productImage + '{' + '"image": "'
						+ $("#productimage1").val() + '",'
						+ '"type": "Secondary1"';
				productImage = productImage + '},';
				productImage = productImage + '{' + '"image": "'
						+ $("#productimage2").val() + '",'
						+ '"type": "Secondary2"';
				productImage = productImage + '},';
				productImage = productImage + '{' + '"image": "'
						+ $("#productimage3").val() + '",'
						+ '"type": "Secondary3"';
				productImage = productImage + '}';

			}

			//alert(productImage);

			var input = '{';

			input = input + '"name": "' + $('#productname').val() + '",'
					+ '"gender": "' + $('#gender').val() + '",'
					+ '"categoryId": "' + $('#category').val() + '",'
					+ '"subcategoryId": "' + $('#subcategory').val() + '",'
					+ '"categoryName": "'
					+ $('#category option:selected').text() + '",'
					+ '"createdBy": "' + $("#hiddenUID").val() + '",'
					+ '"description": "' + $('#description').val() + '",'
					+ '"productVariantList": [' + variants + '],'
					+ '"productImagesList": [' + productImage + ']';
			//"productVariantList" : [variants];
			input = input + '}';
			//alert(input);
			$.ajax({
				type : "POST",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/products/addproduct",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					document.addproduct.action = "./productManagement.jsp"
					document.addproduct.submit();
				},
				error : function(request, status, error) {
					//alert("Error");
					document.addproduct.action = "./productManagement.jsp"
					document.addproduct.submit();

				}
			});

		}

		function updateProduct() {
			var gtinVals = $("#divVariants").find("tr");
			console.log(gtinVals[1]);
			var variants = "";
			//alert(gtinVals.length);
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

						if (textboxID.startsWith("sku"))
							variant = variant + '"skuId": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("colour"))
							variant = variant + '"colour": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("size"))
							variant = variant + '"size": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("price"))
							variant = variant + '"price": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("weight"))
							variant = variant + '"weight": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("cStock"))
							variant = variant + '"quantity": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("aStock"))
							variant = variant + '"addStock": "'
									+ $("#" + textboxID).val() + '",';
						else if (textboxID.startsWith("rStock"))
							variant = variant + '"removeStock": "'
									+ $("#" + textboxID).val() + '"';
					});
					if (index + 2 == gtinVals.length)
						variant = variant + '}';
					else
						variant = variant + '},';
					variants = variants + variant;
				}
			});
			if ($("#productimage").val() == "") {
				alert("please select primary image")
				return false;
			} else {

				var productImage = '{';
				productImage = productImage + '"image": "'
						+ $("#productimage").val() + '",'
						+ '"type": "Primary",' + '"id": "'
						+ $("#productimageID").val() + '"';
				productImage = productImage + '},';
				productImage = productImage + '{' + '"image": "'
						+ $("#productimage1").val() + '",'
						+ '"type": "Secondary1",' + '"id": "'
						+ $("#productimageID1").val() + '"';
				productImage = productImage + '},';
				productImage = productImage + '{' + '"image": "'
						+ $("#productimage2").val() + '",'
						+ '"type": "Secondary2",' + '"id": "'
						+ $("#productimageID2").val() + '"';

				productImage = productImage + '},';
				productImage = productImage + '{' + '"image": "'
						+ $("#productimage3").val() + '",'
						+ '"type": "Secondary3",' + '"id": "'
						+ $("#productimageID3").val() + '"';
				productImage = productImage + '}';
			}

			var input = '{';

			input = input + '"id": "' + $("#hiddenProductID").val() + '",'
					+ '"name": "' + $('#productname').val() + '",'
					+ '"categoryId": "' + $('#category').val() + '",'
					+ '"subcategoryId": "' + $('#subcategory').val() + '",'
					+ '"gender": "' + $('#gender').val() + '",'
					+ '"categoryName":"'
					+ $('#category option:selected').text() + '",'
					+ '"createdBy": "' + $("#hiddenUID").val() + '",'
					+ '"description": "' + $('#description').val() + '",'
					+ '"productVariantList": [' + variants + '],'
					+ '"productImagesList": [' + productImage + ']';
			//"productVariantList" : [variants];
			input = input + '}';
			$.ajax({
				type : "PUT",
				contentType : "application/json; charset=utf-8",
				url : "/trendSetr/rest/products",
				data : input,
				dataType : "json",
				success : function(responseData, status) {
					document.addproduct.action = "./productManagement.jsp"
					document.addproduct.submit();
				},
				error : function(request, status, error) {
					document.addproduct.action = "./productManagement.jsp"
					document.addproduct.submit();

				}
			});
		}

		function variantDelete(fldObj) {
			var rowId = $(fldObj).attr('id');
			$("#" + rowId).remove();
		}

		function getCategory() {

			$
					.ajax({
						type : "GET",
						contentType : "application/json; charset=utf-8",
						url : "/trendSetr/rest/products/product/category/"
								+ $("#gender").val(),
						dataType : "json",
						success : function(responseData, status) {

							var dropDowns = '<option value="0">Select Category</option> ';

							$.each(responseData, function(index, value) {
								dropDowns += '<option value="'+this.id+'">'
										+ this.categoryName + '</option> ';
							});

							$("#category").html(dropDowns);

						},
						error : function(request, status, error) {
							alert("Error");

						}
					});

		}

		function newProductPU() {
			$("#saveProductId").show();
			$("#updateProductId").hide();
			$("#productimage").val("");
			$("#productimage1").val("");
			$("#productimage2").val("");
			$("#productimage3").val("");
			$("#productname").val("");
			$("#gender").val("");
			$("#category").val("");
			$("#subcategory").val("");
			$("#description").val("");
			$('#varianttbodyid').empty();
			$('#varianttbodyid').append("<tr id='samplrTrID'></tr>");
			var initial = '<tr id="variantrow1">'
					/* + '<td><input type="checkbox" class="form-control" name="sale" id="sale"></td>' */
					+ '<td><input type="text" class="form-control" name="sku" id="sku1" placeholder="Enter SKU" required></td>'
					+ '<td><input type="text" class="form-control" name="colour" id="colour1" placeholder="Enter Color" required></td>'
					+ '<td><input type="text" class="form-control" name="size" id="size1" placeholder="Enter Size" required> </td>'
					+ '<td><input type="text" class="form-control" name="price" id="price1" placeholder="Enter Price" required></td>'
					+ '<td><input type="text" class="form-control" name="weight" id="weight" placeholder="Enter weight" required></td>'
					+ '<td><input type="text" class="form-control" name="currentStock" id="cStock1" placeholder="Current Stock" value="0" readonly></td>'
					+ '<td><input type="text" class="form-control" name="addStock" id="aStock1" placeholder="Add Stock" required></td>'
					+ '<td><input type="text" class="form-control" name="removeStock" id="rStock1" placeholder="Remove Stock" required></td>'
					+ '<td><button id="variantrow1" onclick="variantDelete(this)"><span class="glyphicon glyphicon-trash"></span></button></td>'
					/* + '<td class="text-center" colspan="6" align="center"> <button id="addrow1" onclick="myFunction(this)" class="add-row">+</button></td>' */
					+ '</tr>"';
			$('#varianttbodyid tr:last').after(initial);
			$('#varianttbodyid').append(initial);
			$('#samplrTrID').remove();
			$('#variantrow1').remove();
		}

		// AWS intgration for products to save in s3

		$('.upload-image').on('click', function(e) {
			e.preventDefault();
			$(this).next().trigger('click');
		});

		// only for debugging

		/*   $('input[type=file]').on('change', function(e) {
			e.preventDefault();
			var file = e.target.files[0];
			var filePath = URL.createObjectURL(file);
			alert("pavan "+ filePath);
			$('#displayImageID .text').hide();
			$('#displayImageID').removeClass('hide');
			$('#displayImageID').attr('src', filePath);
			addPhoto("productimages", e.target.files);
		});  */

		/* $('#profileimage').on('change', function(e) {
			e.preventDefault();
			var file = e.target.files[0];
			var filePath = URL.createObjectURL(file);
			alert(filePath);
			$('#profileimage .text').hide();
			$('#profileimage').removeClass('hide');
			$('#profileimage').attr('src', filePath);
			addPhoto("productimages", e.target.files);
		}); */

		//aws upload
		var albumBucketName = 'trendsetr';
		var bucketRegion = 'us-east-2';
		var IdentityPoolId = 'us-east-2:c5c0765a-bd5e-44b8-b23e-7505377a7644';

		AWS.config.update({
			region : bucketRegion,
			credentials : new AWS.CognitoIdentityCredentials({
				IdentityPoolId : IdentityPoolId
			})
		});

		var s3 = new AWS.S3({
			apiVersion : '2006-03-01',
			params : {
				Bucket : albumBucketName
			}
		});

		//creates an album if does not exists
		function createAlbum(albumName) {
			alert("hi");
			albumName = albumName.trim();
			if (!albumName) {
				return alert('Album names must contain at least one non-space character.');
			}
			if (albumName.indexOf('/') !== -1) {
				return alert('Album names cannot contain slashes.');
			}
			var albumKey = encodeURIComponent(albumName) + '/';
			alert(albumKey);
			s3.headObject({
				Key : albumKey
			}, function(err, data) {
				if (!err) {
					return false;
				}
				if (err.code !== 'NotFound') {
					return alert('There was an error creating your album: '
							+ err.message);
				}
				s3.putObject({
					Key : albumKey
				}, function(err, data) {
					if (err) {
						return alert('There was an error creating your album: '
								+ err.message);
					} else {
						alert("sucess");
					}
				});
			});
		}

		//createAlbum("productimages");

		function addPhoto(albumName, files, imageType) {
			//var files = document.getElementById('photoupload').files;
			if (!files.length) {
				return alert('Please choose a file to upload first.');
			}
			var file = files[0];
			var fileName = file.name;
			var albumPhotosKey = encodeURIComponent(albumName) + '//';

			var photoKey = albumPhotosKey + fileName;
			$("#spin1").spinner({
				background: "rgba(0,0,0,0.6)"
				, html: "<i class='fa fa-repeat' style='color: #fff;'></i>"
			});
			$("#spin1").show();
			s3.upload({
				Key : photoKey,
				Body : file,
				ACL : 'public-read'
			}, function(err, data) {
				if (err) {
					return alert('There was an error uploading your photo: ',
							err.message);
				}
				alert('Successfully uploaded photo.');
				console.log(data);
				if (imageType == "uploadimg")
					$("#productimage").val(data.Location);
				else if (imageType == "uploadimg1")
					$("#productimage1").val(data.Location);
				else if (imageType == "uploadimg2")
					$("#productimage2").val(data.Location);
				else if (imageType == "uploadimg3")
					$("#productimage3").val(data.Location);
				setTimeout(function(){
					$("#spin1").hide();
				}, 2000);
			});
		}

		function uploadimg() {
			var file = $('#image')[0].files[0]
			var filePath = URL.createObjectURL(file);

			$('#displayImageID .text').hide();
			$('#displayImageID').removeClass('hide');
			$('#displayImageID').attr('src', filePath);
			addPhoto("productimages", $('#image')[0].files, "uploadimg");
		}

		function uploadimg1() {
			var file = $('#image1')[0].files[0]
			var filePath = URL.createObjectURL(file);

			$('#displayImageID1 .text').hide();
			$('#displayImageID1').removeClass('hide');
			$('#displayImageID1').attr('src', filePath);
			addPhoto("productimages", $('#image1')[0].files, "uploadimg1");
		}

		function uploadimg2() {
			var file = $('#image2')[0].files[0]
			var filePath = URL.createObjectURL(file);

			$('#displayImageID2 .text').hide();
			$('#displayImageID2').removeClass('hide');
			$('#displayImageID2').attr('src', filePath);
			addPhoto("productimages", $('#image2')[0].files, "uploadimg2");
		}

		function uploadimg3() {
			var file = $('#image3')[0].files[0]
			var filePath = URL.createObjectURL(file);

			$('#displayImageID3 .text').hide();
			$('#displayImageID3').removeClass('hide');
			$('#displayImageID3').attr('src', filePath);
			addPhoto("productimages", $('#image3')[0].files, "uploadimg3");
		}
		
		$(function(){
			$("#spin").spinner({
				background: "rgba(0,0,0,0.6)"
				, html: "<i class='fa fa-repeat' style='color: #fff;'></i>"
			});
			
			$("#show").click(function(){
				$("#spin").show();

				setTimeout(function(){
					$("#spin").hide();
				}, 1000);
			});
		});
	</script>
</body>

</html>
 