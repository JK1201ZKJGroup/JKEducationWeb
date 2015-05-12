<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="am-cf admin-main">
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">表单</strong> / <small>form</small>
				</div>
			</div>

			<div class="am-tabs am-margin" data-am-tabs>
				<ul class="am-tabs-nav am-nav am-nav-tabs">
					<li><a href="#tab1">课程分类信息修改</a></li>
				</ul>
				<sf:form method="post" modelAttribute="courseclas" class="am-form"
					id="tab1" enctype="multipart/form-data">
					<div class="am-tabs-bd">
						<div class="am-tab-panel am-fade">

							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">课程名称:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<input type="text" class="am-input-sm" name="courseclas.name()" disabled="disabled" value="${course.name}" />
								</div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">分类名称:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">							
							<c:forEach items="${list}" var="courseclas">
								<input type="text" class="am-input-sm" name="courseclas.name" value="${courseclas.classification.name}" />
								</c:forEach>
								</div>
							</div>	

											
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right"></div>
							</div>
							
		<br>				
	    <c:forEach items="${page2.content}" var="courseclas">
            <tr>
              <td><input type="checkbox" /></td>
              <td>「${courseclas.name}」————</td>
              <td>「${courseclas.name}」</td>
			  <td><a href='admin/courseclas/${id }/connected?classificationname=${courseclas.name}' class="btn btn-primary">关联分类</a></td>
			</tr><br>
		</c:forEach>							
	    <c:forEach items="${page1.content}" var="courseclas">
            <tr>
              <td><input type="checkbox" /></td>
              <td>「${courseclas.parent.name}」————</td>
              <td>「${courseclas.name}」</td>
			  <td><a href='admin/courseclas/${id }/connected?classificationname=${courseclas.name}' class="btn btn-primary">关联分类</a></td>
			</tr><br>
		</c:forEach>
		</div>
	</div>
		<div class="am-margin">
						<button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="javascript:window.history.go(-1)">返回</button>
					</div>
				</sf:form>
			</div>
		</div>
	</div>
       
</body>
</html>
