<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<head>
  <meta charset="UTF-8">
  <title>Login Page | Amaze UI Example</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="static/i/favicon.png">
    <link rel="stylesheet" href="static/css/poplogin-less.css" type="text/css">
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style>
  <base href="<%=basePath%>">  
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>在线教育平台登陆</h1>
  </div>
</div>
<div id="main">
    <div class="container discover-container">
        <div id="signin" class="rl-modal in" aria-hidden="false">
            <div class="rl-modal-header">
                <h1>
                    <span class="active-title">登录</span>
                </h1>
            </div>
            <div class="rl-modal-body">
                <div class="clearfix">
                    <div class="l-left-wrap l">
                        <form id="signup-form"  action="<%=basePath%>j_spring_security_check" method="post">
                            <div class="rlf-group">
                                <input type="text" name="j_username" class="ipt ipt-email" placeholder="请输入登录账号">
                                <p class="rlf-tip-wrap"></p>
                            </div>
                            <div class="rlf-group">
                                <input type="password" name="j_password" class="ipt ipt-pwd" placeholder="请输入密码">
                                <p class="rlf-tip-wrap"></p>
                            </div>
                            <div class="rlf-group rlf-appendix clearfix">
                                <label for="auto-signin" class="l" hidefocus="true"><input type="checkbox" checked="checked" name='_spring_security_remember_me' id="auto-signin">记住我</label>
                                <a href="register/admin" class="rlf-forget r" hidefocus="true">注册账号 </a>
                            </div>
                            <div class="rlf-group clearfix">
                                <p class="rlf-tip-wrap " id="signin-globle-error"></p>
                                <input type="submit" id="signin-btn" value="登录" hidefocus="true" class="btn-red btn-full">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
