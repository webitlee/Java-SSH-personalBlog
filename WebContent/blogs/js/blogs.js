/**
 * Created by liyanan on 2017/5/12.
 */
$(function(){
    //文章内容多余省略
    $('.content').each(function(){
        var lh = parseInt($(this).css('line-height'));
        console.log($(this).height());
        if($(this).height() >= lh * 3){
            $(this).addClass('of-hidden').height(lh * 3);
            $(this).children('.omit').removeClass('none');
        }
    });
    //文章内容只显示文字，去掉img
    $('.content').find('img').remove();

    //根据总页生成分页
    var pages = parseInt($('#pages').attr('data-pages'));
    var $paging = $('#paging');
    for(var i = 0; i < pages; i++){
        if(i == 0){
            $paging.append('<a class="page inline-block w30 h30 lh-30 text-center bd-ccc tc-ccc v-top bg-green tc-white" href="/myBlogs/getAll/1?pageIndex='+i+'">'+(i+1)+'</a>');
        }else{
            $paging.append('<a class="page inline-block w30 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1?pageIndex='+i+'">'+(i+1)+'</a>')
        }
    }
    $paging.append('<a id="page_first" class="inline-block w50 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1">首页</a>');
    $paging.append('<a id="page_last" class="inline-block w50 h30 lh-30 text-center bd-ccc tc-ccc v-top" href="/myBlogs/getAll/1?pageIndex='+(pages-1)+'">尾页</a>');

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

    //csdn博客
    $('#csdn').mouseenter(function(){
        $(this).children('i').removeClass('bg-c').addClass('bg-c-hover');
    });
    $('#csdn').mouseleave(function(){
        $(this).children('i').removeClass('bg-c-hover').addClass('bg-c');
    });
    //邮箱
    $('#email').mouseenter(function(){
        $(this).children('i').removeClass('bg-email').addClass('bg-email-hover');
    });
    $('#email').mouseleave(function(){
        $(this).children('i').removeClass('bg-email-hover').addClass('bg-email');
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