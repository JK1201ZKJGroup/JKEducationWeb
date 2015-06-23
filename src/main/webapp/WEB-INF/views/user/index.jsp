<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="static/js/koala.min.1.5.js"></script>
    <script type="text/javascript">
        Qfast.add('widgets', { path: "static/js/terminator2.2.min.js", type: "js", requires: ['fx'] });
        Qfast(false, 'widgets', function () {
            K.tabs({
                id: 'decoroll2',//焦点图包裹id
                conId: "decoimg_a2",//大图域包裹id
                tabId:"deconum2",//小圆点数字提示id
                tabTn:"a",
                conCn: '.decoimg_b2',//大图域配置class
                auto: 1,//自动播放 1或0
                effect: 'fade',//效果配置
                eType: 'mouseover',// 鼠标事件
                pageBt:true,//是否有按钮切换页码
                bns: ['.prev', '.next'],//前后按钮配置class
                interval: 3000// 停顿时间
            })
        })
    </script>
</head>
<body>
<div id="decoroll2" class="imgfocus">

    <div id="decoimg_a2" class="imgbox">
        <div class="decoimg_b2"><a href="#"><img src="static/images/002.jpg"></a></div>
        <div class="decoimg_b2"><a href="#"><img src="static/images/003.jpg"></a></div>
        <div class="decoimg_b2"><a href="#"><img src="static/images/004.jpg"></a></div>
        <div class="decoimg_b2"><a href="#"><img src="static/images/005.jpg"></a></div>
    </div>

    <ul id="deconum2" class="num_a2">
        <li><a href="javascript:void(0)" hidefocus="true" target="_self"></a></li>
        <li><a href="javascript:void(0)" hidefocus="true" target="_self"></a></li>
        <li><a href="javascript:void(0)" hidefocus="true" target="_self"></a></li>
        <li><a href="javascript:void(0)" hidefocus="true" target="_self"></a></li>
    </ul>

</div>


<div id="main">
<div class="container discover-container">
<div class="discover-layer">
    <div class="discover-title">
        <h3>本周精选课程</h3>
    </div>
    <div class="course-list discover-list">
        <ul>
        <c:forEach items="${courses}" var="course">
            <li>
                <a href="user/video/${course.id }">
                    <div class="course-list-img">
                        <img src="${course.avatar}" alt="">
                    </div>
                    <h5><span>${course.introduction }</span></h5>

                    <div class="intro">
                        <p>${course.name }</p>
                        <span class="r">课程时长：${course.duration }分</span>
                    </div>
                    <div class="tips">
                     	<span class="l new">上传人：${course.author }</span>
                        <span class="r">${course.view }次浏览</span>
                    </div>
                </a>
            </li>
        </c:forEach>
        </ul>
    </div>
</div>
<div class="discover-layer">
<div class="discover-title">
    <h3>最新上线课程</h3>
    <a href="#">查看更多</a>
