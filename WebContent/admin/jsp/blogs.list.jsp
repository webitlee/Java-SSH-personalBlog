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
		<link href="admin/proton/assets/plugins/dialog/css/jquery.dialog.css" rel="stylesheet"/>

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
					<a href="index?username=${applicationScope.username}" class="">
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
							<c:forEach var="blogs" items="${requestScope.blogs}">
							<tr class="">
								<td class="text-center middle">${blogs.id}
								</td>
								<td class="text-center middle">${blogs.title}
								</td>
								<td class="text-center middle">${blogs.typeId.name}
								</td>
								<td class="text-center middle">
								<c:forEach var="classification" items="${blogs.classification}" varStatus="status">
									<c:if test="${!status.last}">
										${classification.name}, 
									</c:if>
									<c:if test="${status.last}">
										${classification.name}
									</c:if>
								</c:forEach>
								</td>
								<td class="middle text-right">${blogs.visit}
								</td>
								<td class="text-right middle">${blogs.support}
								</td>
								<td class="text-center middle">${blogs.createTime}
								</td>
								<td class="text-center middle">${blogs.lastModified}
								</td>
								<td class="text-center">
									<div class="split-button btn-group">
										<a class="btn btn-success" href="getBlogById?id=${blogs.id}">
											编辑
										</a>
										<button class="btn btn-success dropdown-toggle" data-toggle="dropdown">
											<span class="caret">
											</span>
										</button>
										<ul class=" dropdown-menu">
											<li class="">
												<a class="btn-remove" data-remove="${blogs.id}" href="/removeBlog">删除
												</a>
											</li>
										</ul>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<ul id="pages" data-pages="${requestScope.pages}" class="pagination">
					<li id="btn_prev">
						<a href="getBlogs" class="">&lt;&lt;前一页
						</a>
					</li>
					<li id="btn_next">
						<a href="getBlogs" class="">后一页&gt;&gt;
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
   	<script src="admin/proton/assets/plugins/dialog/js/jquery.dialog.js"></script>

   	<!-- theme scripts -->
   	<script src="admin/proton/assets/js/SmoothScroll.js"></script>
   	<script src="admin/proton/assets/js/jquery.mmenu.min.js"></script>
   	<script src="admin/proton/assets/js/core.min.js"></script>
   	<script>
   		$(function(){
   			//分页
   			var $pages = $('#pages');
   			var sum = parseInt($pages.attr('data-pages'));
   			var page = location.search.substring(1)
   			for(var i = 0; i < sum; i++){
   				if(i <= 0){
   					$('#btn_next').before('<li class="pages active" data-index="'+i+'"><a href="getBlogs?pageIndex='+i+'">'+(i+1)+'</a></li>');
   				}else{
	   				$('#btn_next').before('<li class="pages"><a href="getBlogs?pageIndex='+i+'">'+(i+1)+'</a></li>');
   				}
   			}
   			//选择页码
   			$('.pages').click(function(){
   				$(this).siblings().removeClass('active');
   				$(this).addClass('active');
   			})
   			//前一页
   			$(document).on('click', '#btn_prev',function(){
   				var pageIndex = parseInt($($('.pages.active')[0]).attr('data-index'));
   				if(pageIndex > 0){
   					pageIndex--;
   				}
   				$(this).children('a').attr('href', 'getBlogs?pageIndex=' + pageIndex);
   			})
   			//后一页
   			$('#btn_next').click(function(){
   				var pageIndex = parseInt($($('.pages.active')[0]).attr('data-index'));
   				var sum = parseInt($('#pages').attr('data-pages'));
   				if(pageIndex < (sum - 1)){
   					pageInde++;
   				}
   				$(this).children('a').attr('href', 'getBlogs?pageIndex=' + pageIndex);
   			})
   		})
   	</script>
	<!-- end: JavaScript-->
	
</body>
</html>