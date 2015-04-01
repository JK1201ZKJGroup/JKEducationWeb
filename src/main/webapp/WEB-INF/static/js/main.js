/**
 * Created by Administrator on 15-3-28.
 */
$(document).ready(function(){
    $(window).scroll(function(){
            var top=$(document).scrollTop();
            //alert(top);
            if(top>80){
                $('.course-sidebar').addClass('fixed');
                $('.course-tools').addClass('fixed');
            }
            else{
                $('.course-sidebar').removeClass('fixed');
                $('.course-tools').removeClass('fixed');
            }
        }

    )
});

$('.course-category').hover(
    function(){
        $(this).addClass('hover');
        $(this).children('.course-category-sort').css('display','block');
    },
    function(){
        $(this).removeClass('hover');
        $(this).children('.course-category-sort').css('display','none');
    }
);

$('.set_btn').hover(
  function(){
      $('#header-avator').addClass('hover');
      $('#nav_list').css('display','block');
  },
    function(){
        $('#header-avator').removeClass('hover');
        $('#nav_list').css('display','none');
    }
);

$('#js-signin-btn').click(function(){
    $('#signin').css('display','block');
    $('.modal-backdrop').css('display','block');
    }
);

$('.search-input').focus(
    function(){
        $('.search-area').addClass('focus');
    }
);

$('.wrap-boxes li').click(function(){
    $(this).siblings().removeClass('nav-active');
    $(this).siblings().children('a').removeClass('onactive');
    $(this).addClass('nav-active');
    $(this).children('a').addClass('onactive');
    var index=$(this).index();
    $('.setting-right-wrap .setting-wrap').css('display','none').eq(index).css('display','block');
});

$('.btn-add-follow').click(function(){
    if($('.btn-add-follow').hasClass('btn-remove-follow'))
    {
        $(this).removeClass('btn-remove-follow');
        $('.concerned-icon').html('关注此课程');
    }
    else{
        $(this).addClass('btn-remove-follow');
        $('.concerned-icon').html('已关注');
    }
});

$('.learnchapter').click(function(){
    if($(this).hasClass('learnchapter-active')){
        $(this).removeClass('learnchapter-active');
        $(this).find('span').html('+');
        $(this).find('.hasOpenOn').removeClass().addClass('hasOpen');
    }
    else{
        $(this).addClass('learnchapter-active');
        $(this).find('span').html('-');
        $(this).find('.hasOpen').removeClass().addClass('hasOpenOn');
    }
});