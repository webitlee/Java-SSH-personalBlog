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
	    <title>类别管理</title>

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
		<link href="/myBlogs/admin/proton/assets/css/common.css" rel="stylesheet"/>
		<link href="/myBlogs/admin/proton/assets/plugins/dialog/css/jquery.dialog.css" rel="stylesheet"/>

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
				<div class=" row ">
					<div class="col-md-12">
						<div class="page-header">
							<h1 class="">
								<i class="fa fa-list-alt  icon">
								</i>类别管理
							</h1>
						</div>
					</div>
					<ol class="breadcrumb">
							<li class="  ">
								<a href="/myBlogs/index?username=${applicationScope.username}" class="">
								<i class="fa fa-home"></i> 首页
								</a>
							</li>
							<li class="  ">
								<a href="javascript:;" class="">
								<i class="fa fa-plus-square"></i> 类别管理
								</a>
							</li>
						</ol>
					<div class="col-md-6">
						<div class="panel panel-default ">
							<div class="panel-heading">
								<i class="fa fa-list-alt red">
								</i>修改类名
							</div>
							<div class="panel-body">
								<form class="form-inline" action="javascript:;">
									<c:forEach var="classification" items="${requestScope.classification}" varStatus="status">
										<div class=" form-group ">
											<label class="">类别名称
											</label>
											<input type="text" class="form-control classification-name" data-id="${classification.id}" value="${classification.name}" <c:if test="${status.index == 0}">disabled</c:if>/>
											<button class="btn btn-info btn-rename" data-id="${classification.id}">
												<i class="fa fa-level-up  icon">
												</i> 提交
											</button>
											<button class="btn btn-danger btn-remove" data-id="${classification.id}">
												<i class="fa fa-minus icon">
												</i> 删除
											</button>
										</div>
										<c:if test="${requestScope.classification.size() > 1}">
											<hr/>
										</c:if>
									</c:forEach>
									
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default ">
							<div class="panel-heading">
								<i class="fa fa-list-alt red">
								</i>添加分类
							</div>
							<div class="panel-body">
								<form id="add_form" class="form-inline" action="javascript:;">
									<div class=" form-group ">
										<label class="">添加分类
										</label>
										<input type="text" class="form-control" name="name" placeholder="填写分类名称">
									</div>
									<button id="btn_add" class="btn btn-success">
										<i class="fa fa-plus  icon">
										</i>确认
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end: Content -->
			<br><br><br>
		</div>			
		
	</div><!--/container-->
		
	
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
 	<script src="/myBlogs/admin/proton/assets/plugins/datatables/js/jquery.dataTables.min.js"></script>
   	<script src="/myBlogs/admin/proton/assets/plugins/datatables/js/dataTables.bootstrap.min.js"></script>
   	<script src="/myBlogs/admin/proton/assets/plugins/dialog/js/jquery.dialog.js"></script>

   	<!-- theme scripts -->
   	<script src="/myBlogs/admin/proton/assets/js/SmoothScroll.js"></script>
   	<script src="/myBlogs/admin/proton/assets/js/jquery.mmenu.min.js"></script>
   	<script src="/myBlogs/admin/proton/assets/js/core.min.js"></script>
   	<script>
   		//添加分类
   		$('#btn_add').click(function(){
   			$.post('/myBlogs/addClassification', $('#add_form').serialize(), function(data){
   				if(data.error){
   					jAlert(data.error);
   				}else{
   					jAlert(data.message, function(){
   						location.reload();
   					}, '成功啦');
   				}
   			})
   		})
   		
   		//修改分类名称
   		$('.btn-rename').click(function(){
   			$.post('/myBlogs/uploadClassification', {name : $(this).prev().children('.classification-name').val(), id : $(this).attr('data-id')}, function(data){
   				if(data.error){
   					jAlert(data.error);
   				}else{
   					jAlert(data.message, function(){
   						location.reload();
   					}, '成功啦');
   				}
   			})
   		})
   		
   		//删除分类
   		$('.btn-remove').click(function(){
   			$.post('/myBlogs/deleteClassification',{id : $(this).attr('data-id')}, function(data){
   				if(data.error){
   					jAlert(data.error);
   				}else{
   					jAlert(data.message, function(){
   						location.reload();
   					}, '成功啦');
   				}
   			})
   		})
   	</script>
	<!-- end: JavaScript-->
	
</body>
</html>