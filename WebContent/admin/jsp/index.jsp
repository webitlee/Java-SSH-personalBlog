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
		<link rel="shortcut icon" href="/myBlogs/admin/proton/assets/ico/favicon.ico" type="image/x-icon" />

	    <!-- Css files -->
	    <link href="/myBlogs/admin/proton/assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/css/jquery.mmenu.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/css/climacons-font.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/xcharts/css/xcharts.min.css" rel=" stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/fullcalendar/css/fullcalendar.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/morris/css/morris.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/jvectormap/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
	    <link href="/myBlogs/admin/proton/assets/css/style.min.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/css/add-ons.min.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/css/font-awesome.min.css" rel="stylesheet">
		

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
		
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-laptop"></i> 控制面板</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="/myBlogs/index?username=${applicationScope.username}">首页</a></li>
						<li><i class="fa fa-laptop"></i>控制面板</li>						  	
					</ol>
				</div>
			</div>
			
			<div class="row">
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box red-bg">
						<i class="fa fa-thumbs-o-up"></i>
						<div class="count">${requestScope.visitSupportSum[0][1]}人</div>
						<div class="title">点赞</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box green-bg">
						<i class="fa fa-eye"></i>
						<div class="count">${requestScope.visitSupportSum[0][0]}人</div>
						<div class="title">阅读</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box blue-bg">
						<i class="fa fa-copy"></i>
						<div id="copy" data-sum="${requestScope.copySum}" class="count">${requestScope.copySum}篇</div>
						<div class="title">转载</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box magenta-bg">
						<i class="fa fa-file-text"></i>
						<div id="original" data-sum="${requestScope.originalSum}" class="count">${requestScope.originalSum}篇</div>
						<div class="title">原创</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->		
				
			</div><!--/.row-->
			
			<div class="row">
				
				<div class="col-lg-4 col-md-12">
					<div class="panel panel-default">					
						<div class="panel-body white-bg">						
							</br/>
							<div class="graph-container text-center">
								<div id="hero-donut" class="graph" style="height:236px;"></div>
							</div>	
						</div>
					</div>		
				</div><!--/.col-->		
				<div class="col-lg-4 col-md-6">
					
					<div class="panel panel-default">
						
						<div class="panel-body text-center" style="height:275px">
							<h2 class="lime">原创</h2>
							<div style="width:300px;left:50%;position:absolute;margin-left:-150px;">
								<canvas id="gauge1" data-percentage="${requestScope.originalSum/(requestScope.originalSum + requestScope.copySum)}"></canvas>
							</div>
							<span class="pull-left"><strong class="blue">${requestScope.originalSum}篇</strong></span>
							<span class="pull-right"><i class="fa fa-arrow-circle-o-up text-success"></i> ${requestScope.originalSum * 100/(requestScope.originalSum + requestScope.copySum)}%</span>
						</div>							
						
					</div>	
										
				</div><!--/.col-->
				
				<div class="col-lg-4 col-md-6">
					
					<div class="panel panel-default">
						
						<div class="panel-body text-center" style="height:275px">
							<h2 class="lime">转载</h2>
							<div style="width:300px;left:50%;position:absolute;margin-left:-150px;">
								<canvas id="gauge2" data-percentage="${requestScope.copySum/(requestScope.originalSum + requestScope.copySum)}"></canvas>
							</div>
							<span class="pull-left"><strong class="blue">${requestScope.copySum}篇</strong></span>
							<span class="pull-right"><i class="fa fa-arrow-circle-o-up text-success"></i>  ${requestScope.copySum * 100/(requestScope.originalSum + requestScope.copySum)}%</span>
						</div>	
						
					</div>	
										
				</div><!--/.col-->
			</div><!--/.row-->	
				
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