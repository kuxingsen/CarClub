<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
	.content-right{
		position:relative;
	}
	.import1{
		position:absolute;
		right:10px;
		top:5px;
	}
	.import2{
		position:absolute;
		right:10px;
		top:5px;
	}
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="clearfix"></div>
<!-- 车务管理内容-->
<div class="content">
	<div class="width1003">
		<div class="content-left">
			<h2 class="left-title">报表管理</h2>
			<ul class="leftNav">
				<li><a href="javascript:">服务信息</a></li>
				<li><a href="javascript:">收费情况</a></li>
			</ul>
		</div>
		<div class="content-right" >
			<h2 class="right-title">服务信息</h2>
			<button type="button" class="btn btn-warning import1">导出excel</button>
			<table class="table  table-responsive table-hover myTable">
				<tbody>
				<tr class="active">
					<th>会员编号</th>
					<th>会员名字</th>
					<th>服务</th>
					<th>时间</th>
					<th>服务内容</th>
				</tr>
				<c:forEach items="${allServices}" var="s">
					<tr>
						<td>${s.memberId}</td>
						<td>${s.memberName}</td>
						<td>${s.serviceName}</td>
						<td>${s.serviceTime}</td>
						<td>${s.serviceMessage}</td>
					</tr>
				</c:forEach>

				</tbody>
			</table><br/><br/>
		</div>
		<div class="content-right">
			<h2 class="right-title">收费情况</h2>
			<button type="button" class="btn btn-warning import2">导出excel</button>
			<table class="table  table-responsive table-hover myTable">
				<tbody>
				<tr class="active">
					<th>服务编号</th>
					<th>会员编号</th>
					<th>会员名字</th>
					<th>收费</th>
					<th>收费内容</th>
				</tr>
				<tr>
					<td>009</td>
					<td>003</td>
					<td>王五</td>
					<td>1000元</td>
					<td>车牌代办</td>
				</tr>
				</tbody>
			</table><br/><br/>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<jsp:include page="footer.jsp"/>
<jsp:include page="modal.jsp"/>
</body>
<script type="text/javascript">
    $(function(){
        //导航定位
        $(".nav li:eq(4) a:first").addClass("navCur");
        $(".import1").click(function(){
			 $.ajax({
			 url:("toServiceExcel"),
			 type:"post",
			 dataType:"text",
			 //添加成功后返回一个文本：“提交成功”
			 success:function(data){
                 alert("下载成功");
			 },
			 error:function(e){

			 }
			 })

        });
        $(".import2").click(function(){
			  $.ajax({
			 url:("toCostExcel"),
			 type:"post",
			 dataType:"text",
			 //添加成功后返回一个文本：“提交成功”
			 success:function(data){
			 	alert("下载成功");
			 },
			 error:function(e){

			 }
			 })
        });
    });
</script>
<script src="js/index.js"></script>
</html>