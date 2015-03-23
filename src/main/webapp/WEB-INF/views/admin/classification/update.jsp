<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
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
    	<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">表单</strong> / <small>form</small></div>
  	</div>
  	
  	<div class="am-tabs am-margin" data-am-tabs>
    <ul class="am-tabs-nav am-nav am-nav-tabs">
      <li><a href="#tab1">分类信息修改</a></li>
    </ul>
<form method="post"  onsubmit="return" class="am-form" id="tab1">
     <div class="am-tabs-bd">
      <div class="am-tab-panel am-fade">
      
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              父分类名称:
            </div>
           <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
              <input type="text" class="am-input-sm" name="parentname" value="${pmodel.name}" readonly="readonly"/>
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
             子分类名称:
            </div>
             <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
              <input type="text" class="am-input-sm" name="sonname" value="${son.name}"/>
            </div>
          </div>

      </div>
    </div>
    <div class="am-margin">
    	<input type="hidden" class="am-input-sm" name="parentid" value="${pmodel.id}"/>
    	<input type="hidden" class="am-input-sm" name="sonid" value="${son.id}"/>
    	<button type="submit" class="am-btn am-btn-primary am-btn-xs">提交保存</button>
    	<button type="button" class="am-btn am-btn-primary am-btn-xs">放弃保存</button>
  	</div>
     </form>
  </div> 
  
	</div>
	</div>
</body>
</html>