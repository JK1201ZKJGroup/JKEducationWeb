<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<sf:form method="post" modelAttribute="account" onsubmit="return ">
<table width="100%" align="center" cellspacing="0" cellpadding="0" class="table table-bordered table-striped">
	<tr>
	<td>用户名:</td><td><sf:input path="username"/></td>
	</tr>
	<tr>
	<td>密码：</td><td><sf:input path="password"/></td>
	</tr>
	<tr>
	<td colspan="2" style="text-align: center">
		<input type="submit" value="提交" class="bth btn-primary"/>
		<input type="button" value="返回" class="bth btn-primary" onClick="javascript:history.go(-1);"/>
	</td>
	</tr>
</table>
</sf:form>

</body>
</html>