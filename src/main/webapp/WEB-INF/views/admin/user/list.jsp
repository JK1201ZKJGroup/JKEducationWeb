<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>用户管理</title>
</head>
<body>
<div class="am-cf admin-main">
	<div class="admin-content">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户管理</strong></div>
    </div>

    <div class="am-g">
      <div class="am-u-sm-12 am-u-md-6">
        <div class="am-btn-toolbar">
          <div class="am-btn-group am-btn-group-xs">
            <a href="admin/user/add" class="am-btn am-btn-default am-btn-xs am-text-secondary" >
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
                <th class="table-title">账号</th>
                <th class="table-type">昵称</th>
                <th class="table-date am-hide-sm-only">联系电话</th>
                <th class="table-author am-hide-sm-only">账户金额</th>
                <th class="table-date am-hide-sm-only">邮箱</th>
                <th class="table-date am-hide-sm-only">地址</th>
                <th class="table-set">操作</th>
              </tr>
          </thead>
           <tbody>
           <c:forEach items="${list.content}" var="account">
            <tr>
              <td><input type="checkbox" /></td>
			  <td>${account.user.id }</td>
		      <td>${account.user.phone}</td>
		      <td><a href="admin/user/${account.user.id}/update">${account.user.nickname}</a></td>
		      <td class="am-hide-sm-only">${account.user.phone}</td>
		      <td class="am-hide-sm-only">${account.user.amount}</td> 
		      <td class="am-hide-sm-only">${account.user.email}</td>
		      <td class="am-hide-sm-only">${account.user.address}</td>
		<td>
		 <div class="am-btn-toolbar">
         	<div class="am-btn-group am-btn-group-xs">
         <a href="admin/user/${account.user.id}/update" class="am-btn am-btn-default am-btn-xs am-text-secondary" >
         	<span class="am-icon-pencil-square-o"></span> 查看并修改
         </a>
         <a href="javascript:
         if(window.confirm('你确定要删除用户：${account.user.phone}吗？')){
         window.location.href = 'admin/user/${account.user.id}/delete';}
         else{}" 
         class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
         	<span class="am-icon-trash-o"></span> 删除
         </a>
         <c:if test = "${account.enabled == true}">
         <a href="admin/user/${account.user.id}/forbidden" onclick="forbidden()" class="am-btn am-btn-default am-btn-xs am-text-warning am-hide-sm-only">
         	<span class="am-icon-trash-o"></span> 禁用
         </a>
         </c:if>
         <c:if test="${account.enabled == false}">
         <a href="admin/user/${account.user.id}/forbidden" onclick="forbidden()" disabled="disabled" class="am-btn am-btn-default am-btn-xs am-text-warning am-hide-sm-only">
         	<span class="am-icon-trash-o"></span> 禁用
         </a>
         </c:if>
         <c:if test = "${account.enabled == true}">
         <a href="admin/user/${account.user.id}/start" onclick="start()" disabled="disabled" class="am-btn am-btn-default am-btn-xs am-text-success am-hide-sm-only">
         	<span class="am-icon-trash-o"></span> 启用
         </a>
         </c:if>
         <c:if test = "${account.enabled == false}">
         <a href="admin/user/${account.user.id}/start" onclick="start()" class="am-btn am-btn-default am-btn-xs am-text-success am-hide-sm-only">
         	<span class="am-icon-trash-o"></span> 启用
         </a>
         </c:if>
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
  <c:url var="base_url" value="admin/user/users"/>
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
<script type="text/javascript">
	function forbidden(){
		alert("该账号禁用成功！");
	}
	
	function start(){
		alert("该账号启用成功！");
	}
</script>

</body>
</html>
