<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<!doctype html>
<html class="no-js">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9;IE=8;IE=7;IE=EDGE"> 
<title><decorator:title default="计科1201" /></title>
<link rel="shortcut icon" href="static/image/favicon.ico">
<link rel="Bookmark" href="static/image/favicon.ico">
<meta name="author" content="zkjGroup">
<meta name="Copyright" content="版权信息">
<meta name="description" content="站点介绍">
<meta name="keywords" content="在线教育平台">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="static/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="static/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="static/css/index.css" type="text/css">
<decorator:head />
</head>
<body id="List_courseId">


  <decorator:body />
  



<script src="static/js/jquery-2.1.1.min.js"></script>
<script src="static/js/html5zoo.js"></script>
<script src="static/js/lovelygallery.js"></script>
<script src="static/js/main.js"></script>

</body>

</html>