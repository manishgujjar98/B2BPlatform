<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- include merchant navigation -->
<%@include file="merchantStyles.jsp"%>
<title>Manage Stock Page</title>
</head>
<body>
	<div class="col-sm-12 mt20">
		<table
			class="manage-stock-table table table-hover table-bordered text-center"
			id="manage-stock-table">
			<thead style="background-color: #315CF2;">
				<tr>
					<th class="text-center">SKU</th>
					<th class="text-center">Color</th>
					<th class="text-center">Size</th>
					<th class="text-center">Current Stock</th>
					<th class="text-center">Add Stock</th>
				</tr>
			</thead>
			<tbody id="managestockbodyid">
				<tr id="managestockrow1">
					<td><input type="text" class="form-control" name="sku"
						id="sku1" placeholder="Enter SKU" required></td>
					<td><input type="text" class="form-control" name="colour"
						id="colour1" placeholder="Enter Color" required></td>
					<td><input type="text" class="form-control" name="size"
						id="size1" placeholder="Enter Size" required></td>
					<td><input type="text" class="form-control"
						name="currentstock" id="price1" placeholder="Enter Current Stock"
						required></td>
					<td><input type="text" class="form-control" name="addtstock"
						id="price1" placeholder="Add Stock" required></td>

				</tr>

			</tbody>
		</table>
		<button class="btn btn-sample text-center add-stock-button center-block"
			id="add-stock-button" type="submit" onclick=""
			style="background-color: #315CF2; color: white; padding: 5px 35px 5px 35px; font-size: 16px;">Save</button>

	</div>
	<!-- JS Files -->
	<%@include file="merchantFooter.jsp"%>
</body>
</html>