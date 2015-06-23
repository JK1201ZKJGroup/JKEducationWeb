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
<c:forEach items="${courses}" var="mapCateCourse">
<div class="discover-layer">
    <div class="discover-title">
        <h3>${mapCateCourse.key}</h3>
    </div>
    <div class="course-list discover-list">
        <ul>
        	<c:forEach items="${mapCateCourse.value}" var="courseCate">
        	<c:if test="${empty courseCate}">
        		<h2>暂无相关视频</h2>
        	</c:if>
        	<c:if test="${!empty courseCate}">
            <li>
                <a href="user/video/${courseCate.course.id}">
                    <div class="course-list-img">
                        <img src="${courseCate.course.avatar}" alt="">
                    </div>
                    <h5><span>${courseCate.course.introduction }</span></h5>

                    <div class="intro">
                        <p>${courseCate.course.name }</p>
                        <span class="r">课程时长：${courseCate.course.duration }分</span>
                    </div>
                    <div class="tips">
                     	<span class="l new">上传人：${courseCate.course.author }</span>
                        <span class="r">${courseCate.course.view }次浏览</span>
                    </div>
                </a>
            </li>
            </c:if>
            </c:forEach>
        </ul>
    </div>
</div>
 </c:forEach>
</div>

</div>
 <script src="static/js/jquery.min.js"></script>
</body>
</html>