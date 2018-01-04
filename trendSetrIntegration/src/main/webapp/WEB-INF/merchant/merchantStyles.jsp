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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- custom styles -->
<link rel="stylesheet" href="../css/app.css">
<!-- Upload files -->
<meta name="description"
	content="Demo for the tutorial: Styling and Customizing File Inputs the Smart Way" />
<meta name="keywords"
	content="cutom file input, styling, label, cross-browser, accessible, input type file" />
<meta name="author" content="Osvaldas Valutis for Codrops" />
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" type="text/css"
	href="/trendSetrIntegration/css/normalize.css" />
<!-- <link rel="stylesheet" type="text/css" href="/trendSetrIntegration/css/demo.css" /> -->
<link rel="stylesheet" type="text/css"
	href="/trendSetrIntegration/css/component.css" />
<link rel="stylesheet" type="text/css"
	href="/trendSetrIntegration/css/bootstrap-datetimepicker.min.css" />


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.js"></script>
	<!-- //updated 12/15 -->
	
<!--[if IE]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<style>
html, body {
	background-color: #eee;
}
/* side bar for merchant dashboard */
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
.title{
	padding: 1px;
}
</style>