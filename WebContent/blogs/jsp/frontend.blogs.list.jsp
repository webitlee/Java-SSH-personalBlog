<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8"/>
    <meta name="author" content="liyanan"/>
    <meta name="keyword" content="个人博客、技术博客、web前端、后端、HTML5、CSS3、JavaScript、java、Spring、SpringMVC、Hibernate、SSH、jsp、软件、程序设计、IT"/>
    <link rel="shortcut icon" href="/myBlogs/blogs/image/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/myBlogs/blogs/css/reset.css"/>
    <link href="/myBlogs/blogs/css/blogs.css" type="text/css" rel="stylesheet"/>
    <title>BlackLee的博客 -- 专注全栈开发</title>
    <script src="/myBlogs/blogs/js/jquery-3.0.0.min.js"></script>
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
                <ul>
                	<c:forEach var="blog" items="${requestScope.blogs}">
	                	<li class="pb-20 bd-bottom-dotted-ccc">
	                        <h3 class="h40 lh-40">
	                            <a href="/myBlogs/getBlog/${blog.id}">
	                            	<c:choose>
	                            		<c:when test="${blog.typeId.name == '原创'}">
	                            			<i class="inline-block w20 h35 bg-yuan pr-20 v-top"></i>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<i class="inline-block w20 h35 bg-zhuan pr-20 v-top"></i>
	                            		</c:otherwise>
	                            	</c:choose>
	                                ${blog.title}
	                            </a>
	                        </h3>
	                        <div class="content ts-14 tc-999 lh-30 pos-rel">
	                        	<p>${blog.contentId.content}</p>
	                            <span class="omit pos-ab bottom-0 right-0 ts-12 w28 bg-white none">...</span>
	                        </div>
	                        <p class="ts-12 h40 lh-40">
	                            <a class="pull-right pr-20" href="javascript:;">
	                              	  阅读
	                                <span class="tc-999">(${blog.visit})</span>
	                            </a>
	                            <a class="pull-right pr-20" href="javascript:;">
                                	点赞
	                                <span class="tc-999">(${blog.support})</span>
	                            </a>
	                            <span class="pull-right pr-20 tc-999">${blog.createTime}</span>
	                        </p>
	                    </li>
                	</c:forEach>
                </ul>
                <div class="h60 pt-10 pb-10 ts-12 tc-999 text-center">
                    <span class="inline-block h30 lh-30 pr-5 v-top">本页${requestScope.blogs.size()}条</span>
                   	<span id="pages" class="inline-block h30 lh-30 pr-5 v-top" data-keyword="${requestScope.pagingKeyword}" data-classification="${requestScope.pagingClassification}" data-pages="${requestScope.pagesCount}">共${requestScope.pagesCount}页</span>
                    <div id="paging" class="inline-block">
                    </div>		
                </div>
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
        <span class="pl-5 pr-5">|</span>
        <a id="csdn" href="https://github.com/webitlee">
        	<i class="inline-block w20 h30 bg-git v-top"></i>
       		 博主GitHub
        </a>
    </div>
</footer>
<section id="btn_top" class="pos-fixed w45 h45 right-20 bottom-200 bg-top pointer none"></section>
</body>
<script src="/myBlogs/blogs/js/blogs.js"></script>
</html>