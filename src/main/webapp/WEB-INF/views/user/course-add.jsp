<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/css/login-regist.css" type="text/css">
<link rel="stylesheet" href="static/css/settings.css" type="text/css">
<link rel="stylesheet" href="static/css/highlight.css">
<link rel="stylesheet" href="static/css/bootstrap.css">
<link rel="stylesheet" href="static/css/main.css">
</head>
<body>
<div id="main">
<div class="wcontainer clearfix">
  <div class="setting-left l">
    <ul class="wrap-boxes">
      <li class="nav-active">
        <a href="user/userdetail/show" class="onactive">个人资料</a>
      </li>
      <li>
         <a href="user/userdetail/add" class="onactive">课程上传</a>
       </li>
    </ul>
  </div>
  <div class="setting-right ">
  <div class="setting-right-wrap wrap-boxes settings">


  <div id="setting-profile" style="display: block;" class="setting-wrap setting-profile">
      <form id="profile" action="user/userdetail/add" method="post" enctype="multipart/form-data">
      	  <input type="hidden" id="coverPhoto" name="avatar" class="span2"/>
		  <input type="hidden" id="video" name="video" class="span2"/>
          <div class="wlfg-wrap">
              <label class="label-name" for="name">课程名称</label>
              <div class="rlf-group">
                  <textarea name="name" id="name" cols="30" rows="1" class="textarea" placeholder="请输入课程名称."></textarea>
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
           <div class="wlfg-wrap">
              <label class="label-name" for="author">作者</label>
              <div class="rlf-group">
                  <textarea name="author" id="author" cols="30" rows="1" class="textarea"></textarea>
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
          <div class="wlfg-wrap">
              <label class="label-name" for="freeflag">是否免费</label>
              <div class="rlf-group">
              	  <select name="freeflag">
						<option value="true" selected>免费</option>
						<option value="false" >收费</option>
				  </select>
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
           <div class="wlfg-wrap">
              <label class="label-name" for="price">观看价格</label>
              <div class="rlf-group">
                  <textarea name="price" id="price" cols="30" rows="1" class="textarea"></textarea> 
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
           <div class="wlfg-wrap">
              <label class="label-name" for="duration">课程时长</label>
              <div class="rlf-group">
                  <textarea name="duration" id="duration" cols="30" rows="1" class="textarea"></textarea>  
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
          <div class="wlfg-wrap">
              <label class="label-name" for="level">课程难度</label>
              <div class="rlf-group">
						<select name="level" class="am-form-field">
							<option value="简单">简单</option>
							<option value="一般">一般</option>
							<option value="困难">困难</option>
						</select>
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
          <div class="wlfg-wrap">
              <label class="label-name" for="introduction">课程简介</label>
              <div class="rlf-group">
                  <textarea name="introduction" id="introduction" cols="30" rows="5" class="textarea" placeholder="请输入课程简介."></textarea>
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>          
 		  <div class="wlfg-wrap">
              <label class="label-name" for="faCate">父分类</label>
              <div class="rlf-group">
					<select id="faCate" name="faCate">
						<c:forEach items="${cates}" var="cate">
						<option value="${cate.id }">${cate.name }</option>
				 		</c:forEach>
					</select>
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
 		  <div class="wlfg-wrap">
              <label class="label-name" for="sonCate">子分类</label>
              <div class="rlf-group">
						<select id="sonCate" name="sonCate">
						</select>
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
           <div class="wlfg-wrap">
              <label class="label-name" for="imginput">封面图片</label>
              <div class="rlf-group">
					<input type="file" class="am-input-sm" form="avatarForm" name="file" id="imginput" />
					<div id="ajaxresult" style="width: 100px;height:100px;border: 1px solid #CCC;margin-top: 5px;">
					</div>
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>
           <div class="wlfg-wrap">
              <label class="label-name" for="pickfiles">文件上传</label>

              <div class="rlf-group">
				<div id="container">
				<a class="btn btn-default btn-lg " id="pickfiles" href="#" >
				<i class="glyphicon glyphicon-plus"></i>
				 <sapn>选择文件</sapn>
				</a>
				</div>
				<div style="display:none" id="success" class="col-md-12">
					<div class="alert-success">
						                队列全部文件处理完毕
					</div>
				</div>
				<div class="col-md-12 ">
					<table class="table table-striped table-hover text-left"   style="margin-top:40px;display:none">
					<thead>
					<tr>
					<th class="col-md-4">Filename</th>
					<th class="col-md-2">Size</th>
					<th class="col-md-6">Detail</th>
					</tr>
					</thead>
					<tbody id="fsUploadProgress">
					</tbody>
					</table>
				</div>
                  <p class="rlf-tip-wrap"></p>
              </div>
          </div>  		 

          <div class="wlfg-wrap">
              <div class="rlf-group">
                  <button type="submit" class="rlf-btn-green btn-block profile-btn">保存</button>
              </div>
          </div>
      </form>
 	  <form id="avatarForm" class="form-horizontal well" enctype="multipart/form-data" style="display:none"></form>
  	  <input name="token" type="hidden" form="avatarForm" id="token" value="${uptoken}">
  </div> 
  </div>
  </div>
  </div>
</div>
 <script src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/jquery-form.js"></script>
