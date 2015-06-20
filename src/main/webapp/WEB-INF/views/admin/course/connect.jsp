<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="static/css/zTreeStyle.css" rel="stylesheet">
<link href="static/css/site.css" rel="stylesheet">
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
			<div class="am-form-group">
				<label for="doc-ipt-3" class="am-u-sm-2 am-form-label">课程名称:</label>
				<div class="am-u-sm-10">
					<input type="text" name="name" disabled="disabled" value="${course.name}">
				</div>
			</div>
			<div class="zTreeDemoBackground am-u-sm-3">  
				<ul id="ztree" class="ztree"></ul>  
				<button id="refresh" class="am-btn am-btn-default am-btn-xs am-text-secondary">刷新树</button>
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
	        url: "${contextPath}/admin/biz/"+"/jsonTree",//请求的action路径  
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
	
	$(".btn-success").click(function(){
		var claId = $(this).val(); 
		$.ajax({
				type:"GET",
				url:"${contextPath}/admin/biz/"+claId+"/connected?bizid=${model.id}",
				success:function(data){
					alert(data);
					$("#refresh").click();
				},
				error:function(data){
					alert(data);
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
	
	</script>

</body>
</html>
