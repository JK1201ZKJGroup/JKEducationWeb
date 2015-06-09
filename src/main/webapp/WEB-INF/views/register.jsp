<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>Insert title here</title>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>在线教育平台注册</h1>
  </div>
</div>

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
            <sf:form method="post" id="signup-form" modelAttribute="account" onsubmit="return ">
                <div class="rlf-group">
                    <sf:input type="text" name="j_username" class="ipt ipt-email" min-length='2' max-length='18' placeholder="请输入昵称"  path="username"/>
                    <p class="rlf-tip-wrap"><span style="display:none">请输入昵称，2-18位中英文、数字或下划线！</span></p>
                    <input style="display:none;">
                </div>
                <div class="rlf-group">
                    <sf:input type="password" name="password" class="ipt ipt-pwd" placeholder="请输入密码" path="password"/>
                    <p class="rlf-tip-wrap"><span style="display:none">请输入6-16位密码，区分大小写，不能使用空格</span></p>
                </div>
                <!-- <div class="rlf-group">
                    <input type="text" name="nick" data-validate="nick" class="ipt ipt-nick" placeholder="请输入用户昵称">
                    <p class="rlf-tip-wrap"><span style="display:none">请输入昵称，2-18位中英文、数字或下划线！</span></p>
                </div> -->
                <div class="rlf-group rlf-appendix clearfix">
                	<a href="javascript:void(0)" class="rlf-forget r" hidefocus="true" onClick="javascript:history.go(-1);">去登录</a>
                </div>
                <div class="rlf-group clearfix">
                    <p class="rlf-tip-wrap rlf-g-tip" id="signup-globle-error"></p>
                    <input type="submit" id="signup-btn" value="注册"  class="btn-red btn-full r">
                </div>
            </sf:form>
        </div>
    </div>
</div>

</div>

<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
<sf:form method="post" modelAttribute="account" onsubmit="return " class="am-form" >
<label for="email">用户名：</label>
<sf:input  name="j_username"  path="username"/>
<br>
<label for="password">密码：</label>
<sf:input type="password" path="password"/>
<br>
<div class="am-cf">
		<input type="submit" value="提交"  class="am-btn am-btn-primary am-btn-sm "/>
		<input type="button" value="返回" class="am-btn am-btn-primary am-btn-sm " onClick="javascript:history.go(-1);"/>
</div>
	
</sf:form>
 </div>
</div>
</body>
</html>