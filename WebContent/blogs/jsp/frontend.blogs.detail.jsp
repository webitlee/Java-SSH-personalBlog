<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8"/>
    <meta name="author" content="liyanan"/>
    <meta name="keyword" content="个人博客、技术博客、web前端、后端、HTML5、CSS3、JavaScript、java、Spring、SpringMVC、Hibernate、SSH、jsp、软件、程序设计、IT"/>
    <link rel="shortcut icon" href="../blogs/image/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../blogs/css/reset.css"/>
    <link href="../blogs/css/blogs.detail.css" type="text/css" rel="stylesheet"/>
    <link href="../admin/proton/assets/plugins/blogs_editor/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="../admin/proton/assets/plugins/dialog/css/jquery.dialog.css" rel="stylesheet"/>
    <title>${requestScope.blog.title} -- ${requestScope.admin.username}的博客</title>
</head>
<body>
<!-- 顶部导航 -->
<%@include file="/blogs/html/public_header.html" %>
<section class="bg">
    <div class="wrap">
        <h1 class="pt-50 h200 ts-30 tc-white">${requestScope.admin.username}的博客</h1>
        <div class="bd-ccc pd-5 pos-rel top-n30 bg-white ts-0">
            <!-- 左侧菜单 -->
           <%@include file="/blogs/html/public_left_menu.html"%>
           
            <div class="inline-block pl-20 pr-20 ml-5 w983 bd-ccc ts-14 v-top">
                <p class="h60 lh-60">
                    <a id="blog_id" data-id="${requestScope.blog.id}" href="../getBlog/${requestScope.blog.id}">
                        <strong>
                        	<c:choose>
                        		<c:when test="${requestScope.blog.typeId.name == '原创'}">
                        			<i class="inline-block w20 h60 bg-yuan pr-20 v-top"></i>
                        		</c:when>
                        		<c:otherwise>
                        			<i class="inline-block w20 h60 bg-zhuan pr-20 v-top"></i>
                        		</c:otherwise>
                        	</c:choose>
                            ${requestScope.blog.title}
                        </strong>
                    </a>
                </p>
                <p class="h25 lh-25 ts-12 tc-blue">
                    <span class="tc-666 ts-14">标签：</span>
                    ${requestScope.blog.label}
                </p>
                <p class="pull-right h25 lh-25 ts-12">
                    <span class="tc-666 pr-30">${requestScope.blog.createTime}</span>
                    <span class="tc-666 pr-30">阅读：${requestScope.blog.visit}</span>
                    <span class="tc-666 pr-30">点赞：${requestScope.blog.support}</span>
                </p>
                <hr class="clearfix"/>
                <div id="content" class="tc-333 ts-12 lh-20 pt-20 pb-20">
                	<div class="froala-element">
                		${requestScope.blog.contentId.content}
                	</div>	
                </div>
                <ul class="pt-20 pb-20">
                    <li id="btn_support" class="text-center pointer">
                        <div class="inline-block bg-999 tc-white w70 h70 pd-5 ts-30">
                            <p class="h50 lh-50">赞</p>
                            <span class="inline-block ts-12 h20 lh-20">${requestScope.blog.support}</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>
<footer class="pt-20 h70 bd-top-ccc">
    <div class="wrap ts-14 tc-999 h30 lh-30">
        <a id="csdn" href="http://blog.csdn.net/qq_19891827">
            <i class="inline-block w20 h30 bg-c v-top"></i>
         	 博主CSDN博客
        </a>
        <span class="pl-5 pr-5">|</span>
        <span id="email">
            <i class="inline-block w30 h30 bg-email v-top"></i>
           	 邮箱：webitlee@163.com
        </span>
    </div>
</footer>
<section id="btn_top" class="pos-fixed w45 h45 right-20 bottom-200 bg-top pointer none"></section>
</body>
<script src="../blogs/js/jquery-3.0.0.min.js"></script>
<script src="../admin/proton/assets/plugins/dialog/js/jquery.dialog.js"></script>
<script src="../blogs/js/blogs.detail.js"></script>
</html>