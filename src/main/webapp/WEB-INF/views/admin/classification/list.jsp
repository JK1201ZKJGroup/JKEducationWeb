<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>分类管理</title>
</head>
<body>
<div class="am-cf admin-main">
	<div class="admin-content">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">分类管理</strong> </div>
    </div>

    <div class="am-g">
      <div class="am-u-sm-12 am-u-md-6">
        <div class="am-btn-toolbar">
          <div class="am-btn-group am-btn-group-xs">
            <a href="admin/classification/add?parentid=${model.id}" class="am-btn am-btn-default am-btn-xs am-text-secondary" >
         	<span class="am-icon-pencil-square-o"></span>添加
         	</a>
          </div>
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
                <th class="table-date am-hide-sm-only">父分类名称</th>
                <th class="table-date am-hide-sm-only">查看子分类</th>        
                <th class="table-set">操作</th>
              </tr>
          </thead>
           <tbody>
           <c:forEach items="${list.content}" var="classification">
            <tr>
              <td><input type="checkbox" /></td>
			  <td>${classification.id }</td>
		      <td>${classification.name}</td>
		      <td>
		       <a href="admin/classification/${classification.id}/show" class="am-btn am-btn-default am-btn-xs am-text-secondary" >
         		<span class="am-icon-pencil-square-o"></span> 查看子分类
         	   </a>
         	   </td>
		<td>
		 <div class="am-btn-toolbar">
         	<div class="am-btn-group am-btn-group-xs">
         <a href="admin/classification/${classification.id}/update" class="am-btn am-btn-default am-btn-xs am-text-secondary" >
         	<span class="am-icon-pencil-square-o"></span> 查看并修改
         </a>
         <a href="admin/classification/${classification.id}/delete" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
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
  <span class="total-page">${list.getNumber()+1} / ${list.getTotalPages()}&nbsp;&nbsp;总共${list.getTotalElements()}条</span>
  <div class="am-fr">
  <c:url var="base_url" value="admin/classification/classifications"/>
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