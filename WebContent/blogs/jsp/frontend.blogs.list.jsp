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
    <title>-BlackLee的博客 -- 专注全栈开发</title>
</head>
<body>
<header class="h40 bg-333">
    <div class="wrap">
        <a href="#">
            <img class="w150 h40" src="/myBlogs/blogs/image/logo.png" alt="logo"/>
        </a>
        <div class="pull-right ts-0">
            <a id="btn_search" class="inline-block w40 h40 bd-left-ccc bd-right-ccc bg-search pos-rel" href="javascript:;">
                <div id="search" class="w260 h40 pd-5 bg-white ts-0 pos-ab right-n40 top-40 none">
                    <input class="w200 h100p pl-5 bd-ccc ts-12" type="text" placeholder="输入关键字查询"/>
                    <button class="w50 h100p bd-none bg-green ts-14 tc-white v-top pointer">搜索</button>
                </div>
            </a>
            <a class="inline-block w40 h40 bg-admin bd-right-ccc" href="/myBlogs/admin/html/login.html" target="_blank" title="去管理员后台"></a>
        </div>
    </div>
</header>
<section class="bg">
    <div class="wrap">
        <h1 class="pt-50 h200 ts-30 tc-white">${requestScope.admin.username}的博客</h1>
        <div class="bd-ccc pd-5 pos-rel top-n30 bg-white ts-0">
            <div class="inline-block w200 pd-5 bd-ccc ts-14">
                <p class="pl-5 bg-ccc h25 lh-25 tc-333">博主资料</p>
                <dl class="pb-20 bd-bottom-dotted-ccc">
                    <dt>
                        <img class="block mt-15 w150 h150 mg-auto" src="${requestScope.admin.image}" alt="博主头像"/>
                    </dt>
                    <dd class="h20 lh-20 text-center tc-333">${requestScope.admin.username}</dd>
                </dl>
                <ul class="pt-20 pb-20 bd-bottom-dotted-ccc ts-0">
                    <li class="inline-block h25 lh-25 w50p ts-12 tc-999">原创：${requestScope.typeOriginalSum}篇</li>
                    <li class="inline-block h25 lh-25 w50p ts-12 tc-999">转载：${requestScope.typeCopySum}篇</li>
                    <li class="inline-block h25 lh-25 w50p ts-12 tc-999">阅读：${requestScope.visitSum}次</li>
                    <li class="inline-block h25 lh-25 w50p ts-12 tc-999">点赞：${requestScope.supportSum}次</li>
                </ul>
                <ul class="pt-20 pb-20 bd-bottom-dotted-ccc ts-12">
                    <li class="text-center bg-ccc h25 lh-25 mb-10 tc-333 ts-14">文章分类</li>
                    <li class="h25 lh-25 ts-0">
                        <a class="inline-block ts-12" href="javascript:;">java</a>
                    </li>
                    <li class="h25 lh-25 ts-0">
                        <a class="inline-block ts-12" href="javascript:;">Spring</a>
                    </li>
                </ul>
                <ul class="pt-20 pb-20 bd-bottom-dotted-ccc ts-12">
                    <li class="text-center bg-ccc h25 lh-25 mb-10 tc-333 ts-14">阅读排行</li>
                    <li class="h25 lh-25 ts-0">
                        <a class="inline-block w70p t-ellipsis ts-12" href="javascript:;">论母猪的产后护理论母猪的产后护理</a>
                        <span class="pr-5 pull-right w25p tc-999 ts-10 text-right">(21541)</span>
                    </li>
                    <li class="h25 lh-25 ts-0">
                        <a class="inline-block w70p t-ellipsis ts-12" href="javascript:;">一路和和广佛艾芬达放大法3</a>
                        <span class="pr-5 pull-right w25p tc-999 ts-10 text-right">(980)</span>
                    </li>
                    <li class="h25 lh-25 ts-0">
                        <a class="inline-block w70p t-ellipsis ts-12" href="javascript:;">发地方1欧迪芬地方的</a>
                        <span class="pr-5 pull-right w25p tc-999 ts-10 text-right">(300)</span>
                    </li>
                </ul>
                <ul class="pt-20 pb-20 bd-bottom-dotted-ccc ts-12">
                    <li class="text-center bg-ccc h25 lh-25 mb-10 tc-333 ts-14">点赞排行</li>
                    <li class="h25 lh-25 ts-0">
                        <a class="inline-block w70p t-ellipsis ts-12" href="javascript:;">论母猪的产后护理论母猪的产后护理</a>
                        <span class="pr-5 pull-right w25p tc-999 ts-10 text-right">(21541)</span>
                    </li>
                    <li class="h25 lh-25 ts-0">
                        <a class="inline-block w70p t-ellipsis ts-12" href="javascript:;">一路和和广佛艾芬达放大法3</a>
                        <span class="pr-5 pull-right w25p tc-999 ts-10 text-right">(980)</span>
                    </li>
                    <li class="h25 lh-25 ts-0">
                        <a class="inline-block w70p t-ellipsis ts-12" href="javascript:;">发地方1欧迪芬地方的</a>
                        <span class="pr-5 pull-right w25p tc-999 ts-10 text-right">(300)</span>
                    </li>
                </ul>
                <ul class="pt-20 pb-20 bd-bottom-dotted-ccc ts-12">
                    <li class="text-center bg-ccc h25 lh-25 mb-10 tc-333 ts-14">推荐文章</li>
                    <li class="h25 lh-25 ts-0">
                        <a class="inline-block w70p t-ellipsis ts-12" href="javascript:;">论母猪的产后护理论母猪的产后护理</a>
                        <span class="pr-5 pull-right w25p tc-999 ts-10 text-right">(21541)</span>
                    </li>
                    <li class="h25 lh-25 ts-0">
                        <a class="inline-block w70p t-ellipsis ts-12" href="javascript:;">一路和和广佛艾芬达放大法3</a>
                        <span class="pr-5 pull-right w25p tc-999 ts-10 text-right">(980)</span>
                    </li>
                    <li class="h25 lh-25 ts-0">
                        <a class="inline-block w70p t-ellipsis ts-12" href="javascript:;">发地方1欧迪芬地方的</a>
                        <span class="pr-5 pull-right w25p tc-999 ts-10 text-right">(300)</span>
                    </li>
                </ul>
            </div>
            <div class="inline-block pl-20 pr-20 ml-5 w983 bd-ccc ts-14 v-top">
                <ul>
                	<c:forEach var="blog" items="${requestScope.blogs}">
	                	<li class="pb-20 bd-bottom-dotted-ccc">
	                        <h3 class="h40 lh-40">
	                            <a href="javascript:;">
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
	                        <p class="content ts-14 tc-999 lh-30 pos-rel">
	                        	${blog.contentId.content}
	                            <span class="omit pos-ab bottom-0 right-0 ts-12 w28 bg-white none">...</span>
	                        </p>
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
                <p class="h60 pt-10 pb-10 ts-12 tc-999 text-center">
                    <span class="inline-block h30 lh-30 pr-5 v-top">${requestScope.blogs.size()}条</span>
                    <span class="inline-block h30 lh-30 pr-5 v-top">共${requestScope.blogsCount}页</span>
                    <a class="inline-block w30 h30 lh-30 text-center bd-ccc tc-ccc v-top bg-green tc-white" href="/myBlogs/getAll/1">1</a>
                    <a class="inline-block w30 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="javascript:;">2</a>
                    <a class="inline-block w30 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="javascript:;">3</a>
                    <a class="inline-block w50 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="javascript:;">下一页</a>
                    <a class="inline-block w50 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1">首页</a>
                    <a class="inline-block w50 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="javascript:;">尾页</a>
                </p>
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
<script src="/myBlogs/blogs/js/jquery-3.0.0.min.js"></script>
<script src="/myBlogs/blogs/js/blogs.js"></script>
</html>