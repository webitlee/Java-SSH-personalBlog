<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/admin/html/login_verification.html" %>
<!DOCTYPE html>
<html lang="zh_CN">
	<head>
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>BlackLee的博客</title>

		<!-- Fav and touch icons -->
		<link rel="shortcut icon" href="admin/proton/assets/ico/favicon.ico" type="image/x-icon" />

	    <!-- Css files -->
	    <link href="admin/proton/assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="admin/proton/assets/css/jquery.mmenu.css" rel="stylesheet">
		<link href="admin/proton/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="admin/proton/assets/css/climacons-font.css" rel="stylesheet">
		<link href="admin/proton/assets/plugins/xcharts/css/xcharts.min.css" rel=" stylesheet">
		<link href="admin/proton/assets/plugins/fullcalendar/css/fullcalendar.css" rel="stylesheet">
		<link href="admin/proton/assets/plugins/morris/css/morris.css" rel="stylesheet">
		<link href="admin/proton/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
		<link href="admin/proton/assets/plugins/jvectormap/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
	    <link href="admin/proton/assets/css/style.min.css" rel="stylesheet">
		<link href="admin/proton/assets/css/add-ons.min.css" rel="stylesheet">
		<link href="admin/proton/assets/css/common.css" rel="stylesheet"/>

	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
</head>

<body>
	<!-- start: Header -->
	 <%@include file="/admin/html/header.html" %>
	<!-- end: Header -->
	
	<div class="container-fluid content">
	
		<div class="row">
			<!-- start: Main Menu -->
			<%@include file="/admin/html/left_menu.html"%>
			<!-- end: Main Menu -->
		
			<!-- start: Content -->
			<div class="main">
						
			</div>
			<!-- end: Content -->
			<br><br><br>
		</div>			
		
	</div><!--/container-->
		
	
	<!-- start: JavaScript-->
	<!--[if !IE]>-->

			<script src="admin/proton/assets/js/jquery-2.1.1.min.js"></script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script src="admin/proton/assets/js/jquery-1.11.1.min.js"></script>
	
	<![endif]-->

	<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='admin/proton/assets/js/jquery-2.1.1.min.js'>"+"<"+"/script>");
		</script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script type="text/javascript">
	 	window.jQuery || document.write("<script src='admin/proton/assets/js/jquery-1.11.1.min.js'>"+"<"+"/script>");
		</script>
		
	<![endif]-->
	<script src="admin/proton/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="admin/proton/assets/js/bootstrap.min.js"></script>
	<!-- page scripts -->
   	<script src="admin/proton/assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
 	<script src="admin/proton/assets/plugins/datatables/js/jquery.dataTables.min.js"></script>
   	<script src="admin/proton/assets/plugins/datatables/js/dataTables.bootstrap.min.js"></script>

   	<!-- theme scripts -->
   	<script src="admin/proton/assets/js/SmoothScroll.js"></script>
   	<script src="admin/proton/assets/js/jquery.mmenu.min.js"></script>
   	<script src="admin/proton/assets/js/core.min.js"></script>
   	
	<!-- end: JavaScript-->
	
</body>
</html>