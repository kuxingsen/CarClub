<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">


    //提醒服务 点击确认按钮事件
    function serviceSure()
    {
        var arr="";
        $("input[type='checkbox']:checked").each(function () {
			arr+=(this.value)+"-";
        });
        arr=arr.substr(0,arr.length-1);
        var aa={
            "memberId":$("#MemberId").val(),
			"trainMessage":arr,
			"trainTime":$("#trainTime").val(),
			"message":$("#message").val()
		};
		 $.ajax({
			 url:("train/add"),
			 data:aa,
		 	type:"post",
		 	dataType:"text",
		 //添加成功后返回一个文本：“提交成功”
		 success:function(data){
			// alert("提交成功");
			$("#reset").trigger('click');
             window.location.href="train";
		 },
		 error:function(e){
             alert("提交失败");
		 }
		 });

    }
    //提醒服务 点击添加按钮事件
    function serviceAdd()
    {
        var aa = {
            "employeeId":"001",
        "RemindMessage":$("#remindMessage").val(),
        "RemindStatus":$("#remindStatus").val(),
        "RemindTime": $("#remindTime").val()
    };
        //alert("add");
        $.ajax({
            url:("remind/add"),
			data:aa,
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“添加成功”
            success:function(data){
               // alert("添加成功");
                window.location.href="train";
            },
            error:function(e){
                alert("添加失败");
            }
        });
    }

    //提醒服务  点击删除按钮事件
    function serviceDelete(id)
    {
        //alert("delete");
        $.ajax({
            url:("remind/delete/"+id),
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“删除成功”
            success:function(data){
                //alert("删除成功！");
                window.location.href="train";
            },
            error:function(e){
                alert("删除失败！");
            }
        });
    }
    //提醒服务 点击删除全部按钮事件
    function serviceDelAll()
    {
        //alert("delAll");
        $.ajax({
            url:(""),
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“删除成功”
            success:function(data){
                //alert("成功删除全部！");
            },
            error:function(e){
                alert("删除失败！");
            }
        });
    }

    //提醒服务 点击修改按钮事件
    function serviceModify(id)
    {
        //alert("modify");
        $.ajax({
            url:("remind/"+id),
            type:"post",
            dataType:"json",
            success:function(data){
                $("#remindId2").val(data.remindId);
                $("#remindMessage2").val(data.remindMessage);
                $("#remindStatus2").val(data.remindStatus);
                $("#remindTime2").val(data.remindTime);
            },
            error:function(e){

            }
        });
    }

    //提醒服务 模态框点击修改按钮事件
    function serviceModify2()
    {
        var aa = {
            "RemindId":$("#remindId2").val(),
			"RemindMessage":$("#remindMessage2").val(),
			"RemindStatus":$("#remindStatus2").val(),
			"RemindTime": $("#remindTime2").val()
		};
       // alert("serviceModify2");
        $.ajax({
            url:("remind/modify"),
			data:aa,
            type:"post",
            dataType:"text",
            success:function(data){
                alert("修改成功");
                window.location.href="train";
            },
            error:function(e){
                alert("修改失败");
            }
        });
    }
