/**
 * Created by liyanan on 2017/5/12.
 */
$(function(){
    $('.content').each(function(){
    	//内容text显示为html
    	var html = $(this).children('p').text();
		$(this).children('p').html(transferspecialchars(html));
		
		//文章内容多余省略
        var lh = parseInt($(this).css('line-height'));
        if($(this).height() >= lh * 3){
            $(this).addClass('of-hidden').height(lh * 3);
            $(this).children('.omit').removeClass('none');
        }
    });
    //文章内容只显示文字，去掉img
    $('.content').find('img').remove();

    //根据总页数生成分页
    var pages = parseInt($('#pages').attr('data-pages'));
    var pagingClassification = $('#pages').attr('data-classification');
    var pagingKeyword = $('#pages').attr('data-keyword');
    var arguments = location.search.substring('1').split('&');
    var classificationId = null;
    var keyword = null;
    var pageIndex = 0;
    for(var i = 0; i < arguments.length; i++){
        var arr = arguments[i].split('=');
        if(arr[0] == 'classificationId'){
            classificationId = arr[1];
        }else if(arr[0] == 'keyword'){
            keyword = encodeURIComponent(arr[1]);
        }
        if(arr[0] == 'pageIndex'){
        	pageIndex = arr[1];
        }
    }
    var $paging = $('#paging');
    if(pagingClassification === 'true'){
        for(var i = 0; i < pages; i++){
            if(i == pageIndex){
                $paging.append('<a class="page inline-block w30 h30 lh-30 text-center bd-ccc tc-ccc v-top bg-green tc-white" href="/myBlogs/getAll/1?pageIndex='+i+'&classificationId='+classificationId+'">'+(i+1)+'</a>');
            }else{
                $paging.append('<a class="page inline-block w30 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1?pageIndex='+i+'&classificationId='+classificationId+'">'+(i+1)+'</a>');
            }
        }
        $paging.append('<a id="page_first" class="inline-block w50 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1?classificationId='+classificationId+'">首页</a>');
        $paging.append('<a id="page_last" class="inline-block w50 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1?pageIndex='+(pages-1)+'&classificationId='+classificationId+'">尾页</a>');

    }else if(pagingKeyword === 'true'){
        for(var i = 0; i < pages; i++){
            if(i == pageIndex){
                $paging.append('<a class="page inline-block w30 h30 lh-30 text-center bd-ccc tc-ccc v-top bg-green tc-white" href="/myBlogs/getAll/1?pageIndex='+i+'&keyword='+keyword+'">'+(i+1)+'</a>');
            }else{
                $paging.append('<a class="page inline-block w30 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1?pageIndex='+i+'&keyword='+keyword+'">'+(i+1)+'</a>');
            }
        }
        $paging.append('<a id="page_first" class="inline-block w50 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1?keyword='+keyword+'">首页</a>');
        $paging.append('<a id="page_last" class="inline-block w50 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1?pageIndex='+(pages-1)+'&keyword='+keyword+'">尾页</a>');
    }else{
        for(var i = 0; i < pages; i++){
        	if(i == pageIndex){
        		$paging.append('<a class="page inline-block w30 h30 lh-30 text-center bd-ccc tc-ccc v-top bg-green tc-white" href="/myBlogs/getAll/1?pageIndex='+i+'">'+(i+1)+'</a>')
        	}else{
        		$paging.append('<a class="page inline-block w30 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1?pageIndex='+i+'">'+(i+1)+'</a>')
        	}
        }
        $paging.append('<a id="page_first" class="inline-block w50 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1">首页</a>');
        $paging.append('<a id="page_last" class="inline-block w50 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1?pageIndex='+(pages-1)+'">尾页</a>');
    }

    //页码点击跳转
    $(document).on('click', '.page', function(){
        $(this).siblings('.page').removeClass('bg-green tc-white');
        $(this).addClass('bg-green tc-white');
    });
    $(document).on('click', '#page_first', function(){
        $('.page').removeClass('bg-green tc-white');
        $('.page').first().addClass('bg-green tc-white');
    });
    $(document).on('click', '#page_last', function(){
        $('.page').removeClass('bg-green tc-white');
        $('.page').last().addClass('bg-green tc-white');
    });

    //搜索按钮
    $('#btn_search').mouseenter(function(){
        $('#search').removeClass('none');
    });
    $('#btn_search').mouseleave(function(){
        $('#search').addClass('none');
    });

    //返回顶部
    $(window).scroll(function(){
        if($(window).scrollTop() > $(window).height() /2){
            $('#btn_top').show();
        }else{
            $('#btn_top').hide();
        }
    });
    $('#btn_top').click(function(){
        toTop($(window).scrollTop());
    })
});
function toTop(height){
    var scrollTop = $(window).scrollTop(height - 100);
    if(height > 0 ){
        setTimeout(function(){
            toTop(scrollTop);
        },10)
    }
}

function transferspecialchars(str){
	var result = null;
	result = str.replace(/&amp;/ig, "&");
	result = result.replace(/&lt;/ig, "<");
	result = result.replace(/&gt;/ig, ">");
	result = result.replace(/&quot;/ig, "\\");
	return result;
}