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
      <li><a href="#tab1">课程信息</a></li>
    </ul>
<sf:form method="post" modelAttribute="course" onsubmit="return" class="am-form" id="tab1">
    <div class="am-tabs-bd">
      <div class="am-tab-panel am-fade">
      
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              课程名称:
            </div>
           <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
              <sf:input type="text" class="am-input-sm" path="name"/>
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              作者:
            </div>
             <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
              <sf:input type="text" class="am-input-sm" path="avater"/>
            </div>
          </div>

          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              是否免费:
            </div>
            <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
             <sf:input type="text" class="am-input-sm" path="freeflag"/>
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              观看价格:
            </div>
            <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
             <sf:input type="text" class="am-input-sm" path="price"/>
            </div>
          </div>

          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
            点击量:
            </div>
             <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
              <sf:input type="text" class="am-input-sm" path="view"/>
            </div>
          </div>

      </div>
    </div>
    <div class="am-margin">
    	<button type="submit" class="am-btn am-btn-primary am-btn-xs">提交保存</button>
    	<button type="button" class="am-btn am-btn-primary am-btn-xs">放弃保存</button>
  	</div>
     </sf:form>
  </div>

  
  	
	</div>
	</div>
<footer>
  <hr>
  <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>
</body>
</html>