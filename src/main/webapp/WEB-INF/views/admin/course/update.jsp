<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
					<li><a href="#tab1">课程信息修改</a></li>
				</ul>
				<sf:form method="post" modelAttribute="course" class="am-form"
					id="tab1" enctype="multipart/form-data">
					<div class="am-tabs-bd">
						<div class="am-tab-panel am-fade">

							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">课程名称:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<sf:input type="text" class="am-input-sm" path="name" />
								</div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">作者:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<sf:input type="text" class="am-input-sm" path="avater" />
								</div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">是否免费:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<select name="freeflag">
									<c:if test="${course.freeflag==true}">							
										<option value="1" selected>免费</option>
										<option value="0" >收费</option>
									</c:if>
									<c:if test="${course.freeflag==false}">
										<option value="1" >免费</option>
										<option value="0" selected>收费</option>
									</c:if>
									</select>
								</div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">观看价格:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<sf:input type="text" class="am-input-sm" path="price" />
								</div>
							</div>
							
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">课程时长:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<sf:input type="text" class="am-input-sm" path="duration" />
								</div>
							</div>
			
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">课程难度:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<sf:input type="text" class="am-input-sm" path="level" />
								</div>
							</div>
											
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">点击量:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<sf:input type="text" class="am-input-sm" path="view" />
								</div>
							</div>
							
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">学习人数:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<sf:input type="text" class="am-input-sm" path="studentnum" />
								</div>
							</div>		

							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">课程简介:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<sf:input type="text" class="am-input-sm" path="introduction" />
								</div>
							</div>
							
<!-- 							<div class="am-g am-margin-top"> -->
<!-- 								<div class="am-u-sm-4 am-u-md-2 am-text-right">课程分类:</div> -->
<!-- 								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end"> -->
<!-- 									<input type="text" class="am-input-sm" name="classificationname" value="classification.name" /> -->
<!-- 								</div> -->
<!-- 							</div>		 -->
																								
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">封面图片:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<input type="file" class="am-input-sm" name="attach2" />
								</div>
							</div>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">文件上传:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<input type="file" class="am-input-sm" name="attach1" />
								</div>
							</div>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right"></div>
							</div>

						</div>
					</div>
					<div class="am-margin">
						<button type="submit" class="am-btn am-btn-primary am-btn-xs">提交保存</button>
						<button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="javascript:window.history.go(-1)">放弃保存</button>
					</div>
				</sf:form>
			</div>

		</div>
	</div>

</body>
</html>
