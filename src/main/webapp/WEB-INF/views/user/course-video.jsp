<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视屏播放</title>
<link rel="stylesheet" href="../../static/css/index.css" type="text/css">
<link rel="stylesheet" href="../../static/css/video.css" type="text/css">
</head>
<body>
<div id="header" class="course-detail-header">
  <div class="cd-inner clearfix">
      <ul class="l">
        <li class="nv nv-goback"><a href="javascript:history.go(-1)" class="revert l"><i class="icon icon-left"></i>返回</a></li>
        <li class="nv nv-menu">
          <a href="javascript:;" class="chaptername">课程名称 <i class="icon icon-menu"></i></a>
        </li>
      </ul>
      <div id="login-area">
          <ul class="clearfix logined">
              <li class="set_btn">
                  <a id="header-avator" action-type="my_menu" href="../../user/userdetail/show" target="_self">
                      <img src="../../static/images/53c0d6ad0001035c01800180-40-40.jpg" width="40" height="40">
                      <i class="myspace_remind" style="display: none;"></i>
                      <span style="display: none;">动态提醒</span>
                  </a>
                  <ul id="nav_list">
                      <li><a id="my_space" href="../../user/userdetail/show" title="白粥加上榨菜" class="text-ellipsis" target="_self">白粥加上榨菜</a></li>
                      <li><a id="my_setting" href="../../user/userdetail/show" target="_self">我的设置</a></li>
                      <li><a id="my_logout" href="../../web-core/j_spring_security_logout" target="_self">退出</a></li>
                  </ul>
              </li>
          </ul>
      </div>
        </div>
</div>
<div id="study-section"></div>

<div id="studyMain">

 
<div id="bgarea" class="partTop">
    <div id="J_Box" class="course-video-box">
        <div id="video-box_wrapper" style="position: relative; display: block; width: 1200px; height: 530px;">
         	<video width="1200" height="530" controls="controls">
                 <source src="${course.filepath }" type="video/mp4" />
                <source src="video.ogg" type="video/ogg" />
                <source src="video.webm" type="video/webm" />
                <object data="${course.filepath}" width="1200" height="530">
                    <embed src="${course.filepath }" width="1200" height="530" />
                </object>
            </video>
        </div>
    </div>
</div>

<div class="course-subcontainer clearfix">
  <div class="course-left">
    <div class="course-left-inner wrap-boxes">
      <div id="disArea" class="lists-container">
    <ul class="course-menu course-video-menu clearfix">
        <li class="course-menu-item"><a class="active" href="javascript:void(0)" id="plMenu">评论</a></li>             
        <li class="course-menu-item"><a href="javascript:void(0)" id="qaMenu">问答</a></li>
        <li class="course-menu-item"><a href="javascript:void(0)" id="noteMenu">笔记</a></li>
        <li class="course-menu-item"><a href="javascript:void(0)" id="wikiMenu">WIKI</a></li>
    </ul>
    <div id="pl-content" class="list-tab-con">
        <div class="publish clearfix" id="discus-publish">
            <div class="publish-wrap publish-wrap-pl">
               <div class="pl-input-wrap">
                   <div id="js-pl-input-fake" class="pl-input-inner">
                       <textarea id="js-pl-textarea" class="js-placeholder" placeholder="扯淡、吐槽、表扬、鼓励……想说啥就说啥！"></textarea>
                       <span class="num-limit"><span id="js-pl-limit">0</span>/300</span>
                   </div>
                   <div class="pl-input-btm input-btm clearfix">
                        <input type="button" id="js-pl-submit" class="r course-btn" value="发表评论">
                   </div>
               </div>
                
            </div>
        </div>                    
</div>
</div>

</div>
    </div>
    </div>
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
<script src="../../static/js/jquery-2.1.1.min.js"></script>
<script src="../../static/js/main.js"></script>
</body>
</html>