/**
 * Created by Administrator on 2017/5/21.
 */
$(function(){
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
    });

    //点赞
    $('#btn_support').click(function(){
        var _this = this;
        var blogId = $('#blog_id').attr('data-id');
        $.get('/addSupport?id=' + blogId, function(data){
            if(data.error){
                jAlert(data.error);
            }else{
                var $support = $(_this).children('div');
                var $sum = $support.children('span');
                if($support.hasClass('bg-999')){
                    $support.addClass('bg-orange').removeClass('bg-999');
                    $sum.text(parseInt($sum.text()) + 1);
                }
                jAlert(data.message);
            }
        })
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