</div>
<div class="course-list discover-list">
        <ul>
            <li>
                <a href="course-view.html">
                    <div class="course-list-img">
                        <img src="static/images/550bebb50001f5df06000338-280-160.jpg" alt="">
                    </div>
                    <h5><span>Android图像处理-变换莫测的图像</span></h5>

                    <div class="intro">
                        <p>了解Android中对图像变形的分析与处理</p>
                        <span class="l new">更新至5-1</span>
                        <span class="r">课程时长： 2小时 0分</span>
                    </div>
                    <div class="tips">
                        <span class="l new">20小时前更新</span>
                        <span class="r">566人学习</span>
                    </div>
                </a>
            </li>
            <li>
                <a href="course-view.html">
                    <div class="course-list-img">
                        <img src="static/images/55063fc600019d0006000338-280-160.jpg" alt="">
                    </div>
                    <h5><span>Oracle数据库开发必备利器之SQL基础</span></h5>

                    <div class="intro">
                        <p>为你带来Oracle数据库开发必备的sql基础。</p>
                        <span class="l ">更新至4-4</span>
                        <span class="r">课程时长： 4小时 0分</span>
                    </div>
                    <div class="tips">
                        <span class="l ">3天前更新</span>
                        <span class="r">2000人学习</span>
                    </div>
                </a>
            </li>
            <li>
                <a href="course-view.html">
                    <div class="course-list-img">
                        <img src="static/images/55063ec30001774b06000338-280-160.jpg" alt="">
                    </div>
                    <h5><span>shell编程基础之变量</span></h5>

                    <div class="intro">
                        <p>Tony老师为您带来shell编程基础中的变量！</p>
                        <span class="l ">更新至2-6</span>
                        <span class="r">课程时长： 1小时49分</span>
                    </div>
                    <div class="tips">
                        <span class="l ">6天前更新</span>
                        <span class="r">3240人学习</span>
                    </div>
                </a>
            </li>
            <li class="last">
                <a href="course-view.html">
                    <div class="course-list-img">
                        <img src="static/images/5502bbdd0001a8a606000338-280-160.jpg" alt="">
                        <span class="icourse-learnt">你已参加本课程</span>
                    </div>
                    <h5><span>快乐的sublime编辑器</span></h5>

                    <div class="intro">
                        <p>展示sublimeText,讲透它的使用哲学。</p>
                        <span class="l ">更新至6-1</span>
                        <span class="r">课程时长： 1小时 1分</span>
                    </div>
                    <div class="tips">
                        <span class="l ">3天前更新</span>
                        <span class="r">8747人学习</span>
                    </div>
                </a>
            </li>
            <li>
                <a href="course-view.html">
                    <div class="course-list-img">
                        <img src="static/images/54bf7e1f000109c506000338-280-160.jpg" alt="">
                    </div>
                    <h5><span>Android图像处理-打造美图秀秀从它开始</span></h5>

                    <div class="intro">
                        <p>了解Android中对图像色彩的分析与处理</p>
                        <span class="l ">更新至3-3</span>
                        <span class="r">课程时长： 2小时 0分</span>
                    </div>
                    <div class="tips">
                        <span class="l ">2015-03-13更新</span>
                        <span class="r">4050人学习</span>
                    </div>
                </a>
            </li>
            <li>
                <a href="course-view.html">
                    <div class="course-list-img">
                        <img src="static/images/54c1a5880001aa9106000338-280-160.jpg" alt="">
                    </div>
                    <h5><span>CSS深入理解之overflow</span></h5>

                    <div class="intro">
                        <p>深入理解overflow相关特性及各类实际应用。</p>
                        <span class="l ">更新至4-1</span>
                        <span class="r">课程时长： 1小时 0分</span>
                    </div>
                    <div class="tips">
                        <span class="l ">3天前更新</span>
                        <span class="r">3674人学习</span>
                    </div>
                </a>
            </li>
            <li>
                <a href="course-view.html">
                    <div class="course-list-img">
                        <img src="static/images/54f962eb0001640806000338-280-160.jpg" alt="">
                        <span class="icourse-learnt">你已参加本课程</span>
                    </div>
                    <h5><span>CSS3实现漂亮ToolTips效果</span></h5>

                    <div class="intro">
                        <p>CSS3实现鼠标悬停弹出信息提示框。</p>
                        <span class="l ">共1章6节</span>
                        <span class="r">课程时长： 1小时20分</span>
                    </div>
                    <div class="tips">
                        <span class="l">更新完毕</span>
                        <span class="r">7746人学习</span>
                    </div>
                </a>
            </li>
            <li class="last">
                <a href="course-view.html">
                    <div class="course-list-img">
                        <img src="static/images/54c886740001b85d06000338-280-160.jpg" alt="">
                    </div>
                    <h5><span>python进阶</span></h5>

                    <div class="intro">
                        <p>深入学习Python函数式编程、模块和面向对象编程</p>
                        <span class="l ">更新至6-9</span>
                        <span class="r">课程时长： 3小时40分</span>
                    </div>
                    <div class="tips">
                        <span class="l ">6天前更新</span>
                        <span class="r">10192人学习</span>
                    </div>
                </a>
            </li>
        </ul>
