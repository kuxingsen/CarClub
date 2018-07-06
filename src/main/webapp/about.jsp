<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>车务管理</title>
	<link rel="stylesheet" href="css/index.css" />
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="clearfix"></div>
<!-- 车务管理内容-->
<div class="content">
	<div class="width1003">
		<div class="content-left">
			<h2 class="left-title">关于我们</h2>
			<ul class="leftNav">
				<li><a href="javascript:">嘉伟士简介</a></li>
				<li><a href="javascript:">嘉伟士历程</a></li>
			</ul>
		</div>
		<div class="content-right">
			<h2 class="right-title">嘉伟士简介</h2>
		</div>
		<div class="content-right">
			<h2 class="right-title">嘉伟士历程</h2>
		</div>
		<div class="content-right">
			<h2 class="right-title">嘉伟士文化</h2>
		</div>
		<div class="content-right">
			<h2 class="right-title">企业邮箱登录</h2>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="modal.jsp"></jsp:include>
</body>
<script type="text/javascript">
    $(function(){
        //导航定位
        $(".nav li:eq(5) a:first").addClass("navCur");
    });
</script>
<script src="js/index.js"></script>
</html>