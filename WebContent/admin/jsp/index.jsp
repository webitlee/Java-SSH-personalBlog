<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("administrator") == null){
		response.sendRedirect("/myBlogs/admin/html/login.html");
		return;
	}
%>
<!DOCTYPE html>
<html lang="zh_CN">
	<head>
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>BlackLee的博客</title>

		<!-- Fav and touch icons -->
		<link rel="shortcut icon" href="/myBlogs/admin/proton/assets/ico/favicon.ico" type="image/x-icon" />

	    <!-- Css files -->
	    <link href="/myBlogs/admin/proton/assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/css/jquery.mmenu.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/css/climacons-font.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/xcharts/css/xcharts.min.css" rel=" stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/fullcalendar/css/fullcalendar.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/morris/css/morris.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/jvectormap/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
	    <link href="/myBlogs/admin/proton/assets/css/style.min.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/css/add-ons.min.css" rel="stylesheet">

	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
</head>

<body>
	<!-- start: Header -->
	<div class="navbar" role="navigation">
	
		<div class="container-fluid">		
			
			<ul class="nav navbar-nav navbar-actions navbar-left">
				<li class="visible-md visible-lg"><a href="index.html#" id="main-menu-toggle"><i class="fa fa-th-large"></i></a></li>
				<li class="visible-xs visible-sm"><a href="index.html#" id="sidebar-menu"><i class="fa fa-navicon"></i></a></li>			
			</ul>
	        <ul class="nav navbar-nav navbar-right">
				<li class="dropdown visible-md visible-lg">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img class="user-avatar" src="/myBlogs/admin/proton/assets/img/avatar.jpg" alt="user-mail">jhonsmith@mail.com</a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header">
							<strong>Account</strong>
						</li>						
						<li><a href="page-profile.html"><i class="fa fa-user"></i> Profile</a></li>
						<li><a href="page-login.html"><i class="fa fa-wrench"></i> Settings</a></li>
						<li><a href="page-invoice.html"><i class="fa fa-usd"></i> Payments <span class="label label-default">10</span></a></li>
						<li><a href="gallery.html"><i class="fa fa-file"></i> File <span class="label label-primary">27</span></a></li>
						<li class="divider"></li>						
						<li><a href="index.html"><i class="fa fa-sign-out"></i> Logout</a></li>	
	        		</ul>
	      		</li>
				<li><a href="index.html"><i class="fa fa-power-off"></i></a></li>
			</ul>
			
		</div>
		
	</div>
	<!-- end: Header -->
	
	<div class="container-fluid content">
	
		<div class="row">
				
			<!-- start: Main Menu -->
			
			<%@include file="/admin/html/left_menu.html" %>
			<!-- end: Main Menu -->
		
		<!-- start: Content -->
		<div class="main">
		
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
						<li><i class="fa fa-laptop"></i>Dashboard</li>						  	
					</ol>
				</div>
			</div>
			
			<div class="row">
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box red-bg">
						<i class="fa fa-thumbs-o-up"></i>
						<div class="count">356K</div>
						<div class="title">Order</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box green-bg">
						<i class="fa fa-cubes"></i>
						<div class="count">425K</div>
						<div class="title">Stock</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box blue-bg">
						<i class="fa fa-cloud-download"></i>
						<div class="count">325K</div>
						<div class="title">Download</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box magenta-bg">
						<i class="fa fa-shopping-cart"></i>
						<div class="count">259K</div>
						<div class="title">Purchased</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->		
				
			</div><!--/.row-->
			
			<div class="row">
				
				<div class="col-lg-9 col-md-12">
					
					<div class="panel panel-default">
						
						<div class="panel-heading">
							<i class="fa fa-refresh red"></i><h2><strong>Real-time updates</strong></h2>
							
							<div class="panel-actions">
								<a href="index.html#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
								<a href="index.html#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								<a href="index.html#" class="btn-close"><i class="fa fa-times"></i></a>
							</div>					
						</div>
						
						<div class="panel-body">						
							</br/>							
							<div id="realtime-update" style="height:200px;color:#484848;"></div>
						</div>						
					</div>						
				</div><!--/col-->				
				<div class="col-lg-3 col-md-12">
					<div class="panel panel-default">					
						<div class="panel-body white-bg">						
							</br/>
							<div class="graph-container text-center">
								<div id="hero-donut" class="graph" style="height:236px;"></div>
							</div>	
						</div>
					</div>		
				</div><!--/.col-->		
				
			</div><!--/.row-->	

			<div class="row">	

				<div class="col-lg-6 col-md-12">
					
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2><i class="fa fa-map-marker red"></i><strong>Countries</strong></h2>
							<div class="panel-actions">
								<a href="index.html#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
								<a href="index.html#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								<a href="index.html#" class="btn-close"><i class="fa fa-times"></i></a>
							</div>	
						</div>
						<div class="panel-body">
							<div id="map" style="height:286px;"></div>	
						</div>
	
					</div>
						
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2><i class="fa fa-flag-o red"></i><strong>Registered Users</strong></h2>
							<div class="panel-actions">
								<a href="index.html#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
								<a href="index.html#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								<a href="index.html#" class="btn-close"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<div class="panel-body">
							<table class="table bootstrap-datatable countries">
								<thead>
									<tr>
										<th></th>
										<th>Country</th>
										<th>Users</th>
										<th>Online</th>
										<th>Performance</th>
									</tr>
								</thead>   
								<tbody>
									<tr>
										<td><img src="/myBlogs/admin/proton/assets/ico/flags/Germany.png" style="height:18px; margin-top:-2px;"></td>
										<td>Germany</td>
										<td>2563</td>
										<td>1025</td>
										<td>
											<div class="progress thin">
												<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="73" aria-valuemin="0" aria-valuemax="100" style="width: 73%">
												</div>
												<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="27" aria-valuemin="0" aria-valuemax="100" style="width: 27%">
											  	</div>
											</div>
											<span class="sr-only">73%</span>   	
										</td>
									</tr>
									<tr>
										<td><img src="/myBlogs/admin/proton/assets/ico/flags/India.png" style="height:18px; margin-top:-2px;"></td>
										<td>India</td>
										<td>3652</td>
										<td>2563</td>
										<td>
											<div class="progress thin">
												<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100" style="width: 57%">
												</div>
												<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="43" aria-valuemin="0" aria-valuemax="100" style="width: 43%">
												</div>
											</div>
											<span class="sr-only">57%</span>   	
										</td>
									</tr>
									<tr>
										<td><img src="/myBlogs/admin/proton/assets/ico/flags/Spain.png" style="height:18px; margin-top:-2px;"></td>
										<td>Spain</td>
										<td>562</td>
										<td>452</td>
										<td>
											<div class="progress thin">
												<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="93" aria-valuemin="0" aria-valuemax="100" style="width: 93%">
												</div>
												<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100" style="width: 7%">
											  	</div>
											</div>
											<span class="sr-only">93%</span>   	
										</td>
									</tr>
									<tr>
										<td><img src="/myBlogs/admin/proton/assets/ico/flags/Russia.png" style="height:18px; margin-top:-2px;"></td>
										<td>Russia</td>
										<td>1258</td>
										<td>958</td>
										<td>
											<div class="progress thin">
											  	<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
											  	</div>
												<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
											  	</div>
											</div>
											<span class="sr-only">20%</span>   	
										</td>
									</tr>
									<tr>
										<td><img src="/myBlogs/admin/proton/assets/ico/flags/usa.png" style="height:18px; margin-top:-2px;"></td>
										<td>USA</td>
										<td>4856</td>
										<td>3621</td>
										<td>
											<div class="progress thin">
											  	<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
											  	</div>
												<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
											  	</div>
											</div>
											<span class="sr-only">20%</span>   	
										</td>
									</tr>
									<tr>
										<td><img src="/myBlogs/admin/proton/assets/ico/flags/brazil.png" style="height:18px; margin-top:-2px;"></td>
										<td>Brazil</td>
										<td>265</td>
										<td>102</td>
										<td>
											<div class="progress thin">
											  	<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
											  	</div>
												<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
											  	</div>
											</div>
											<span class="sr-only">20%</span>   	
										</td>
									</tr>
								</tbody>
							</table>
						</div>
	
					</div>	

				</div><!--/col-->
				
				
				<div class="col-lg-3 col-md-12">
					
					<div class="panel panel-default">

						<div class="panel-body weather widget">
							
							<div class="today text-center">
								
								<h4 class="blue"><strong><i class="fa fa-map-marker fa-3x red"></i> Nevada</strong></h4>
								<i class="climacon snow moon"></i>
								
								
								<div class="row">
									
									<div class="col-xs-5 text-right date">
										<div>Thursday</div>
										<small>July, 10</small>
									</div><!--/.col-->
									
									<div class="col-xs-7 text-left temp">
										15Â°C
									</div><!--/.col-->	
									
								</div><!--/.row-->		
								
							</div>
							
							<div class="forecast row text-center">
								
								<div class="col-xs-4">
									<i class="climacon lightning sun"></i>
									<span class="label label-primary">MON</span>
									<p>40Â°C</p>
								</div><!--/.col-->
								
								<div class="col-xs-4">
									<i class="climacon snow moon"></i>
									<span class="label label-primary">TUE</span>
									<p>18Â°C</p>
								</div><!--/.col-->
								
								<div class="col-xs-4">
									<i class="climacon hail sun"></i>
									<span class="label label-primary">WED</span>
									<p>25Â°C</p>
								</div><!--/.col-->
								
							</div>												
							
						</div>
					</div>		
				
				</div><!--/.col-->
				
				<div class="col-lg-3 col-md-12">
					
					<div class="panel panel-default">

						<div class="panel-body weather widget">
							
							<div class="today text-center">
								
								<h4 class="blue"><strong><i class="fa fa-map-marker fa-3x red"></i> California</strong></h4>
								<i class="climacon rain"></i>
								
								
								<div class="row">
									
									<div class="col-xs-5 text-right date">
										<div>Thursday</div>
										<small>July, 10</small>
									</div><!--/.col-->
									
									<div class="col-xs-7 text-left temp">
										18Â°C
									</div><!--/.col-->	
									
								</div><!--/.row-->		
								
							</div>
							
							<div class="forecast row text-center">
								
								<div class="col-xs-4">
									<i class="climacon lightning sun"></i>
									<span class="label label-primary">MON</span>
									<p>35Â°C</p>
								</div><!--/.col-->
								
								<div class="col-xs-4">
									<i class="climacon fog sun"></i>
									<span class="label label-primary">TUE</span>
									<p>28Â°C</p>
								</div><!--/.col-->
								
								<div class="col-xs-4">
									<i class="climacon rain"></i>
									<span class="label label-primary">WED</span>
									<p>17Â°C</p>
								</div><!--/.col-->
								
							</div>												
							
						</div>
					</div>		
				
				</div><!--/.col-->
				
				<div class="col-lg-3 col-md-6">
					
					<div class="panel panel-default">
						
						<div class="panel-body text-center" style="height:230px">
							<h2 class="lime">Sold Out</h2>
							<div style="width:300px;left:50%;position:absolute;margin-left:-150px;">
								<canvas id="gauge1"></canvas>
							</div>
							<span class="pull-left"><strong class="blue">$256.256,25</strong></span>
							<span class="pull-right"><i class="fa fa-arrow-circle-o-up text-success"></i> 52%</span>
						</div>							
						
					</div>	
										
				</div><!--/.col-->
				
				<div class="col-lg-3 col-md-6">
					
					<div class="panel panel-default">
						
						<div class="panel-body text-center" style="height:230px">
							<h2 class="lime">Profit</h2>
							<div style="width:300px;left:50%;position:absolute;margin-left:-150px;">
								<canvas id="gauge2"></canvas>
							</div>
							<span class="pull-left"><strong class="blue">$125.365,56</strong></span>
							<span class="pull-right"><i class="fa fa-arrow-circle-o-up text-success"></i> 70%</span>
						</div>	
						
					</div>	
										
				</div><!--/.col-->
			</div><!--/row-->						
				
			<div class="row">	
				
				<div class="col-sm-12">
					
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2><i class="fa fa-bar-chart-o red"></i><strong>xCharts</strong></h2>
							<div class="panel-actions">
								<a href="charts-xcharts.html#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
								<a href="charts-xcharts.html#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								<a href="charts-xcharts.html#" class="btn-close"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<div class="panel-body">
							<figure class="demo" id="chart" style="height: 300px"></figure>
						</div>
					</div>
				
				</div><!--/col-->				
			
			</div><!--/row-->			
			
				
			<div class="row">			
				
				<div class="col-lg-6 col-md-12">
					
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2><i class="fa fa-spinner red"></i><strong>In Progress</strong></h2>
							<div class="panel-actions">
								<a href="index.html#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
								<a href="index.html#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								<a href="index.html#" class="btn-close"><i class="fa fa-times"></i></a>
							</div>
							<ul class="nav nav-tabs" id="recent">
							  	<li class="active"><a href="index.html#tasks">Tasks</a></li>
							  	<li><a href="index.html#tickets">Tickets</a></li>
							</ul>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div class="tab-pane active" id="tasks">
									<table class="table bootstrap-datatable datatable small-font">
										<thead>
											  <tr>
												  <th>Task</th>
												  <th>Assigned to</th>
												  <th>Progress</th>
												  <th class="center">Status</th>
											  </tr>
										  </thead>   
										  <tbody>
											<tr>
												<td>Package Usage</td>
												<td>Jenny Coe</td>
												<td>
													<div class="progress thin">
													  	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="73" aria-valuemin="0" aria-valuemax="100" style="width: 73%">
													    	<span class="sr-only">73% Complete (success)</span>
													  	</div>
													</div>
												</td>
												<td class="text-center text-info">
													Active
												</td>
											</tr>
											<tr>
												<td>Payment Process</td>
												<td>Jack Key</td>
												<td>
													<div class="progress thin">
													  	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" style="width: 95%">
													    	<span class="sr-only">95% Complete (success)</span>
													  	</div>
													</div>
												</td>
												<td class="text-center text-success">
													Active
												</td>
											</tr>
											<tr>
												<td>Web Development</td>
												<td>Jossy</td>
												<td>
													<div class="progress thin">
													  	<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="27" aria-valuemin="0" aria-valuemax="100" style="width: 27%">
													    	<span class="sr-only">27% Complete (success)</span>
													  	</div>
													</div>
												</td>
												<td class="text-center text-warning">
													Pending
												</td>
											</tr>
											<tr>
												<td>Web Error</td>
												<td>Alex Bram</td>
												<td>
													<div class="progress thin">
													  	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
													    	<span class="sr-only">50% Complete (success)</span>
													  	</div>
													</div>
												</td>
												<td class="text-center text-primary">
													Active
												</td>
											</tr>
											<tr>
												<td>Storage Capacity</td>
												<td>Jimmy Doe</td>
												<td>
													<div class="progress thin">
													  	<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="73" aria-valuemin="0" aria-valuemax="100" style="width: 73%">
													    	<span class="sr-only">73% Complete (success)</span>
													  	</div>
													</div>
												</td>
												<td class="text-center text-danger">
													Canceled
												</td>
											</tr>
											<tr>
												<td>Disk Performance</td>
												<td>Marcell</td>
												<td>
													<div class="progress thin">
													  	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
													    	<span class="sr-only">40% Complete (success)</span>
													  	</div>
													</div>
												</td>
												<td class="text-center text-primary">
													Active
												</td>
											</tr>
											<tr>
												<td>Yearly Services</td>
												<td>Morgan</td>
												<td>
													<div class="progress thin">
													  	<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="27" aria-valuemin="0" aria-valuemax="100" style="width: 27%">
													    	<span class="sr-only">27% Complete (success)</span>
													  	</div>
													</div>
												</td>
												<td class="text-center text-warning">
													Pending
												</td>
											</tr>											
										</tbody>
									</table>
								</div>	
							  	<div class="tab-pane" id="tickets">
									<table class="table bootstrap-datatable datatable small-font">
										<thead>
											<tr>
												<th>Status</th>
												<th>Date</th>
												<th>Description</th>
												<th>User</th>
												<th>Number</th>
											</tr>
										</thead>   
										<tbody>
											<tr>
												<td><span class="label label-success">Complete</span></td>
												<td>May 10, 2014 18:05</td>
												<td>Disk problem</td>
												<td>Gerry</td>
												<td><b>[#26915]</b></td>
											</tr>
											<tr>
												<td><span class="label label-warning">Suspended</span></td>
												<td>May 10, 2014 18:05</td>
												<td>Hosting Update</td>
												<td>Sarah</td>
												<td><b>[#25986]</b></td>
											</tr>
											<tr>
												<td><span class="label label-danger">Rejected</span></td>
												<td>May 10, 2014 18:05</td>
												<td>Trouble Connection</td>
												<td>Smith</td>
												<td><b>[#23695]</b></td>
											</tr>
											<tr>
												<td><span class="label label-info">In progress</span></td>
												<td>May 10, 2014 18:05</td>
												<td>Domain Performance </td>
												<td>George</td>
												<td><b>[#24587]</b></td>
											</tr>
											<tr>
												<td><span class="label label-success">Complete</span></td>
												<td>May 10, 2014 18:05</td>
												<td>Paypal Registration</td>
												<td>Justin</td>
												<td><b>[#25698]</b></td>
											</tr>
											<tr>
												<td><span class="label label-success">Complete</span></td>
												<td>May 10, 2014 18:05</td>
												<td>Server Problem</td>
												<td>Elie</td>
												<td><b>[#25367]</b></td>
											</tr>
											<tr>
												<td><span class="label label-info">In progress</span></td>
												<td>May 10, 2014 18:05</td>
												<td>Design Error</td>
												<td>Reinald</td>
												<td><b>[#25639]</b></td>
											</tr>
																					
										</tbody>
									</table>
							  	</div>
							</div>	 	
						</div>
					</div>
					
				</div><!--/col-->
				<div class="col-md-3">
					
					<div class="social-box facebook">
						<i class="fa fa-facebook"></i>
						<ul>
							<li>
								<strong>256k</strong>
								<span>friends</span>
							</li>
							<li>
								<strong>359</strong>
								<span>feeds</span>
							</li>
						</ul>
					</div><!--/social-box-->			
					
				</div><!--/col-->
				
				<div class="col-md-3">
					
					<div class="social-box twitter">
						<i class="fa fa-twitter"></i>
						<ul>
							<li>
								<strong>1562k</strong>
								<span>followers</span>
							</li>
							<li>
								<strong>2562</strong>
								<span>tweets</span>
							</li>
						</ul>
					</div><!--/social-box-->			
					
				</div><!--/col-->
				
				<div class="col-md-3">
					
					<div class="social-box linkedin">
						<i class="fa fa-linkedin"></i>
						<ul>
							<li>
								<strong>8926</strong>
								<span>contacts</span>
							</li>
							<li>
								<strong>6253</strong>
								<span>feeds</span>
							</li>
						</ul>
					</div><!--/social-box-->			
					
				</div><!--/col-->
				
				<div class="col-md-3">
					
					<div class="social-box google-plus">
						<i class="fa fa-google-plus"></i>
						<ul>
							<li>
								<strong>962</strong>
								<span>followers</span>
							</li>
							<li>
								<strong>256</strong>
								<span>circles</span>
							</li>
						</ul>
					</div><!--/social-box-->			
					
				</div><!--/col-->
					
			</div><!--/row-->	

			<div class="row">
				
				<div class="col-lg-4 col-md-12">
					<div class="panel panel-default calendar">	
						<div class="calendar-small"></div>
						<div class="list">
							<ul>
								<li>
									<label class="custom-checkbox-item">
										<input class="custom-checkbox" type="checkbox"/>
										<span class="custom-checkbox-mark"></span>
										<span class="custom-checkbox-desc">Lunch With Clients</span>
										<i class="fa fa-thumbs-o-up"></i>
									</label>
								</li>
								<li>
									<label class="custom-checkbox-item">
										<input class="custom-checkbox" type="checkbox"/>
										<span class="custom-checkbox-mark"></span>
										<span class="custom-checkbox-desc">Meeting With All Staff</span>
										<i class="fa fa-space-shuttle"></i>
									</label>
								</li>
								<li>
									<label class="custom-checkbox-item">
										<input class="custom-checkbox" type="checkbox"/>
										<span class="custom-checkbox-mark"></span>
										<span class="custom-checkbox-desc">Factory Birthday</span>
										<i class="fa fa-star-half-o"></i>
									</label>
								</li>
							</ul>
							<div class="row">
								<div class="col-xs-6">
									<button type="button" class="btn btn-success btn-block">Accept</button>
								</div><!--/col-->
								<div class="col-xs-6">
									<button type="button" class="btn btn-default btn-block">Discard</button>
								</div><!--/col-->
							</div><!--/row-->
						</div>				
					</div>
				</div><!--/col-->
				
				<div class="col-lg-8 col-md-12">

					<div class="panel panel-default">
						<div class="panel-heading">
							<h2><i class="fa fa-check red"></i><strong>To Do</strong></h2>
							<div class="panel-actions">
								<a href="index.html#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
								<a href="index.html#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								<a href="index.html#" class="btn-close"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<div class="panel-body no-padding">
							<div class="todo-list">									
								<div class="header">Today</div>
								<ul id="todo-2" class="todo-list-tasks">
									<li>
										<label class="custom-checkbox-item pull-left">
											<input class="custom-checkbox" type="checkbox"/>
											<span class="custom-checkbox-mark"></span>
										</label>
										<span class="desc">Add slider home to creative template</span> 
									</li>
									<li>
										<label class="custom-checkbox-item pull-left">
											<input class="custom-checkbox" type="checkbox"/>
											<span class="custom-checkbox-mark"></span>
										</label>
										<span class="desc">Change portfolio image with new animation</span> 
									</li>
									<li>
										<label class="custom-checkbox-item pull-left">
											<input class="custom-checkbox" type="checkbox"/>
											<span class="custom-checkbox-mark"></span>
										</label>
										<span class="desc">Fixed JavaScript problem for index page</span> 
									</li>
								</ul>
								<div class="header">Tommorow</div>
								<ul id="todo-3" class="todo-list-tasks">
									<li>
										<label class="custom-checkbox-item pull-left">
											<input class="custom-checkbox" type="checkbox"/>
											<span class="custom-checkbox-mark"></span>
										</label>
										<span class="desc">Update sliding menu with newest</span> 
									</li>
									<li>
										<label class="custom-checkbox-item pull-left">
											<input class="custom-checkbox" type="checkbox"/>
											<span class="custom-checkbox-mark"></span>
										</label>
										<span class="desc">Change navigation structure on header</span> 
									</li>
								</ul>
								<div class="header">Completed</div>
								<ul class="completed"></ul>		
							</div>
						</div>
						<div class="panel-footer">
							<div class="form-group">
								<input type="email" class="form-control" placeholder="Add new task">
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-link"><i class="fa fa-wheelchair"></i></button>
								<button type="button" class="btn btn-link"><i class="fa fa-file-text"></i></button>
								<button type="button" class="btn btn-link"><i class="fa fa-heart"></i></button>
							</div>
							
							<div class="pull-right">
								<button type="button" class="btn btn-primary">Submit</button>
							</div>	
						</div>						
					</div>

				</div><!--/col-->
				
			</div><!--/row-->     
					
		</div>
		<!-- end: Content -->
		<br><br><br>
		
		
		<div id="usage">
			<ul>
				<li>
					<div class="title">Memory</div>
					<div class="bar">
						<div class="progress">
						  	<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%"></div>
						</div>
					</div>			
					<div class="desc">4GB of 8GB</div>
				</li>
				<li>
					<div class="title">HDD</div>
					<div class="bar">
						<div class="progress">
						  	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%"></div>
						</div>
					</div>			
					<div class="desc">250GB of 1TB</div>
				</li>
				<li>
					<div class="title">SSD</div>
					<div class="bar">
						<div class="progress">
					  		<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%"></div>
						</div>
					</div>			
					<div class="desc">700GB of 1TB</div>
				</li>
				<li>
					<div class="title">Bandwidth</div>
					<div class="bar">
						<div class="progress">
					  		<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%"></div>
						</div>
					</div>			
					<div class="desc">90TB of 100TB</div>
				</li>				
			</ul>	
		</div>			
		
	</div><!--/container-->
		
	</div>
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Warning Title</h4>
				</div>
				<div class="modal-body">
					<p>Here settings can be configured...</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="clearfix"></div>
	
		
	<!-- start: JavaScript-->
	<!--[if !IE]>-->

			<script src="/myBlogs/admin/proton/assets/js/jquery-2.1.1.min.js"></script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script src="/myBlogs/admin/proton/assets/js/jquery-1.11.1.min.js"></script>
	
	<![endif]-->

	<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='/myBlogs/admin/proton/assets/js/jquery-2.1.1.min.js'>"+"<"+"/script>");
		</script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script type="text/javascript">
	 	window.jQuery || document.write("<script src='/myBlogs/admin/proton/assets/js/jquery-1.11.1.min.js'>"+"<"+"/script>");
		</script>
		
	<![endif]-->
	<script src="/myBlogs/admin/proton/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/js/bootstrap.min.js"></script>
	
	
	<!-- page scripts -->
	<script src="/myBlogs/admin/proton/assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/moment/moment.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/fullcalendar/js/fullcalendar.min.js"></script>
	<!--[if lte IE 8]>
		<script language="javascript" type="text/javascript" src="assets/plugins/excanvas/excanvas.min.js"></script>
	<![endif]-->
	<script src="/myBlogs/admin/proton/assets/plugins/flot/jquery.flot.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/flot/jquery.flot.stack.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/flot/jquery.flot.time.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/flot/jquery.flot.spline.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/xcharts/js/xcharts.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/autosize/jquery.autosize.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/placeholder/jquery.placeholder.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/datatables/js/dataTables.bootstrap.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/raphael/raphael.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/morris/js/morris.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/jvectormap/js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/jvectormap/js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/jvectormap/js/gdp-data.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/gauge/gauge.min.js"></script>
	
	
	<!-- theme scripts -->
	<script src="/myBlogs/admin/proton/assets/js/SmoothScroll.js"></script>
	<script src="/myBlogs/admin/proton/assets/js/jquery.mmenu.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/js/core.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/d3/d3.min.js"></script>
	
	<!-- inline scripts related to this page -->
	<script src="/myBlogs/admin/proton/assets/js/pages/index.js"></script>
	
	<!-- end: JavaScript-->
	
</body>
</html>