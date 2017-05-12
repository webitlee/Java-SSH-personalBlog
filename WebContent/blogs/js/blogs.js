/**
 * Created by liyanan on 2017/5/12.
 */
$(function(){
    //文章内容多余省略
    $('.content').each(function(){
        var lh = parseInt($(this).css('line-height'));
        if($(this).height() >= lh){
            $(this).addClass('of-hidden').height(lh * 3);
            $(this).children('.omit').removeClass('none');
        }
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