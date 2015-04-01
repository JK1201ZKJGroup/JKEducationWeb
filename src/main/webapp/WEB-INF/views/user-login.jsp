<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/css/poplogin-less.css" type="text/css">
</head>
<body>
<div id="main">
    <div class="container discover-container">
        <div id="signin" class="rl-modal in" aria-hidden="false">
            <div class="rl-modal-header">
                <h1>
                    <span class="active-title">登录</span>
                </h1>
                <button type="button" class="rl-close" data-dismiss="modal" hidefocus="true" aria-hidden="true"></button>
            </div>
            <div class="rl-modal-body">
                <div class="clearfix">
                    <div class="l-left-wrap l">
                        <form id="signup-form" autocomplete="off">
                            <div class="rlf-group">
                                <input type="text" name="email" data-validate="email" autocomplete="off" class="ipt ipt-email" placeholder="请输入登录邮箱">
                                <p class="rlf-tip-wrap"></p>
                                <input style="display:none;">
                            </div>
                            <div class="rlf-group">
                                <input type="password" name="password" autocomplete="off" class="ipt ipt-pwd" placeholder="请输入密码">
                                <p class="rlf-tip-wrap"></p>
                            </div>
                            <div class="rlf-group rlf-appendix clearfix">
                                <label for="auto-signin" class="l" hidefocus="true"><input type="checkbox" checked="checked" id="auto-signin">自动登录</label>
                                <a href="" class="rlf-forget r" target="_blank" hidefocus="true">忘记密码 </a>
                            </div>
                            <div class="rlf-group clearfix">
                                <p class="rlf-tip-wrap " id="signin-globle-error"></p>
                                <input type="button" id="signin-btn" value="登录" hidefocus="true" class="btn-red btn-full">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="rl-model-footer">
                <div class="pop-login-sns clearfix">
                    <span class="l">联合登录</span>
                    <a href="javascript:void(0)" hidefocus="true" data-login-sns="/user/loginweibo" class="pop-sns-weibo r"><i class="icon-weibo"></i>微博</a>
                    <a href="javascript:void(0)" hidefocus="true" data-login-sns="/user/loginqq" class="pop-sns-qq r"><i class="icon-qq"></i>QQ</a>
                    <a href="javascript:void(0)" hidefocus="true" data-login-sns="/user/loginweixin" class="pop-sns-weixin r"><i class="icon-weixin"></i>微信</a>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>