<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="am-cf admin-main">
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">表单</strong> / <small>form</small>
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
								<div class="am-u-sm-4 am-u-md-2 am-text-right">封面图片:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<input type="file" class="am-input-sm" form="avatarForm" name="file" id="imginput" />
									<div id="ajaxresult" style="width: 100px;height:100px;border: 1px solid #CCC;margin-top: 5px;">
									</div>
								</div>
							</div>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">文件上传:</div>
								<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
									<input type="file" class="am-input-sm" name="file" form="avatarForm" id="videoinput"/>
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
				<input name="token" type="hidden" form="avatarForm" value=${uptoken}>
			</div>
		</div>
		</div>
		 	<script src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/jquery-form.js"></script>
		<script>
		$(function() {
  			$("#imginput").on("change", function() {
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
  		});
		
		$(function() {
  			$("#videoinput").on("change", function() {
  				$("#avatarForm").ajaxSubmit({
  					url : "http://upload.qiniu.com/",
  					type : "post",
  					dataType : "json",
  					success : function(data) {
  							console.log(data);
  							alert("上传成功");
							var img = new Image();
							img.src = "http://7xiwqh.com2.z0.glb.clouddn.com/"+data.key;
							$("#video").attr("value",img.src);
  					}
  				});
  			});
  		});
  	</script>
</body>
</html>
