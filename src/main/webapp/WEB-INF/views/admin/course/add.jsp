<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="static/css/bootstrap.css">
<link rel="stylesheet" href="static/css/main.css">
<link rel="stylesheet" href="static/css/highlight.css">
<title>添加课程</title>
</head>
<body>
	<div class="am-cf admin-main">
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">添加课程</strong>
				</div>
			</div>

			<div class="am-tabs am-margin" data-am-tabs>
				<ul class="am-tabs-nav am-nav am-nav-tabs">
					<li><a href="#tab1">课程信息</a></li>
				</ul>
				<form method="post" class="am-form" enctype="multipart/form-data">
					<div class="am-tabs-bd">
						<div class="am-tab-panel am-fade">
							<input type="hidden" id="coverPhoto" name="avatar" class="span2"/>
							<input type="hidden" id="video" name="video" class="span2"/>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">课程名称:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<input type="text" class="am-input-sm" name="name" />
								</div>
							</div>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">作者:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<input type="text" class="am-input-sm" name="author" />
								</div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">是否免费:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<select name="freeflag">
										<option value="true" selected>免费</option>
										<option value="false" >收费</option>
									</select>
								</div>
							</div>

							<div class="am-g am-margin-top" >
								<div class="am-u-sm-4 am-u-md-2 am-text-right">观看价格:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<input type="text" class="am-input-sm" name="price" />
								</div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">课程时长:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<input type="text" class="am-input-sm" name="duration" />
								</div>
							</div>
			
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">课程难度:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<input type="text" class="am-input-sm" name="level" />
								</div>
							</div>
											
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">课程简介:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<textarea class="am-input-sm" name="introduction" rows="5" cols="20"></textarea>
								</div>
							</div>		
							
							
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">父分类:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<select id="faCate" name="faCate">
									<c:forEach items="${cates}" var="cate">
										<option value="${cate.id }">${cate.name }</option>
									</c:forEach>
									</select>
								</div>
							</div>	
							
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">子分类:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<select id="sonCate" name="sonCate">
									</select>
								</div>
							</div>					
							
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">封面图片:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<input type="file" class="am-input-sm" form="avatarForm" name="file" id="imginput" />
									<div id="ajaxresult" style="width: 100px;height:100px;border: 1px solid #CCC;margin-top: 5px;">
									</div>
								</div>
							</div>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">文件上传:</div>
								<!-- <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<input type="file" class="am-input-sm" name="file" form="avatarForm" id="videoinput"/>
								</div> -->
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
							</div>
						</div>
					</div>
					<div class="am-margin">
						<button type="submit" class="am-btn am-btn-primary am-btn-xs">提交保存</button>
						<button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="javascript:window.history.go(-1)">放弃保存</button>
					</div>
				</form>
				<form id="avatarForm" class="form-horizontal well" enctype="multipart/form-data" style="display:none"></form>
				<input name="token" type="hidden" form="avatarForm" id="token" value=${uptoken}>
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
  				alert("111");
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
