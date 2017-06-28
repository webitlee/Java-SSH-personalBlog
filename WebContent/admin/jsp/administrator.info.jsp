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
				<div class="row">
					<div class="col-md-12">
						<div class="page-header">
							<h1 class="">
								<i class="fa fa-user  icon">
								</i>
								我的信息
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
									<i class="fa fa-user"></i> 我的信息
								</a>
							</li>
						</ol>
						<div class="panel panel-default ">
							<div class="panel-heading">
								<i class="fa fa-user  icon">
								</i>我的信息
							</div>
							<div class="panel-body">
								<form id="form" class="form-horizontal" method="post" action="uploadImage" enctype="multipart/form-data">
									<div class="form-group">
										<label class="control-label  col-md-2">用户名：
										</label>
										<div class="col-md-6 col-lg-4">
											<input type="text" class="form-control" name="username" readonly="readonly" value="${requestScope.information.username}">
										</div>
									</div>
									<div class=" form-group ">
										<label class="control-label  col-md-2">我的头像
										</label>
										<div class="col-md-6 col-lg-4">
											<a id="upload_img" class="inline-block bg-light-gray bd-ccc w100 h100" href="javascript:;">
												<c:choose>
													<c:when test="${requestScope.information.image == null}">
														<img class="verticalcenter max-w100 max-h100" src="admin/proton/assets/img/avatar.jpg"/>
													</c:when>
													<c:otherwise>
														<img class="verticalcenter max-w100 max-h100" src="${requestScope.information.image}"/>
													</c:otherwise>
												</c:choose>
											</a>
											<p style="padding-top:15px;">
												<a id="btn_upload" class="btn btn-primary" href="javascript:;">重新上传头像</a>
												<input id="file" name="image" type="file" style="opacity: 0;"/>
											</p>
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
		//上传插件
	    var UploadHandler =
	    {
	        autoUpload : true,
	        browseButtons : ['btn_upload', 'upload_img'],
	        multipleSelection : false,
	        fileAdded : function(browseButton, fileInfo, fileListElement)
	        {
	            var el = $('#' + browseButton);
	            el.text('正在上传...');
	        },
	        fileUploading : function(browseButton, fileInfo, percent)
	        {
	            // ..
	        },
	        fileUploaded : function(browseButton, fileInfo, responseData)
	        {
	            var result = eval('(' + responseData + ')');
	            jAlert('点击"OK"后会刷新当前页面！', function(){
		            location.reload();
	            }, "头像上传成功");
	        },
	        uploadError : function(browserButton, uploader, error)
	        {
	            alert('上传失败：' + error.message);
	        }
	    };
		$(function(){
			
		})
	</script>
	<iframe src="admin/html/plupload.html" width="200" height="200" frameborder="no" scrolling="no"></iframe>
	<!-- end: JavaScript-->
	
</body>
</html>