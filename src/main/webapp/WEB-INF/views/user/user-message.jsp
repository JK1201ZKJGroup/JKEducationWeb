<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/css/login-regist.css" type="text/css">
<link rel="stylesheet" href="static/css/settings.css" type="text/css">
</head>
<body>
<div id="main">

<div class="wcontainer clearfix">
  <div class="setting-left l">
    <ul class="wrap-boxes">
      <li class="nav-active">
        <a href="#" class="onactive">个人资料</a>
      </li>
      <li>
         <a href="#">头像设置</a>
       </li>
      <li>
        <a href="#">修改密码</a>
      </li>
      <li>
        <a href="#">绑定帐号</a>
      </li>
    </ul>
  </div>
  <div class="setting-right ">
  <div class="setting-right-wrap wrap-boxes settings">


  <div id="setting-profile" style="display: block;" class="setting-wrap setting-profile">
      <form id="profile">
          <div class="wlfg-wrap">
              <label class="label-name" for="nick">昵称</label>

              <div class="rlf-group">
                  <input type="text" name="nickname" id="nick" autocomplete="off" data-validate="nick" class="rlf-input rlf-input-nick" value="白粥加上榨菜" placeholder="请输入昵称.">
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
          <div class="wlfg-wrap">
              <label class="label-name" for="job">职位</label>

              <div class="rlf-group">
                  <select class="rlf-select" name="job" hidefocus="true" id="job">
                      <option value="">请选择职位</option>
                      <option value="1">页面重构设计</option>
                      <option value="2">交互设计师</option>
                      <option value="3">产品经理</option>
                      <option value="4">UI设计师</option>
                      <option value="5">JS工程师</option>
                      <option value="6">Web前端工程师</option>
                      <option value="7">移动开发工程师</option>
                      <option value="8">PHP开发工程师</option>
                      <option value="9">软件测试工程师</option>
                      <option value="12">其它</option>
                      <option value="10">Linux系统工程师</option>
                      <option value="11">JAVA开发工程师</option>
                      <option value="13" selected="selected">学生</option>
                  </select>

                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
          <div class="wlfg-wrap">
              <label class="label-name" for="province-select">城市</label>

              <div class="rlf-group profile-address">
                  <select id="province-select" hidefocus="true">
                      <option value="0">选择省份</option>
                      <option value="1">北京</option>
                      <option value="2">天津</option>
                      <option value="3">河北</option>
                      <option value="4">山西</option>
                      <option value="5">内蒙古</option>
                      <option value="6">辽宁</option>
                      <option value="7">吉林</option>
                      <option value="8">黑龙江</option>
                      <option value="9">上海</option>
                      <option value="10">江苏</option>
                      <option value="11" selected="selected">浙江</option>
                      <option value="12">安徽</option>
                      <option value="13">福建</option>
                      <option value="14">江西</option>
                      <option value="15">山东</option>
                      <option value="16">河南</option>
                      <option value="17">湖北</option>
                      <option value="18">湖南</option>
                      <option value="19">广东</option>
                      <option value="20">海南</option>
                      <option value="21">广西</option>
                      <option value="22">甘肃</option>
                      <option value="23">陕西</option>
                      <option value="24">新疆</option>
                      <option value="25">青海</option>
                      <option value="26">宁夏</option>
                      <option value="27">重庆</option>
                      <option value="28">四川</option>
                      <option value="29">贵州</option>
                      <option value="30">云南</option>
                      <option value="31">西藏</option>
                      <option value="32">台湾</option>
                      <option value="33">澳门</option>
                      <option value="34">香港</option>
                      <option value="100">其他</option>
                  </select>
                  <select id="city-select" hidefocus="true">
                      <option value="0">选择城市</option>
                      <option value="76">舟山市</option>
                      <option value="77">衢州市</option>
                      <option value="78" selected="selected">杭州市</option>
                      <option value="79">湖州市</option>
                      <option value="80">嘉兴市</option>
                      <option value="81">宁波市</option>
                      <option value="82">绍兴市</option>
                      <option value="83">温州市</option>
                      <option value="84">丽水市</option>
                      <option value="85">金华市</option>
                      <option value="86">台州市</option>
                  </select>
                  <select id="area-select" hidefocus="true">
                      <option value="0">选择区县</option>
                      <option value="784">上城区</option>
                      <option value="785">下城区</option>
                      <option value="786" selected="selected">江干区</option>
                      <option value="787">拱墅区</option>
                      <option value="788">西湖区</option>
                      <option value="789">滨江区</option>
                      <option value="790">余杭区</option>
                      <option value="791">桐庐县</option>
                      <option value="792">淳安县</option>
                      <option value="793">建德市</option>
                      <option value="794">富阳市</option>
                      <option value="795">临安市</option>
                      <option value="796">萧山区</option>
                  </select>

                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
          <div class="wlfg-wrap">
              <label class="label-name">性别</label>

              <div class="rlf-group rlf-radio-group">
                  <label><input type="radio" hidefocus="true" value="0" name="sex">保密</label>
                  <label><input type="radio" hidefocus="true" value="1" name="sex">男</label>
                  <label><input type="radio" hidefocus="true" value="2" checked="checked" name="sex">女</label>
              </div>
              <p class="rlf-tip-wrap"></p>
          </div>
          <div class="wlfg-wrap">
              <label class="label-name" for="aboutme">个性签名</label>

              <div class="rlf-group">
                  <textarea name="aboutme" id="aboutme" cols="30" rows="5" class="textarea">这位童鞋很懒，什么也没有留下～～！</textarea>

                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
          <div class="wlfg-wrap">
              <div class="rlf-group">
                  <span id="profile-submit" hidefocus="true" aria-role="button"
                        class="rlf-btn-green btn-block profile-btn">保存</span>
              </div>
          </div>
      </form>
  </div sy>

  <div id="setting-avator" class="setting-wrap setting-avator clearfix">
      <div class="avator-img l">
          <div><img src="static/images/551760a20001035c01800180-220-220.jpg" width="220" height="220"></div>
      </div>
      <div class="avator-btn-group">
          <div id="avator-btns" class="avator-btn-inner">
              <div class="avator-btn-snswrap">
                  <span class="l-sns-btn l-sns-weibo" data-sns="weibo">从新浪微博同步头像</span>
              </div>

              <div class="avator-btn-wrap">
                  <form target="uploadtarget" action="" method="post" enctype="multipart/form-data">
                      <a href="javascript:void(0)" hidefocus="true" class="avator-btn-fake">上传头像</a>
                      <input type="file" title="上传头像" name="fileField" id="upload" accept="image/*">
                      <input type="hidden" name="type" value="1">
                  </form>
                  <iframe src="about:blank" id="uploadtarget" name="uploadtarget" frameborder="0" style="display:none;"></iframe>
              </div>
          </div>
          <div class="avator-upload-wrap" style="display:none;">
              <span hidefocus="true" id="avator-btn-save" aria-role="button" class="rlf-btn-green btn-block">保存</span>
          </div>
      </div>

  </div>

  <div class="setting-wrap pwd-reset-wrap setting-resetpwd">
      <form method="post" id="resetpwdform">

          <div class="wlfg-wrap">
              <label class="label-name" for="">当前密码</label>

              <div class="rlf-group">
                  <input type="password" name="oldpwd" class="rlf-input rlf-input-pwd" placeholder="请输入当前密码">

                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
          <div class="wlfg-wrap">
              <label class="label-name" for="newpass">新密码</label>

              <div class="rlf-group">
                  <input type="password" data-validate="password" name="newpass" id="newpass"
                         class="rlf-input rlf-input-pwd" placeholder="请输入密码">

                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
          <div class="wlfg-wrap">
              <label class="label-name" for="confirm">确认密码</label>

              <div class="rlf-group">
                  <input type="password" name="confirm" id="confirm" class="rlf-input rlf-input-pwd" placeholder="请输入密码">
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
          <div class="wlfg-wrap">
              <label class="label-name" for=""></label>

              <div class="rlf-group">
                  <span id="resetpwd-btn-save" hidefocus="true" aria-role="button" class="rlf-btn-green btn-block">保存</span>
              </div>
          </div>
      </form>
  </div>

  <div class="setting-wrap setting-bindsns">

      <div class="setting-bindsns-inner clearfix">
          <p>绑定第三方帐号，可以直接登录，还可以将内容同步到以下平台，与更多好友分享。</p>

          <div class="setting-bindsns-weixin l">
              <i class="icon-weixin"></i>

              <p>未绑定帐号</p>
              <a href="#" aria-role="button" hidefocus="true" class="rlf-btn-green sbtn-green js-bind ">立即绑定</a>
          </div>
          <div class="setting-bindsns-weibo binded-weibo l">
              <i class="icon-weibo"></i>

              <p>已绑定新浪微博帐号</p>
              <a data-unbind="weibo" class="sbtn-gy" href="javascript:void(0)">解除绑定</a>
          </div>

          <div class="setting-bindsns-qq l">
              <i class="icon-qq"></i>

              <p>未绑定帐号</p>
              <a href="#" aria-role="button" hidefocus="true" class="rlf-btn-green sbtn-green js-bind">立即绑定</a>
          </div>
      </div>
  </div>
  </div>


    </div>
  </div>
</div>
</body>
</html>