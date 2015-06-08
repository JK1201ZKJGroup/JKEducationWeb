<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="static/css/amazeui.min.css"/>
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
  <hr />
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