</div>
</div>
<div class="discover-layer">
    <div class="discover-title">
        <h3>全网独家课程</h3>
    </div>
    <div class="course-list discover-list">
        <ul>
            <li>
                <a href="course-view.html">
                    <div class="course-list-img">
                        <img src="static/images/5487a78e000105b606000338-280-160.jpg" alt="">
                    </div>
                    <h5><span>Linux网络管理</span></h5>
                    <div class="intro">
                        <p>教你如何搭建Linux网络环境，使用XShell等远程登录工具连接Linux。</p>
                        <span class="l ">共4章17节 </span>
                        <span class="r">课程时长： 3小时40分 </span>
                    </div>
                    <div class="tips">
                        <span class="l">更新完毕</span>
                        <span class="r">15909人学习</span>
                    </div>
                </a>
            </li>
            <li>
                <a href="course-view.html">
                    <div class="course-list-img">
                        <img src="static/images/54657e1c0001490406000338-280-160.jpg" alt="">
                    </div>
                    <h5><span>DOM事件探秘</span></h5>
                    <div class="intro">
                        <p>DOM事件？他们究竟有多少不为人知的奥秘？让我们来一起探索吧！</p>
                        <span class="l ">共5章15节</span>
                        <span class="r">课程时长： 2小时57分</span>
                    </div>
                    <div class="tips">
                        <span class="l">更新完毕</span>
                        <span class="r">13789人学习</span>
                    </div>
                </a>
            </li>
            <li>
                <a href="course-view.html">
                    <div class="course-list-img">
                        <img src="static/images/547ec0ee0001cb0206000338-280-160.jpg" alt="">
                    </div>
                    <h5><span>通过自动回复机器人学Mybatis---基础版</span></h5>
                    <div class="intro">
                        <p>模拟开发微信公众号自动回复功能学习 Mybatis</p>
                        <span class="l ">共6章23节</span>
                        <span class="r">课程时长： 4小时30分</span>
                    </div>
                    <div class="tips">
                        <span class="l">更新完毕</span>
                        <span class="r">12237人学习</span>
                    </div>
                </a>
            </li>
            <li class="last">
                <a href="course-view.html">
                    <div class="course-list-img">
                        <img src="static/images/539a52a600016a0106000338-280-160.jpg" alt="">
                    </div>
                    <h5><span>Android系统Root原理初探</span></h5>
                    <div class="intro">
                        <p>大神开始接地气啦，Android大神手把手教你Root的基本技术和刷机技巧</p>
                        <span class="l ">共11章11节</span>
                        <span class="r">课程时长： 1小时20分</span>
                    </div>
                    <div class="tips">
                        <span class="l">更新完毕</span>
                        <span class="r">12319人学习</span>
                    </div>
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="discover-layer" style="display:none;">
    <div class="discover-title">
        <h3>最新学习计划</h3>
        <a href="view-source.html">查看更多</a>
    </div>
    <div class="discover-program-list">
        <ul>
            <li>
                <a href="course-view.html">
                    <div class="program-list-img">
                        <h3 style="background-image:url(&#39;http://img.mukewang.com/.jpg&#39;)">Java攻城狮养成计划（入门篇）</h3>
                    </div>
                    <p class="program-list-intro"></p>
                </a>
            </li>
            <li class="last">
                <a href="course-view.html">
                    <div class="program-list-img">
                        <h3 style="background-image:url(&#39;http://img.mukewang.com/.jpg&#39;)">搞定Java加解密</h3>
                    </div>
                    <p class="program-list-intro"></p>
                </a>
            </li>
        </ul>
    </div>
</div>
</div>

</div>
 <script src="static/js/jquery.min.js"></script>
</body>
</html>