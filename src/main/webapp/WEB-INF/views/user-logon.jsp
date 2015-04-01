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
    <div id="signup" class="rl-modal  in" aria-hidden="false">
        <div class="rl-modal-header">
            <button type="button" class="rl-close" data-dismiss="modal" aria-hidden="true"></button>
            <h1>
                <span class="active-title">注册</span>
            </h1>
        </div>
        <div class="rl-modal-body">
            <form id="signup-form">
                <div class="rlf-group">
                    <input type="text" name="email" data-validate="email" class="ipt ipt-email" autocomplete="off" placeholder="请输入登录邮箱">
                    <p class="rlf-tip-wrap"><span style="display:none">邮箱将作为您主要的身份识别，请输入您有效的邮箱</span></p>
                    <input style="display:none;">
                </div>
                <div class="rlf-group">
                    <input type="password" name="password" data-validate="password" class="ipt ipt-pwd" placeholder="请输入密码">
                    <p class="rlf-tip-wrap"><span style="display:none">请输入6-16位密码，区分大小写，不能使用空格</span></p>
                </div>
                <div class="rlf-group">
                    <input type="password" name="cfmpwd" class="ipt ipt-pwd" placeholder="请再次输入密码">
                    <p class="rlf-tip-wrap"><span style="display:none">请再次输入密码</span></p>
                </div>
                <div class="rlf-group">
                    <input type="text" name="nick" data-validate="nick" class="ipt ipt-nick" placeholder="请输入用户昵称">
                    <p class="rlf-tip-wrap"><span style="display:none">请输入昵称，2-18位中英文、数字或下划线！</span></p>
                </div>
                <div class="rlf-group clearfix">
                    <p class="rlf-tip-wrap rlf-g-tip" id="signup-globle-error"></p>
                    <input type="button" id="signup-btn" value="注册" hidefocus="true" class="btn-red btn-full r">
                </div>
            </form>
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