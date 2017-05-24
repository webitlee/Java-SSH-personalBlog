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
		<link href="/myBlogs/admin/proton/assets/plugins/morris/css/morris.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/jvectormap/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
	    <link href="/myBlogs/admin/proton/assets/css/style.min.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/css/add-ons.min.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="/myBlogs/admin/proton/assets/plugins/dialog/css/jquery.dialog.css" rel="stylesheet"/>
		<link href="/myBlogs/admin/proton/assets/css/common.css" rel="stylesheet">
		

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
				<div class="col-lg-12 col-md-12">
						<div class="panel panel-default">	
							<div class="panel-heading">
								<h2><i class="fa fa-bars red"></i><strong>分类情况</strong></h2>
							</div>
							<div class="panel-body" style="background-color:#e6e8ea;">
								<c:forEach var="classification" items="${requestScope.classifications}" varStatus="c">
									<c:if test="${(c.index + 1)%4 == 1}">
										<div class="col-md-3">
											<div class="social-box facebook">
												<i class="fa fa-sitemap"></i>
												<ul>
													<li>
														<strong>${classification.name}</strong>
														<span>分类名称</span>
													</li>
													<li>
														<strong>${classification.blogs.size()}</strong>
														<span>博客篇数</span>
													</li>
												</ul>
											</div><!--/social-box-->			
											
										</div><!--/col-->
									</c:if>
									<c:if test="${(c.index + 1)%4 == 2}">
										<div class="col-md-3">
											<div class="social-box twitter">
												<i class="fa fa-sitemap"></i>
												<ul>
													<li>
														<strong>${classification.name}</strong>
														<span>分类名称</span>
													</li>
													<li>
														<strong>${classification.blogs.size()}</strong>
														<span>博客篇数</span>
													</li>
												</ul>
											</div><!--/social-box-->			
											
										</div><!--/col-->
									</c:if>
									<c:if test="${(c.index + 1)%4 == 3}">
										<div class="col-md-3">
											
											<div class="social-box linkedin">
												<i class="fa fa-sitemap"></i>
												<ul>
													<li>
														<strong>${classification.name}</strong>
														<span>分类名称</span>
													</li>
													<li>
														<strong>${classification.blogs.size()}</strong>
														<span>博客篇数</span>
													</li>
												</ul>
											</div><!--/social-box-->			
											
										</div><!--/col-->
									</c:if>
									<c:if test="${(c.index + 1)%4 == 0}">
										<div class="col-md-3">
											
											<div class="social-box google-plus">
												<i class="fa fa-sitemap"></i>
												<ul>
													<li>
														<strong>${classification.name}</strong>
														<span>分类名称</span>
													</li>
													<li>
														<strong>${classification.blogs.size()}</strong>
														<span>博客篇数</span>
													</li>
												</ul>
											</div><!--/social-box-->			
											
										</div><!--/col-->
									</c:if>					
								</c:forEach>
							</div>
						</div>
					</div><!--/col-->
					
			</div><!--/row-->	

			<div class="row">
				
				<div class="col-lg-6 col-md-12">
					<div class="panel panel-default" style="height:660px;text-align:center;">	
						<div class="panel-heading" style="text-align:left;">
							<h2><i class="fa fa-spinner red"></i><strong>万年历</strong></h2>
						</div>
						<!-- 万年历 -->
						<div style="display:inline-block;">
						<iframe src="/myBlogs/admin/proton/assets/plugins/js-lunar-calendar/index.html" scrolling="no" frameborder="0" width="350" height="600" style="margin:0 auto;"></iframe>
						</div>
					</div>
				</div><!--/col-->
				
				<div class="col-lg-6 col-md-12">

					<div class="panel panel-default">
						<div class="panel-heading">
							<h2><i class="fa fa-check red"></i><strong>待办事项</strong></h2>
						</div>
						<div class="panel-body">
							<h5>未完成</h5>
							<c:forEach var="todo" items="${requestScope.unfinishedList}" varStatus="todoList">
								<form class="todo-list form-inline " action="javascript:;" <c:if test="${todoList.index != 0}">style="padding-top:15px;"</c:if>>								<div class="form-group">
										<input type="text" class="form-control" name="content" style="height:34px;width:400px;" value="${todo.content}" disabled>
									</div>
									<button class="btn-complete btn btn-info" data-id="${todo.id}" data-toggle="modal" data-target="#myModal">
										<i class="fa fa-check  icon">
										</i> 完成
									</button>
								</form>
							</c:forEach>
							<hr/>
							<h5>已完成</h5>
							<c:forEach var="todo" items="${requestScope.finishedList}" varStatus="todoList">
								<form class="form-inline " action="javascript:;" <c:if test="${todoList.index != 0}">style="padding-top:15px;"</c:if>>
									<div class="form-group">
										<input type="text" class="form-control" style="height:34px;width:400px;" value="${todo.content}" disabled>
									</div>
									<button class="btn btn-default" disabled>
										<i class="fa fa-check  icon">
										</i> 已完成
									</button>
								</form>
							</c:forEach>
							<hr/>
							<h5>操作</h5>
							<form id="add_todo" class="form-inline " action="javascript:;">
								<div class="form-group">
									<input type="text" class="form-control" name="content" style="height:34px;width:400px;">
								</div>
								<button id="btn_add" class="btn btn-info">
									<i class="fa fa-plus-square  icon">
									</i> 添加
								</button>
							</form>
						</div>
					</div>	
				</div><!--/col-->
				
			</div><!--/row-->     
					
		</div>
		<!-- end: Content -->
		<br><br><br>		
		
	</div><!--/container-->
		
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;
						</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示消息
					</h4>
				</div>
				<div class="modal-body">
					<h4>确认将此任务标记为"已完成状态吗？"</h4>
					<h4>注：此操作不可逆!</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">放弃
					</button>
					<button id="btn_complete" data-id="0" type="button" class="btn btn-primary">确认
					</button>
				</div>
			</div>
		</div>
	</div>

	
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
	<script src="/myBlogs/admin/proton/assets/plugins/dialog/js/jquery.dialog.js"></script>
	
	
	<!-- theme scripts -->
	<script src="/myBlogs/admin/proton/assets/js/SmoothScroll.js"></script>
	<script src="/myBlogs/admin/proton/assets/js/jquery.mmenu.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/js/core.min.js"></script>
	<script src="/myBlogs/admin/proton/assets/plugins/d3/d3.min.js"></script>
	
	<!-- inline scripts related to this page -->
	<script src="/myBlogs/admin/proton/assets/js/pages/index.js"></script>
	<script>
		$(function(){
			//添加任务
			$('#btn_add').click(function(){
				$(this).text('操作中...');
				$.post('/myBlogs/addTodo', $('#add_todo').serialize(), function(data){
					if(data.error){
						jAlert(data.error);
					}else{
						jAlert(data.message, '成功！', function(){
							location.reload();
						})
					}
				})
			})
			
			//完成任务
			$('.btn-complete').click(function(){
				$('#btn_complete').attr('data-id', $(this).attr('data-id'));
			})
			$('#btn_complete').click(function(){
				$.post('/myBlogs/completeTodo', {'id' : $(this).attr('data-id')}, function(data){
					if(data.error){
						jAlert(data.error);
					}else{
						jAlert(data.message, '成功！', function(){
							location.reload();
						});
					}
				})
			})
		})
	</script>
	<!-- end: JavaScript-->
	
</body>
</html>