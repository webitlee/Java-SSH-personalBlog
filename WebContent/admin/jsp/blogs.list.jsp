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
	    <title>博文列表</title>

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
				<i class="fa fa-book  icon">
				</i>
				博文列表
			</h1>
		</div>
		<ol class=" breadcrumb ">
				<li class="  ">
					<a href="/myBlogs/index?username=${applicationScope.username}" class="">
						<i class="fa fa-home"></i> 首页
					</a>
				</li>
				<li class="  ">
					<a href="javascript:;" class="">
						<i class="fa fa-book"></i> 博文列表
					</a>
				</li>
			</ol>
		<div class="panel panel-default ">
			<div class="panel-heading">
				<i class="fa fa-book icon red" style="line-height:32px;">
				</i>博文列表
			</div>
			<div class="panel-body ">
				<div class=" table-responsive ">
					<table class="table table-bordered table table-hover table table-striped ">
						<tbody>
							<tr>
								<td class="text-center">id
								</td>
								<td class="text-center">标题
								</td>
								<td class="text-center">类型
								</td>
								<td class="text-center">分类
								</td>
								<td class="text-right">浏览量
								</td>
								<td class="text-right">点赞量
								</td>
								<td class="text-center">创建时间
								</td>
								<td class="text-center">最后修改时间
								</td>
								<td class="text-center">操作
								</td>
							</tr>
							<tr class="">
								<td class="text-center    middle">1
								</td>
								<td class="text-center    middle">的答复
								</td>
								<td class="text-center    middle">原创
								</td>
								<td class="text-center    middle">后台
								</td>
								<td class="middle text-right">2111
								</td>
								<td class="text-right middle">1544
								</td>
								<td class="text-center    middle">20150124
								</td>
								<td class="text-center    middle">20171101
								</td>
								<td class="text-center">
									<div class="split-button btn-group">
										<a class="btn btn-success" href="javascript:;">
											编辑
										</a>
										<button class="btn btn-success dropdown-toggle" data-toggle="dropdown">
											<span class=" caret ">
											</span>
										</button>
										<ul class=" dropdown-menu ">
											<li class="">
												<a href="javascript:;">这是一个超链接
												</a>
											</li>
										</ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<ul class="pagination">
					<li class="  ">
						<a href="javascript:;" class="">前一页
						</a>
					</li>
					<li class="  ">
						<a href="javascript:;" class="">1
						</a>
					</li>
					<li class="  ">
						<a href="javascript:;" class="">2
						</a>
					</li>
					<li class="  ">
						<a href="javascript:;" class="">3
						</a>
					</li>
					<li class="  ">
						<a href="javascript:;" class="">后一页
						</a>
					</li>
				</ul>
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

   	<!-- theme scripts -->
   	<script src="/myBlogs/admin/proton/assets/js/SmoothScroll.js"></script>
   	<script src="/myBlogs/admin/proton/assets/js/jquery.mmenu.min.js"></script>
   	<script src="/myBlogs/admin/proton/assets/js/core.min.js"></script>
   	<script>
   		
   	</script>
	<!-- end: JavaScript-->
	
</body>
</html>