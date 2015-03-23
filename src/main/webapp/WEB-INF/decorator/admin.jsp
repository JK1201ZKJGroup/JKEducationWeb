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
<link rel="stylesheet" href="static/css/amazeui.css"/>
<link rel="stylesheet" href="static/css/amui.all.min.css"/>

<link rel="stylesheet" href="static/css/admin.css">
<link rel="stylesheet" href="static/css/theme-blue.css">
<decorator:head />
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
<header class="am-topbar am-topbar-inverse">
  <div class="am-topbar-brand">
    <strong>计科1201在线教育平台</strong> <small>后台管理</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning"></span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
          <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
          <li><a href="login.jsp"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
      <!-- <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li> -->
    </ul>
  </div>
</header>


  <!-- sidebar start -->
  <div class="am-g">
  <div class="col-md-3">
      <ul class="am-nav">
        <li><a href="admin/index"><span class="am-icon-home"></span> 首页</a></li>
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 页面模块 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav">
            <li><a href="admin/user/users" class="am-cf"><span class="am-icon-th"></span>用户管理</a></li>
            <li><a href="admin/course/courses"><span class="am-icon-th"></span> 课程管理</a></li>
            <li><a href="admin/classification/classifications"><span class="am-icon-th"></span> 分类管理</a></li>
          </ul>
        </li>
        <li><a href="admin-table.html"><span class="am-icon-table"></span> 表格</a></li>
        <li><a href="admin-form.html"><span class="am-icon-pencil-square-o"></span> 表单</a></li>
        <li><a href="login.jsp"><span class="am-icon-sign-out"></span> 注销</a></li>
      </ul>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-bookmark"></span> 公告</p>
          <p>时光静好，与君语；细水流年，与君同。—— Amaze UI</p>
        </div>
      </div>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-tag"></span> wiki</p>
          <p>Welcome to the Amaze UI wiki!</p>
        </div>
      </div>
    </div>
  <div class="col-md-9">
  <div class="am-panel am-panel-primary">
  <decorator:body />
  
  </div>
</div>
</div>
<footer>
  <hr>
  <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>
<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="static/js/jquery.min.js"></script>
<script src="static/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="static/js/app.js"></script>

</body>

</html>
