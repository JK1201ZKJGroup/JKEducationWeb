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
<title>
<decorator:title default="计科1201" /></title>
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
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
<body id="List_courseId">

<div id="header">
    <div class="page-container" id="nav">
        <div id="logo" class="logo"><a href="index.jsp" target="_self" class="hide-text"></a></div>
        <ul class="nav-item">
            <li><a href="index.jsp" target="_self">发现课程</a></li>
            <li><a href="view-source.jsp" target="_self">全部课程</a></li>
            <li class="nav-item-mycourse"><a href="my-course.jsp" target="_self">我的课程</a></li>
        </ul>
        <div id="login-area">
            <ul class="clearfix logined">
        	    <li class="my_message">
                    <a href="#" title="我的消息" target="_self">
                        <i class="msg_icon" style="display: none;"></i>
                        <span style="display: none;">我的消息</span>
                    </a>
                </li>
                <li class="my_mp" title="我的经验">
                    <a href="#" target="_self">
                        <span class="mp">经验</span>
                        <span class="mp_num">3736</span>
                    </a>
                </li>
                <li class="set_btn">
                    <a id="header-avator" action-type="my_menu" href="#" target="_self">
                        <img src="static/images/53c0d6ad0001035c01800180-40-40.jpg" width="40" height="40">
                        <i class="myspace_remind" style="display: none;"></i>
                        <span style="display: none;">动态提醒</span>
                    </a>
                    <ul id="nav_list">
                    	<li><a id="my_space" href="my-course.jsp" title="白粥加上榨菜" class="text-ellipsis" target="_self">白粥加上榨菜</a></li>
                        <li><a id="my_setting" href="user-message.jsp" target="_self">我的设置</a></li>
                        <li><a id="my_logout" href="unlogin.jsp" target="_self">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="search-area">
            <form action="#" name="search-form" method="get">
                <input class="js-input-keyword search-input" placeholder="搜索课程、问答" type="text" autocomplete="off" name="words" value="">
                <input type="button" class="btn_search js-btn-search">
                <dl class="search-area-result"></dl>
            </form>
        </div>
	</div>
</div>
  <decorator:body />
  
<div id="footer">
    <div class="waper">
        <div class="footerwaper clearfix">
            <div class="footer_intro">
                <div class="footer_logo"></div>
                <p>我们的使命:传播互联网最前沿技术，帮助更多的人实现梦想！</p>
                <p>Copyright © 2015 imooc.com All Rights Reserved | 京ICP备 13046642号-2</p>
            </div>
            <div class="footer_link">
                <ul>
                    <li><a href="#" target="_blank">网站首页</a></li>
                    <li><a href="#" target="_blank">人才招聘</a></li>
                    <li> <a href="#" target="_blank">联系我们</a></li>
                    <li><a href="#" target="_blank">专题页面</a></li>
                    <li><a href="#" target="_blank">关于我们</a></li>
                    <li> <a href="#" target="_blank">讲师招募</a></li>
                    <li> <a href="#" target="_blank">意见反馈</a></li>
                    <li> <a href="#" target="_blank">友情链接</a></li>
                </ul>
            </div>
            <div class="followus">
                <a class="followus-weixin" href="javascript:;" target="_blank" title="微信">
                    <div class="flw-weixin-box"></div>
                </a>
                <a class="followus-weibo" href="#" target="_blank" title="新浪微博"></a>
                <a class="followus-qzone" href="#" target="_blank" title="QQ空间"></a>
            </div>
        </div>
    </div>
</div>



<script src="static/js/jquery-2.1.1.min.js"></script>
<script src="static/js/html5zoo.js"></script>
<script src="static/js/lovelygallery.js"></script>
<script src="static/js/main.js"></script>
</body>

</html>