<script type="text/javascript" src="static/js/qiniu.js"></script>
<script type="text/javascript" src="static/js/plupload/moxie.js"></script>
<script type="text/javascript" src="static/js/plupload/plupload.dev.js"></script>
<script type="text/javascript" src="static/js/plupload/i18n/zh_CN.js"></script>
<script type="text/javascript" src="static/js/highlight.js"></script>
<script type="text/javascript" src="static/js/main.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/ui.js"></script>
	<script>
		$("#imginput").change(function() {
				$("#avatarForm").ajaxSubmit({
					url : "http://upload.qiniu.com/",
					type : "post",
					dataType : "json",
					success : function(data) {
						$("#ajaxresult").html("");
							console.log(data);
						var img = new Image();
						img.src = "http://7xjeg2.com1.z0.glb.clouddn.com/"+data.key;
						img.width = 100;
						img.height = 100;
						$("#coverPhoto").attr("value",img.src);
						$("#ajaxresult").append(img);
					}
				});
			});
		
		$("#faCate").change(function(){
			var id = $(this).val();
			$.ajax({
				type:"GET",
				url:"api/getSonCate.json?pid="+id,
				success:function(data){
					$("#sonCate").empty();
					$(data).each(function(){
						$("#sonCate").append('<option value='+this.id+'>'+this.name+'</option>')
					});
				},
				error:function(){
					alert("查询失败!");
				}
			});
		});
		
		var token = document.getElementById("token").value;
		var uploader = Qiniu.uploader({
            runtimes: 'html5,flash,html4',    //上传模式,依次退化
            browse_button: 'pickfiles',       //上传选择的点选按钮，**必需**
            uptoken: token,          //Ajax请求upToken的Url，**强烈建议设置**（服务端提供）
            // uptoken : '<Your upload token>', //若未指定uptoken_url,则必须指定 uptoken ,uptoken由其他程序生成
            // unique_names: true, // 默认 false，key为文件名。若开启该选项，SDK为自动生成上传成功后的key（文件名）。
            // save_key: true,   // 默认 false。若在服务端生成uptoken的上传策略中指定了 `sava_key`，则开启，SDK会忽略对key的处理
            domain: 'http://7xjeg2.com1.z0.glb.clouddn.com/',   //bucket 域名，下载资源时用到，**必需**
            container: 'container',           //上传区域DOM ID，默认是browser_button的父元素，
            max_file_size: '100mb',           //最大文件体积限制
            flash_swf_url: 'static/js/plupload/Moxie.swf',  //引入flash,相对路径
            max_retries: 3,                   //上传失败最大重试次数
            dragdrop: true,                   //开启可拖曳上传
            drop_element: 'container',        //拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
            chunk_size: '4mb',                //分块上传时，每片的体积
            auto_start: true,                 //选择文件后自动上传，若关闭需要自己绑定事件触发上传
            init: {
                'FilesAdded': function(up, files) {
                	 $('table').show();
                     $('#success').hide();
                    plupload.each(files, function(file) {
                        // 文件添加进队列后,处理相关的事情
                    	 var progress = new FileProgress(file, 'fsUploadProgress');
                         progress.setStatus("等待...");
                    });
                },
                'BeforeUpload': function(up, file) {
                		/* alert("file");
                		for(i in file ){
                		  alert(i);           //获得属性 
                		  alert(file[i]);  //获得属性值

                		}
                		alert("up");
                		for(i in up ){
                  		  alert(i);           //获得属性 
                  		  alert(up[i]);  //获得属性值

                  		} */
                       // 每个文件上传前,处理相关的事情
                       var progress = new FileProgress(file, 'fsUploadProgress');
		               var chunk_size = plupload.parseSize(this.getOption('chunk_size'));
		               if (up.runtime === 'html5' && chunk_size) {
		                    progress.setChunkProgess(chunk_size);
                		}
                },
                'UploadProgress': function(up, file) {
                	 var progress = new FileProgress(file, 'fsUploadProgress');
                     var chunk_size = plupload.parseSize(this.getOption('chunk_size'));
                     progress.setProgress(file.percent + "%", up.total.bytesPerSec, chunk_size);
                       // 每个文件上传时,处理相关的事情
                       
                },
                'FileUploaded': function(up, file, info) {
                	var domain = up.getOption('domain');
                    var sourceLink = domain + file.name;
                    $("#video").attr("value",sourceLink);
                	var progress = new FileProgress(file, 'fsUploadProgress');
                    progress.setComplete(up, info);
                       // 每个文件上传成功后,处理相关的事情
                       // 其中 info 是文件上传成功后，服务端返回的json，形式如
                       // {
                       //    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
                       //    "key": "gogopher.jpg"
                       //  }
                       // 参考http://developer.qiniu.com/docs/v6/api/overview/up/response/simple-response.html

                       
                },
                'Error': function(up, err, errTip) {
                	$('table').show();
                    var progress = new FileProgress(err.file, 'fsUploadProgress');
                    progress.setError();
                    progress.setStatus(errTip);
                       //上传出错时,处理相关的事情
                },
                'UploadComplete': function(info) {
                	$('#success').show();
                },
                'Key': function(up, file) {
                    // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                    // 该配置必须要在 unique_names: false , save_key: false 时才生效
                    var key = file.name;
                    // do something with key here
                    return key
                }
            }
        });
  	</script>
</body>
</html>