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
	    <title>创建新博文</title>

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
		<link href="/myBlogs/admin/proton/assets/plugins/blogs_editor/css/font-awesome.min.css" rel="stylesheet"/>
		<link href="/myBlogs/admin/proton/assets/plugins/blogs_editor/css/froala_editor.min.css" rel="stylesheet"/>
		
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
					<div class="col-md-12">
						<div class=" page-header ">
							<h1 class="">
								<i class="fa fa-plus-square  icon">
								</i>创建新博文
							</h1>
						</div>
						<ol class="breadcrumb">
							<li class="  ">
								<a href="/myBlogs/index?username=${applicationScope.username}" class="">首页
								</a>
							</li>
							<li class="  ">
								<a href="javascript:;" class="">创建新博文
								</a>
							</li>
						</ol>
						<div class="panel panel-default ">
							<div class="panel-heading">
								<i class="fa fa-plus-square  icon">
								</i>创建新博文
							</div>
							<div class="panel-body">
								<form class=" form-horizontal " action="javascript:;">
									<div class=" form-group ">
										<label class="control-label  col-md-2">标题
										</label>
										<div class=" col-md-6">
											<input type="text" class="form-control" placeholder="请输入博文标题">
										</div>
									</div>
									<div class=" form-group ">
										<label class="control-label  col-md-2">类型
										</label>
										<div class=" col-md-6">
											<label class="radio-inline">
												<input type="radio" class="" name="type" checked>原创
											</label>
											<label class="radio-inline">
												<input type="radio" class="" name="type">转载
											</label>
										</div>
									</div>
									<div class=" form-group ">
										<label class="control-label  col-md-2">标签
										</label>
										<div class=" col-md-6">
											<input type="text" class="form-control" placeholder="请输入博文标签">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-2">正文
										</label>
										<div class="col-md-8">
											<div id="editor"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label  col-md-2">
										</label>
										<div class="col-md-6">
											<button class="btn btn-primary">提交
											</button>
										</div>
									</div>
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
	<script src="/myBlogs/admin/proton/assets/plugins/blogs_editor/js/froala_editor.min.js"></script>

   	<!-- theme scripts -->
   	<script src="/myBlogs/admin/proton/assets/js/SmoothScroll.js"></script>
   	<script src="/myBlogs/admin/proton/assets/js/jquery.mmenu.min.js"></script>
   	<script src="/myBlogs/admin/proton/assets/js/core.min.js"></script>
   	<script>
		 window.onload = function(){
	  		//删除对只能上传图片的限制，严重拖慢响应速度。
			$('#f-file-upload-1').removeAttr("accept");
	  		//修改上传文件的input的name属性值
			$('#f-file-upload-1').attr('name', 'picture');
		} 
		$(function(){
			$('#editor').editable({
				inlineMode : false, 
				alwaysBlank : true,
				height : 400,
				allowedImageTypes: ["jpeg", "jpg", "png", "gif"],
				imageUploadURL: '/myBlogs/uploadImage',//上传到本地服务器
			});
		})
   	</script>
	<!-- end: JavaScript-->
	
</body>
</html>