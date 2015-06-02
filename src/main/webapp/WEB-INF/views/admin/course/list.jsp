<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>课程管理</title>
</head>
<body>
	<div class="am-cf admin-main">
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">表格</strong> / <small>Table</small>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12 am-u-md-6">
					<div class="am-btn-toolbar">
						<div class="am-btn-group am-btn-group-xs">
							<a href="admin/course/add"
								class="am-btn am-btn-default am-btn-xs am-text-secondary">
								<span class="am-icon-pencil-square-o"></span>添加
							</a>
							<button type="button" class="am-btn am-btn-default">
								<span class="am-icon-save"></span> 保存
							</button>
							<button type="button" class="am-btn am-btn-default">
								<span class="am-icon-archive"></span> 审核
							</button>
							<button type="button" class="am-btn am-btn-default">
								<span class="am-icon-trash-o"></span> 删除
							</button>
						</div>
					</div>
				</div>
				<div class="am-u-sm-12 am-u-md-3">
					<div class="am-form-group">
						<select name="classfy" data-am-selected="{btnSize: 'sm'}">
							<option value="option1">所有类别</option>
							<option value="option2">IT业界</option>
							<option value="option3">数码产品</option>
							<option value="option3">笔记本电脑</option>
							<option value="option3">平板电脑</option>
							<option value="option3">只能手机</option>
							<option value="option3">超极本</option>
						</select>
					</div>
				</div>
				<div class="am-u-sm-12 am-u-md-3">
					<div class="am-input-group am-input-group-sm">
						<input type="text" class="am-form-field"> <span
							class="am-input-group-btn">
							<button class="am-btn am-btn-default" type="submit">搜索</button>
						</span>
					</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<form class="am-form">
						<table class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th class="table-check"><input type="checkbox" /></th>
									<th class="table-id">ID</th>
									<th class="table-date am-hide-sm-only">课程名称</th>
									<th class="table-date am-hide-sm-only">作者</th>
									<th class="table-date am-hide-sm-only">课程照片</th>
									<th class="table-author am-hide-sm-only">是否免费</th>
									<th class="table-date am-hide-sm-only">观看价格</th>
									<th class="table-date am-hide-sm-only">课程时长</th>
									<th class="table-date am-hide-sm-only">课程难度</th>
									<th class="table-date am-hide-sm-only">点击量</th>
									<th class="table-date am-hide-sm-only">学习人数</th>
									<th class="table-date am-hide-sm-only">课程简介</th>
									<th class="table-date am-hide-sm-only">分类</th>
									<th class="table-set">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list.content}" var="course">
									<tr>
										<td><input type="checkbox" /></td>
										<td>${course.id }</td>
										<td>${course.name}</td>
										<td class="am-hide-sm-only">${course.author}</td>
										<td class="am-hide-sm-only"><img src="${course.avatar}" width="50px" height="50px"></td>
										<td class="am-hide-sm-only"><c:if test="${course.freeflag==true}">免费</c:if><c:if test="${course.freeflag==false}">收费</c:if></td>
										<td class="am-hide-sm-only">${course.price}</td>
										<td class="am-hide-sm-only">${course.duration}</td>
										<td class="am-hide-sm-only">${course.level}</td>
										<td class="am-hide-sm-only">${course.view}</td>
										<td class="am-hide-sm-only">${course.studentnum}</td>
										<td class="am-hide-sm-only">${course.introduction}</td>
										<td class="am-hide-sm-only"></td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													<a href="admin/course/${course.id}/update"
														class="am-btn am-btn-default am-btn-xs am-text-secondary">
														<span class="am-icon-pencil-square-o"></span> 查看并修改
													</a> <a href="admin/course/${course.id}/delete"
														class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
														<span class="am-icon-trash-o"></span> 删除
													</a>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>

				<div class="am-cf am-u-sm-12">
					<span class="total-page">${list.getNumber()+1} /
						${list.getTotalPages()}&nbsp;&nbsp;总共${list.getTotalElements()}条</span>
					<div class="am-fr">
						<c:url var="base_url" value="admin/course/courses" />
						<ul class="am-pagination">
							 <li><a href="${base_url}?page=0">首页</a></li>
      	<c:if test="${list.hasPrevious()}">
				<li><a href="${base_url}?page=${list.getNumber()-1}"> 
				<c:out value="上一页"></c:out>
				</a></li>
	 	</c:if>
	 	<c:if test = "${list.getNumber()>2}">
				<c:set var = "CenterFirst" value = "${list.getNumber()-3}"/>
		</c:if>
		<c:if test = "${list.getNumber()<=2}">
				<c:set var = "CenterFirst" value = "0"/>
		</c:if>
		<c:if test = "${3<list.getTotalPages()&&(list.getNumber()+3)<list.getTotalPages()}">
				<c:set var = "CenterLast" value = "${list.getNumber()+3}"/>
		</c:if>
		<c:if test = "${list.getNumber()+3>=list.getTotalPages()&&list.getTotalPages()!=0}">
				<c:set var = "CenterLast" value = "${list.getTotalPages()-1}"/>
		</c:if>
		<c:if test = "${list.getTotalPages() == 0}">
				<c:set var = "CenterLast" value = "0"/>
		</c:if>
		<c:forEach var="value" begin="${CenterFirst}"
				end="${CenterLast}" step="1">
				<c:if test="${list.getNumber()==value}">
			<li class="am-active"><a href="${base_url}?page=${value}">${value+1}</a></li>
				</c:if>
				<c:if test="${list.getNumber()!=value}">
			<li><a href="${base_url}?page=${value}">${value+1}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${list.hasNext()}">
				<li><a href="${base_url}?page=${list.getNumber()+1}"> 
				<c:out value="下一页"/>
				</a></li>
			</c:if>
							<li><a href="${base_url}?page=${list.getTotalPages()-1}">末页</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
