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
								<a href="/myBlogs/index?username=${applicationScope.username}" class="">
								<i class="fa fa-home"></i> 首页
								</a>
							</li>
							<li class="  ">
								<a href="javascript:;" class="">
								<i class="fa fa-plus-square"></i> 创建新博文
								</a>
							</li>
						</ol>
						<div class="panel panel-default ">
							<div class="panel-heading">
								<i class="fa fa-plus-square red">
								</i>创建新博文
							</div>
							<div class="panel-body">
								<form id="form" class=" form-horizontal " action="javascript:;">
									<div class=" form-group ">
										<label class="control-label  col-md-2">标题
										</label>
										<div class=" col-md-6">
											<input type="text" id="title" class="form-control" name="title" placeholder="请输入博文标题">
										</div>
									</div>
									<div class=" form-group ">
										<label class="control-label  col-md-2">分类
										</label>
										<div class=" col-md-6">
											<c:forEach var="classification" items="${requestScope.classification}" varStatus="status">
												<c:if test="${status.index == 0}">
													<div class="checkbox">
											        <label>
											          <input type="checkbox" name="classification" value="${classification.id}" checked disabled> ${classification.name}
										              <input type="hidden" name="classification" value="${classification.id}"/>
											        </label>
										      	</div>
												</c:if>
												<c:if test="${status.index != 0}">
													<div class="checkbox">
												        <label>
												          <input type="checkbox" name="classification" value="${classification.id}"> ${classification.name}
												        </label>
											      	</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
									<div class=" form-group ">
										<label class="control-label  col-md-2">类型
										</label>
										<div class=" col-md-6">
											<label class="radio-inline">
												<input id="type" type="radio" class="" name="type" value="原创" checked>原创
											</label>
											<label class="radio-inline">
												<input type="radio" class="" name="type" value="转载">转载
											</label>
										</div>
									</div>
									<div class=" form-group ">
										<label class="control-label  col-md-2">标签
										</label>
										<div class=" col-md-6">
											<input type="text" id="label" class="form-control" name="label" placeholder="请输入博文标签">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-2">正文
										</label>
										<div class="col-md-8">
											<div id="editor"></div>
											<input id="content" type="hidden" name="content"/>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label  col-md-2">
										</label>
										<div class="col-md-6">
											<button id="btn_save" class="btn btn-primary">提交
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>	
			</div>
			<div id="test"></div>	
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
	<script src="/myBlogs/admin/proton/assets/plugins/dialog/js/jquery.dialog.js"></script>

   	<!-- theme scripts -->
   	<script src="/myBlogs/admin/proton/assets/js/SmoothScroll.js"></script>
   	<script src="/myBlogs/admin/proton/assets/js/jquery.mmenu.min.js"></script>
   	<script src="/myBlogs/admin/proton/assets/js/core.min.js"></script>
   	<script>
		 window.onload = function(){
	  		//删除对只能上传图片的限制，严重拖慢响应速度。
			$('#f-file-upload-1').removeAttr("accept");
		} 
		$(function(){
			$('#editor').editable({
				inlineMode : false, 
				alwaysBlank : true,
				height : 400,
				allowedImageTypes: ["jpeg", "jpg", "png", "gif"],
				imageUploadURL: '/myBlogs/upload'//上传到本地服务器,
			});
			
			
			//提交按钮
			$('#btn_save').click(function(){
				var title = $.trim($('#title').val());
				var classification = $.trim($('#classification>option:selected'));
				var label = $.trim($('#label').val());
				$('#content').val($('#editor>.froala-element').html());
				var content = $.trim($('#content').val());
				if(!title){
					jAlert('请填写博文标题后再提交');
				}else if(!classification){
					jAlert('请选择博文分类后再提交');
				}else if(!label){
					jAlert('请填写博文标签后再提交');
				}else if(!content){
					jAlert('请填写博文内容后再提交');
				}else{
					$.post('/myBlogs/saveBlogs', $('#form').serialize(), function(data){
						if(data.error){
							jAlert(data.error, '出错啦！');
						}else{
							jAlert(data.message, '成功！', function(){
								location.reload();
							});
						}
					})
				}
				
			})
		})
   	</script>
	<!-- end: JavaScript-->
	
</body>
</html>