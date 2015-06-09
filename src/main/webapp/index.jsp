<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<base href="<%=basePath%>">  
</head>
<body>
		<a class="am-btn am-btn-primary am-btn-sm" href = "login.jsp">登录</a>
		<a class="am-btn am-btn-primary am-btn-sm" href = "register/admin">注册</a>

</body>
</html>
