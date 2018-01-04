<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="0">

<link rel="shortcut icon" href="../favicon.ico">
<!-- Material design icons -->
<link rel="stylesheet"
	href="https://storage.googleapis.com/code.getmdl.io/1.0.4/material.red-purple.min.css">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.2.1/material.indigo-pink.min.css" />
<!-- Material design fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	type="text/css">
<!-- bootstrap -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- custom styles -->
<link rel="stylesheet" href="../css/app.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.js"></script>
<!--[if IE]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
html, body {
	background-color: #eee;
}

@media screen and (min-width:600px) and (max-width:800px) {
	#add-influencer-modal .modal-dialog, #edit-influencer-modal .modal-dialog,
		#add-merchant-modal .modal-dialog, #edit-merchant-modal .modal-dialog,
		#add-employee-modal .modal-dialog, #edit-employee-modal .modal-dialog
		{
		width: 700px !important;
	}
}

@media screen and (max-width:768px) {
	.box {
		margin: 0 auto;
	}
	.wid50 {
		width: 50%;
	}
}

/* side bar for admin dashboard */
.sidebar-container {
	display: block;
	width: 0;
	background: rgba(0, 0, 0, 0.8);
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	z-index: 99;
	height: 100vh;
}

.sidebar-container.open {
	width: 100%;
}

.sidebar-container.open .sidebar-menu {
	left: 0;
	-webkit-transition: all .25s ease-in;
	transition: all .25s ease-in;
}

.sidebar-container .sidebar-menu {
	position: absolute;
	left: -250px;
	height: 100vh;
	top: 0;
	background: rgba(0, 0, 0, 0.4);
	width: 250px;
	-webkit-transition: all .25s ease-in;
	transition: all .25s ease-in;
}

.sidebar-container .sidebar-menu .image-holder {
	text-align: center;
	margin-top: 35px;
	display: block;
	padding: 10px 0;
	box-sizing: border-box;
}

.sidebar-container .sidebar-menu .image-holder img {
	width: 100px;
	height: 100px;
	border-radius: 100%;
	border: 1px solid #effefe2;
}

.sidebar-container .sidebar-menu .image-holder figcaption {
	color: #fff;
	padding: 10px 0;
}

.sidebar-container .sidebar-menu .list-group .list-group-item {
	background: rgba(0, 0, 0, 0.4);
	border-radius: 0;
	border: 0;
	padding: 15px 10px;
}

.sidebar-container .sidebar-menu .list-group .list-group-item:hover {
	border-left: 2px solid red;
	transition: all .2s ease-in;
	transition: all .2s ease-in;
	background: #ccc;
}

.sidebar-container .sidebar-menu .list-group .list-group-item:hover a {
	color: #000;
}

.sidebar-container .sidebar-menu .list-group .list-group-item a {
	color: #fff;
	text-decoration: none;
	text-transform: uppercase;
}

.sidebar-container .sidebar-menu .menu-close {
	width: 35px;
	height: 35px;
	line-height: 35px;
	float: right;
	background: rgba(0, 0, 0, 0.9);
	text-align: center;
	color: #fff;
	cursor: pointer;
	font-weight: bolder;
}

.sidebar-container .sidebar-menu .menu-close:hover {
	background: #fff;
	color: #000;
	-webkit-transition: all 0.3s ease-in;
	transition: all 0.3s ease-in;
	text-decoration: none;
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

.admin-header {
	background-color: black;
}

.logo-container h1 a {
	color: white;
	text-decoration: none;
}

.toggle-menu {
	z-index: 55;
	box-shadow: none;
	border: transparent;
	margin-left: -20px;
}

#adminprofileimage img {
	width: 100px !important;
	height: 100px !important;
	border-radius: 100%;
}

.admin-header-margin {
	position: relative;
	top: 30px;
}

.mdl-layout__drawer .mdl-navigation {
	padding: 0;
	margin-top: 40px;
}

.mdl-layout__drawer .mdl-navigation .mdl-navigation__link {
	color: white;
	text-decoration: none;
}

.mdl-layout__drawer .mdl-navigation .mdl-navigation__link:hover {
	color: black;
}

.mdl-layout__header .f:active {
	background-color: transparent !important;
	box-shadow: none !important;
	opacity: .5;
}

.mdl-layout__header {
	background-color: transparent !important;
	box-shadow: none !important;
}

.mdl-layout__obfuscator.is-visible {
	position: absolute;
}

.mdl-layout__drawer.is-visible {
	transform: translateX(0);
	z-index: -1;
}

#admin-dashboard {
	transform: translate3d(0, 0, 0);
}
</style>
<script>
	/* $(document).ready(function() {
		alert($("#hiddenRoleId").val());

	}); */
	/* alert("hi"); */
	<%-- var roleId = <%=session.getAttribute("roleId")%>;
	/* alert(roleId); */
	var element = document.getElementById("employee");
	if(roleId == 4 || roleId == "4"){
		/* alert(roleId); */
		element.style.display = "none";
		/* alert(roleId); */
	} --%>
	
</script>

