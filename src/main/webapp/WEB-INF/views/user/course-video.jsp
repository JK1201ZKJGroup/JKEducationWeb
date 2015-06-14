<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视屏播放</title>
<link rel="stylesheet" href="static/css/index.css" type="text/css">
<link rel="stylesheet" href="static/css/video.css" type="text/css">
</head>
<body>
<div id="header" class="course-detail-header">
  <div class="cd-inner clearfix">
      <ul class="l">
        <li class="nv nv-goback"><a href="#" class="revert l"><i class="icon icon-left"></i>返回</a></li>
        <li class="nv nv-menu">
          <a href="javascript:;" class="chaptername">课程名称 <i class="icon icon-menu"></i></a>
        </li>
      </ul>
      <div id="login-area">
          <ul class="clearfix logined">
              <li class="my_mp" title="我的经验">
                  <a href="#" target="_self">
                      <span class="mp">经验</span>
                      <span class="mp_num">3736</span>
                  </a>
              </li>
              <li class="set_btn">
                  <a id="header-avator" action-type="my_menu" href="#" target="_self">
                      <img src="images/53c0d6ad0001035c01800180-40-40.jpg" width="40" height="40">
                      <i class="myspace_remind" style="display: none;"></i>
                      <span style="display: none;">动态提醒</span>
                  </a>
                  <ul id="nav_list">
                      <li><a id="my_space" href="my-course.html" title="白粥加上榨菜" class="text-ellipsis" target="_self">白粥加上榨菜</a></li>
                      <li><a id="my_setting" href="user-message.html" target="_self">我的设置</a></li>
                      <li><a id="my_logout" href="unlogin.html" target="_self">退出</a></li>
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
            <a id="beforeswfanchor0" href="#" tabindex="-1" title="Flash start" style="border:0;clip:rect(0 0 0 0);display:block;height:1px;margin:-1px;outline:none;overflow:hidden;padding:0;position:absolute;width:1px;"></a>
            <object type="application/x-shockwave-flash" data="js/flvplayer.swf" width="100%" height="100%" bgcolor="#000000" id="video-box" name="video-box" class="jwswf swfPrev-beforeswfanchor0 swfNext-afterswfanchor0" tabindex="0">
                <param name="allowfullscreen" value="true">
                <param name="allowscriptaccess" value="always">
                <param name="seamlesstabbing" value="true"><param name="wmode" value="opaque">
            </object><a id="afterswfanchor0" href="#" tabindex="-1" title="Flash end" style="border:0;clip:rect(0 0 0 0);display:block;height:1px;margin:-1px;outline:none;overflow:hidden;padding:0;position:absolute;width:1px;"></a>
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
        <div id="plLoadListData">
            <div class="pl-container">
                <ul>
                    <li class="pl-list clearfix">
                        <div class="pl-list-avator">
                            <a href="#" target="_blank">
                                <img width="40" height="40" src="#" title="文欣">
                            </a>
                        </div>
                        <div class="pl-list-main">
                            <div class="pl-list-nick">
                                <a href="#" target="_blank">文欣</a>
                            </div>
                            <div class="pl-list-content">
                                感谢老师介绍，受益匪浅，我是从后台转前台的，虽然有些地方不是很理解，还是赞一个！</div>
                            <div class="pl-list-btm clearfix">
                                <span class="pl-list-time l">时间: 3天前</span>
                                <a title="赞" href="javascript:;" class="js-pl-praise list-praise r" data-id="32447">
                                    <i class="icon icon_good"></i>
                                    <span>0</span>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="pl-list clearfix">
                        <div class="pl-list-avator">
                            <a href="#" target="_blank">
                                <img width="40" height="40" src="#" title="文欣">
                            </a>
                        </div>
                        <div class="pl-list-main">
                            <div class="pl-list-nick">
                                <a href="#" target="_blank">文欣</a>
                            </div>
                            <div class="pl-list-content">
                                感谢老师介绍，受益匪浅，我是从后台转前台的，虽然有些地方不是很理解，还是赞一个！</div>
                            <div class="pl-list-btm clearfix">
                                <span class="pl-list-time l">时间: 3天前</span>
                                <a title="赞" href="javascript:;" class="js-pl-praise list-praise r" data-id="32447">
                                    <i class="icon icon_good"></i>
                                    <span>0</span>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="pl-list clearfix">
                        <div class="pl-list-avator">
                            <a href="#" target="_blank">
                                <img width="40" height="40" src="#" title="文欣">
                            </a>
                        </div>
                        <div class="pl-list-main">
                            <div class="pl-list-nick">
                                <a href="#" target="_blank">文欣</a>
                            </div>
                            <div class="pl-list-content">
                                感谢老师介绍，受益匪浅，我是从后台转前台的，虽然有些地方不是很理解，还是赞一个！</div>
                            <div class="pl-list-btm clearfix">
                                <span class="pl-list-time l">时间: 3天前</span>
                                <a title="赞" href="javascript:;" class="js-pl-praise list-praise r" data-id="32447">
                                    <i class="icon icon_good"></i>
                                    <span>0</span>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="pl-list clearfix">
                        <div class="pl-list-avator">
                            <a href="#" target="_blank">
                                <img width="40" height="40" src="#" title="文欣">
                            </a>
                        </div>
                        <div class="pl-list-main">
                            <div class="pl-list-nick">
                                <a href="#" target="_blank">文欣</a>
                            </div>
                            <div class="pl-list-content">
                                感谢老师介绍，受益匪浅，我是从后台转前台的，虽然有些地方不是很理解，还是赞一个！</div>
                            <div class="pl-list-btm clearfix">
                                <span class="pl-list-time l">时间: 3天前</span>
                                <a title="赞" href="javascript:;" class="js-pl-praise list-praise r" data-id="32447">
                                    <i class="icon icon_good"></i>
                                    <span>0</span>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="pl-list clearfix">
                        <div class="pl-list-avator">
                            <a href="#" target="_blank">
                                <img width="40" height="40" src="#" title="文欣">
                            </a>
                        </div>
                        <div class="pl-list-main">
                            <div class="pl-list-nick">
                                <a href="#" target="_blank">文欣</a>
                            </div>
                            <div class="pl-list-content">
                                感谢老师介绍，受益匪浅，我是从后台转前台的，虽然有些地方不是很理解，还是赞一个！</div>
                            <div class="pl-list-btm clearfix">
                                <span class="pl-list-time l">时间: 3天前</span>
                                <a title="赞" href="javascript:;" class="js-pl-praise list-praise r" data-id="32447">
                                    <i class="icon icon_good"></i>
                                    <span>0</span>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="pl-list clearfix">
                        <div class="pl-list-avator">
                            <a href="#" target="_blank">
                                <img width="40" height="40" src="#" title="文欣">
                            </a>
                        </div>
                        <div class="pl-list-main">
                            <div class="pl-list-nick">
                                <a href="#" target="_blank">文欣</a>
                            </div>
                            <div class="pl-list-content">
                                感谢老师介绍，受益匪浅，我是从后台转前台的，虽然有些地方不是很理解，还是赞一个！</div>
                            <div class="pl-list-btm clearfix">
                                <span class="pl-list-time l">时间: 3天前</span>
                                <a title="赞" href="javascript:;" class="js-pl-praise list-praise r" data-id="32447">
                                    <i class="icon icon_good"></i>
                                    <span>0</span>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="pl-list clearfix">
                        <div class="pl-list-avator">
                            <a href="#" target="_blank">
                                <img width="40" height="40" src="#" title="文欣">
                            </a>
                        </div>
                        <div class="pl-list-main">
                            <div class="pl-list-nick">
                                <a href="#" target="_blank">文欣</a>
                            </div>
                            <div class="pl-list-content">
                                感谢老师介绍，受益匪浅，我是从后台转前台的，虽然有些地方不是很理解，还是赞一个！</div>
                            <div class="pl-list-btm clearfix">
                                <span class="pl-list-time l">时间: 3天前</span>
                                <a title="赞" href="javascript:;" class="js-pl-praise list-praise r" data-id="32447">
                                    <i class="icon icon_good"></i>
                                    <span>0</span>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="pl-list clearfix">
                        <div class="pl-list-avator">
                            <a href="#" target="_blank">
                                <img width="40" height="40" src="#" title="文欣">
                            </a>
                        </div>
                        <div class="pl-list-main">
                            <div class="pl-list-nick">
                                <a href="#" target="_blank">文欣</a>
                            </div>
                            <div class="pl-list-content">
                                感谢老师介绍，受益匪浅，我是从后台转前台的，虽然有些地方不是很理解，还是赞一个！</div>
                            <div class="pl-list-btm clearfix">
                                <span class="pl-list-time l">时间: 3天前</span>
                                <a title="赞" href="javascript:;" class="js-pl-praise list-praise r" data-id="32447">
                                    <i class="icon icon_good"></i>
                                    <span>0</span>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="pl-list clearfix">
                        <div class="pl-list-avator">
                            <a href="#" target="_blank">
                                <img width="40" height="40" src="#" title="文欣">
                            </a>
                        </div>
                        <div class="pl-list-main">
                            <div class="pl-list-nick">
                                <a href="#" target="_blank">文欣</a>
                            </div>
                            <div class="pl-list-content">
                                感谢老师介绍，受益匪浅，我是从后台转前台的，虽然有些地方不是很理解，还是赞一个！</div>
                            <div class="pl-list-btm clearfix">
                                <span class="pl-list-time l">时间: 3天前</span>
                                <a title="赞" href="javascript:;" class="js-pl-praise list-praise r" data-id="32447">
                                    <i class="icon icon_good"></i>
                                    <span>0</span>
                                </a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="page pl-list-page">
                <span class="disabled_page">首页</span>
                <span class="disabled_page">上一页</span>
                <a href="javascript:void(0)" data-page="1" class="active">1</a>
                <a href="javascript:void(0)" data-page="2">2</a>
                <a href="javascript:void(0)" data-page="2">下一页</a>
                <a href="javascript:void(0)" data-page="2">尾页</a>
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
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/html5zoo.js"></script>
<script src="js/lovelygallery.js"></script>
<script src="js/main.js"></script>
</body>
</html>