</script>
<body>
<jsp:include page="header.jsp"/>
<div class="clearfix"></div>
<!-- 车务管理内容-->
<div class="content" style="margin-top:20px">
	<div class="width1003">
		<div class="content-left">
			<h2 class="left-title">车务管理</h2>
			<ul class="leftNav">
				<li><a href="javascript:">代办服务</a></li>
				<li><a href="javascript:">提醒服务</a></li>
			</ul>
		</div>
		<div class="content-right">
			<h2 class="right-title">代办服务</h2>
			<form action="" method="post" class="service">
				<!-- 后台为服务赋值服务编号 -->
				<div class="form-group has-warning">
					<label for="MemberId" class="control-label">会员编号:</label>
					<input type="text" class="form-control" name="MemberId" id="MemberId" required="">
				</div>
				<div class="form-group has-warning">
					<label for="MemberName" class="control-label">姓名:</label>
					<input type="text" class="form-control" name="MemberName" id="MemberName" required="">
				</div>
				<div class="form-group has-warning">
					<p class="help-block"><strong>代办选择：</strong></p>
					<label class="checkbox-inline">
						<input type="checkbox" name="trainMessage" value="车牌代办">车牌代办
					</label>
					<label class="checkbox-inline">
						<input type="checkbox" name="trainMessage" value="保险代办">保险代办
					</label>
					<label class="checkbox-inline">
						<input type="checkbox" name="trainMessage" value="验证代办">验证代办
					</label>
					<label class="checkbox-inline">
						<input type="checkbox" name="trainMessage" value="落户代办">落户代办
					</label>
				</div>
				<div class="form-group has-warning">
					<label for="trainTime" class="control-label">时间:</label>
					<input type="date" class="form-control" name="trainTime" id="trainTime" required="">
				</div>
				<div class="form-group has-warning">
					<label for="message" class="control-label">备注:</label>
					<textarea class="form-control" name="message" id="message" style="height:80px"></textarea>
				</div>
				<div class="form-group">
					<button type="button"  class="btn btn-primary" onclick="serviceSure()">确认</button>
					<button type="reset" class="btn btn-danger" id="reset">取消</button>
				</div>
			</form>
		</div>
		<div class="content-right">
			<h2 class="right-title">提醒服务</h2>
			<table class="table  table-responsive table-hover myTable">
				<tbody>
				<tr class="active">
					<th>活动编号</th>
					<th>活动内容</th>
					<th>日期</th>
					<th>状态</th>
					<th>&nbsp;修改&nbsp;</th>
					<th>&nbsp;删除&nbsp;</th>
				</tr>
				<c:forEach items="${remindList}" var="r">
					<tr>
						<td>${r.remindId}</td>
						<td>${r.remindMessage}</td>
						<td>${r.remindTime}</td>
						<td>${r.remindStatus}</td>
						<td><button type="button" class="btn btn-xs btn-warning" onclick="serviceModify('${r.remindId}')" data-toggle="modal" data-target="#MyServiceModify">修改</button></td>
						<td><button type="button" class="btn btn-xs btn-danger serviceDelete " onclick="serviceDelete('${r.remindId}')">删除</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table><br/><br/>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#MyServiceAdd">添加</button>
			<button type="button" id="serviceDelAll" class="btn btn-danger" onclick="serviceDelAll()">全部删除</button>
		</div>
	</div>
</div>
<!--模态框-->
<!-- 提醒 添加按钮模态框 -->
<div class="modal fade in" id="MyServiceAdd">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="close" data-dismiss="modal">×</div>
				<h3 class="modal-title">添加提醒</h3>
			</div>
			<div class="modal-body">
				<form action="">
					<div class="form-group">
						<label for="remindMessage" class="control-label">提醒内容:</label>
						<input type="text" class="form-control" name="remindMessage" id="remindMessage" required="">
					</div>
					<div class="form-group">
						<label for="remindStatus" class="control-label">状态:</label>
						<input type="text" class="form-control" name="remindStatus" id="remindStatus" required="">
					</div>
					<div class="form-group">
						<label for="remindTime" class="control-label">日期:</label>
						<input type="date" class="form-control" name="remindTime" id="remindTime" required="">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="serviceAdd" class="btn btn-primary" onclick="serviceAdd()">添加</button>
				<button type="button" class="btn btn-danger " data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>

<!-- 提醒 修改按钮模态框 -->
<div class="modal fade in" id="MyServiceModify">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="close" data-dismiss="modal">×</div>
				<h3 class="modal-title">修改提醒</h3>
			</div>
			<div class="modal-body">
				<form action="">
					<div class="form-group">
						<label for="remindId2" class="control-label">活动编号:</label>
						<input type="text" class="form-control" name="remindId2" id="remindId2" disabled>
					</div>
					<div class="form-group">
						<label for="remindMessage2" class="control-label">提醒内容:</label>
						<input type="text" class="form-control" name="remindMessage" id="remindMessage2" required="">
					</div>
					<div class="form-group">
						<label for="remindStatus2" class="control-label">状态:</label>
						<input type="text" class="form-control" name="remindStatus" id="remindStatus2" required="">
					</div>
					<div class="form-group">
						<label for="remindTime2" class="control-label">日期:</label>
						<input type="date" class="form-control" name="remindTime2" id="remindTime2" required="">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type=button id="serviceModify" class="btn btn-primary" onclick="serviceModify2()">修改</button>
				<button type="button" class="btn btn-danger " data-dismiss="modal">取消</button>
			</div>
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
        $(".nav li:eq(1) a:first").addClass("navCur");
    })
</script>
<script src="js/index.js"></script>
</html>