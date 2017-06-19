<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh_CN">
	<head>
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>找回密码 -- BlackLee的博客</title>

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
								<i class="fa fa-key  icon">
								</i>找回密码
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
									<i class="fa fa-key"></i> 找回密码
								</a>
							</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-key  icon">
								</i>找回密码
							</div>
							<div class="panel-body">
								<form class=" form-horizontal " action="javascript:;">
									<div class="form-group">
										<label class="control-label   col-md-5">用户名：
										</label>
										<div class="col-md-7">
											<input id="username" name="username" type="text" class="form-control" placeholder="请输入用户名">
										</div>
									</div>
									<div class="form-group ">
										<label class="control-label   col-md-5">
										</label>
										<div class="col-md-7">
											<a id="btn_username" class="btn btn-success">
												<i class="fa fa-level-up  icon">
												</i>确定
											</a>
										</div>
									</div>
									<hr/>
									<div class="questions form-group" style="display:none;">
										<label class="control-label   col-md-5">
										</label>
										<div class="col-md-7">
											<input type="text" class="form-control" placeholder="请输入答案">
										</div>
									</div>
									<div class="questions form-group"  style="display:none;">
										<label class="control-label   col-md-5">
										</label>
										<div class="col-md-7">
											<input type="text" class="form-control" placeholder="请输入答案">
										</div>
									</div>
									<div class="questions form-group"  style="display:none;">
										<label class="control-label   col-md-5">
										</label>
										<div class="col-md-7">
											<input type="text" class="form-control" placeholder="请输入答案">
										</div>
									</div>
									<div class="btn-submit form-group"  style="display:none;">
										<label class="control-label   col-md-5">
										</label>
										<div class="col-md-7">
											<a id="btn_submit" class="btn btn-success">
												<i class="fa fa-level-up  icon">
												</i>提交
											</a>
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
   	<script src="/myBlogs/admin/proton/assets/plugins/dialog/js/jquery.dialog.js"></script>

   	<!-- theme scripts -->
   	<script src="/myBlogs/admin/proton/assets/js/SmoothScroll.js"></script>
   	<script src="/myBlogs/admin/proton/assets/js/jquery.mmenu.min.js"></script>
   	<script src="/myBlogs/admin/proton/assets/js/core.min.js"></script>
   	<script>
   		//根据用户名查找管理员信息
   		$('#btn_username').click(function(){
   			$(this).text('请稍后...')
   			var _this = this;
   			var username = $.trim($('#username').val());
   			if(!username){
   				jAlert('请先填写用户名');
   				return;
   			}
   			$.post('/myBlogs/getSecurityQuestions', {username : username}, function(data){
   				$(_this).text('确定');
   				if(data.error){
   					jAlert(data.error, '出错！');
   					return;
   				}
   				$questions = $('.questions');
   				$questions.show();
   				$('.btn-submit').show();
   				$(_this).hide();
   				$questions.each(function(){
   					$(this).attr('data-id', data.questions[$questions.index($(this))][0]);
   					$(this).children('label').text(data.questions[$questions.index($(this))][1]);
   				})
   			})
   			
   			//验证密保问题的正确性
   			$('#btn_submit').click(function(){
   				var $questions = $('.questions');
   				var question1 = $.trim($($questions.get(0)).find('input').val());
   				var id1 = $($questions[0]).attr('data-id');
   				var question2 = $.trim($($questions.get(1)).find('input').val());
   				var id2 = $($questions[1]).attr('data-id');
   				var question3 = $.trim($($questions.get(2)).find('input').val());
   				var id3 = $($questions[2]).attr('data-id');
   			})
   		})
   	</script>
	<!-- end: JavaScript-->
	
</body>
</html>