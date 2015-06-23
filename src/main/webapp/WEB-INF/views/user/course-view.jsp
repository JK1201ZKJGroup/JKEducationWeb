<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/css/course-detail.css" type="text/css">
</head>
<body>
<div id="main">

<div class="newcontainer" id="course_intro">
  <div class="course-title">
    <a href="view-source.html" class="back-btn">&lt;</a>
    <h1> canvas实现星星闪烁特效</h1>
  </div>
  <div class="course_info">
      <div class="course-embed l">
        <div id="js-course-img" class="img-wrap">
          <img width="600" height="340" alt="" src="static/images/550a33b00001738a06000338-590-330.jpg" class="course_video">
                  </div>
        <div id="js-video-wrap" class="video" style="display:none">
            <div class="video_box" id="js-video"></div>
        </div>
      </div>
      <div class="course_state">
        <ul>
          <li>
            <span>学习人数</span>
            <em>2767</em>
          </li>
          <li class="course_hour">
            <span>课程时长</span>
            <em class="ft-adjust"><span> 1</span>小时<span> 0</span>分</em>
          </li>
          <li>
            <span>课程难度</span>
            <em>中级</em>
          </li>
        </ul>
      </div>

      <div class="course_intro">
          <div class="concerned_course add_concerned_course">
              <a href="javascript:void(0)" data-id="338" class="btn-add-follow js-btn-follow">
                  <i></i>
                  <em class="concerned-icon">关注此课程</em>
              </a>
          </div>
          <div class="curse_btn">
              <a href="learn-course.html">开始学习</a>
          </div>
      </div>
  </div>   
  <div class="course_list">
      <div class="outline">
          <h3 class="chapter_introduces">课程介绍</h3>

          <div class="course_shortdecription">
              通过制作一个用鼠标事件控制的小案例，学会使用基于canvas画布的各种绘图方法，通过灵活使用一些绘图方法的各项参数达到一些特殊效果。在课程中还将讲述如何将一个复杂的问题进行拆解，逐步实现目标的方法。
          </div>

          <h3 class="chapter_catalog">课程提纲</h3>
          <ul id="couList">
              <li class="clearfix open">
                  <a href="learn-course.html">
                      <div class="openicon"></div>
                      <div class="outline_list l">
                          <!-- <em class="outline_zt"></em> -->
                          <h5 class="outline_name">第1章 前期准备</h5>

                          <p class="outline_descr">这一章带领大家学习课程简介及结构搭建。</p>
                      </div>
                  </a>
              </li>
              <li class="clearfix open">
                  <a href="learn-course.html">
                      <div class="openicon"></div>
                      <div class="outline_list l">
                          <!-- <em class="outline_zt"></em> -->
                          <h5 class="outline_name">第2章 代码编写</h5>

                          <p class="outline_descr">这一章节带领大家学习使用 fillRect 方法填充背景，使用 drawImage 方法绘制女孩图片及播放图片上的序列帧。</p>
                      </div>
                  </a>
              </li>
              <li class="clearfix open">
                  <a href="learn-course.html">
                      <div class="openicon"></div>
                      <div class="outline_list l">
                          <!-- <em class="outline_zt"></em> -->
                          <h5 class="outline_name">第3章 课程总结</h5>

                          <p class="outline_descr">这一章节是对课程知识点的回顾及扩展。</p>
                      </div>
                  </a>
              </li>
          </ul>
      </div>
      <div class="course_right">
          <dl>
              <dt>授课老师</dt>
              <dd>
                  <div class="course_teacher">
                      <a href="#" class="teacer_pic"><img
                              src="#" width="80"
                              height="80"></a>

                      <h3>
                          <a href="#">daisy_01</a>
                          <span class="teacher_icon"></span>
                      </h3>

                      <p></p>
                      <br class="clear">

                      <div class="discrip autowrap">独立游戏开发者，精通美术、用户体验、游戏编程，熟练使用adobe各种软件、html5
                          canvas和unity3D。曾参与开发大型次世代客户端游戏，后成为独立游戏开发者，曾独立制作了一款手机游戏，兼具美术和编程能力，正在开发一款关卡制休闲益智游戏。
                      </div>
                  </div>
              </dd>
          </dl>
          <dl>
              <dt>课程须知</dt>
              <dd>
                  <pre class="wrd_break">
                      1、具有HTML、CSS基础知识
                      2、具有JavaScript基础知识（函数、类、对象）
                      3、具有一些Canvas基础（画线、弧线、圆）
                  </pre>
              </dd>
          </dl>
          <dl>
              <dt>老师告诉你能学到什么？</dt>
              <dd>
                  <pre class="wrd_break">
                      1、如何轮播一张图片上的序列帧
                      2、canvas的几个主要绘图API：drawImage()、save()、restore()。
                      3、如何处理鼠标事件
                      4、如何化繁为简的做项目
                  </pre>
              </dd>
          </dl>
      </div>
   </div>
</div>

</div>
 <script src="static/js/jquery.min.js"></script>
</body>
</html>