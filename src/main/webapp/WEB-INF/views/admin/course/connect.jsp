<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="static/css/zTreeStyle.css" rel="stylesheet">
<link href="static/css/site.css" rel="stylesheet">
<style type="text/css">
.guanLian{
margin-left:0!important;
margin-right:0!important;
margin-bottom:10px;
}

.forSearch{
font-size:1rem!important;
}
</style>
<title>课程分类信息关联</title>
</head>
<body>
	<div class="am-cf admin-main">
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">课程分类信息关联</strong> 
				</div>
			</div>
			<div class="am-form-group am-form-horizontal">
				<label for="doc-ipt-3" class="am-u-sm-2 am-form-label">课程名称:</label>
				<div class="am-u-sm-6">
					<input type="text" name="name" class="am-form-field am-input-sm" disabled="disabled" value="${course.name}">
				</div>
				<input type="hidden" id="courseId" value="${course.id}">
				<p style="clear:both"></p>
			</div>
			<div class="am-g guanLian">
			<div class="am-u-sm-offset-2 am-u-sm-5">
			<form class="am-form-inline" role="form">
			  <div class="am-form-group am-form-group-sm ">
			    <input type="text" class="am-form-field am-input-sm forSearch" placeholder="关键字" id="keyword">
			  </div>
			  <a href="javascript:void(0)" class="am-btn am-btn-default am-btn-xs am-text-secondary" id="search">搜索分类</a>
			</form>
			</div>
			<div class="zTreeDemoBackground am-u-sm-3">  
				 
				<button id="refresh" class="am-btn am-btn-default am-btn-xs am-text-secondary">刷新树</button>
				<ul id="ztree" class="ztree">
				</ul> 
			</div> 
			</div>
			<table class="am-table am-table-striped am-table-hover">
				<thead>
					<tr>
						<th>
							分类
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cates.content}" var="classification">
				<tr>
					<td>${classification.parent.name}----->${classification.name}</td>
					<td><button href = "javascript:void()" value="${classification.id}" class="am-btn am-btn-default am-btn-xs am-text-success">关联分类</button></td>
				</tr>
					</c:forEach>
				</tbody>
			</table>
							    
						
		</div>
		</div>
		<script src="static/js/jquery.ztree.all-3.5.min.js"></script>
		<script src="static/js/site.js"></script>
<script>
	var zTree;  
	var courseId = $("#courseId").val();
	var treeNodes;
	var setting = {
	   edit: {
                enable: true,
                showRemoveBtn: true,
                showRenameBtn: false
            },  
	   data: {
		simpleData: {
			enable: true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: 0
		},
		keep:{
			parent:true
		}
	},
		view:{
			showIcon:true,
		},
		callback:{
			beforeRemove: beforeRemove,
			onRemove:onRemove
		}
	};  
	$("#refresh").click(function(){
		 $.ajax({  
	        async : false,    
	        type: 'get',  
	        dataType : "json",  
	        url: "<%=basePath%>api/"+courseId+"/jsonTree",//请求的action路径  
	        error: function () {//请求失败处理函数  
	            alert('请求失败');  
	        },  
	        success:function(data){ //请求成功后处理函数。    
	            console.log(data);  
	            treeNodes = data;   //把后台封装好的简单Json格式赋给treeNodes 
	            $.fn.zTree.init($("#ztree"), setting, treeNodes); 
	        }  
	    });  
	})
	
	function beforeRemove(treeId, treeNode){
	alert("确定要删除\""+treeNode.name+"\"嘛?");
	}
	
	$(".am-text-success").click(function(){
		var claId = $(this).val(); 
		$.ajax({
				type:"GET",
				url:"<%=basePath%>api/"+claId+"/connected?courseid="+courseId,
				success:function(data){
					alert("关联成功");
					$("#refresh").click();
				},
				error:function(data){
					alert("关联成功");
					$("#refresh").click();
				}
			});
	});
	
	
	function onRemove(event, treeId, treeNode){
			$.ajax({
				type:"GET",
				url:"${contextPath}/admin/biz/"+treeNode.bcid+"/disconnect",
				success:function(data){
					alert(data);
					$("#refresh").click();
				},
				error:function(data){
					alert(data);
				}
			});
	}
	
	 $("#search").click(function (){
	        var keyword = $("#keyword").val();
	        window.location.href = "admin/course/"+${course.id}+"/search?keyword="+keyword;
			}) 
	</script>

</body>
</html>
