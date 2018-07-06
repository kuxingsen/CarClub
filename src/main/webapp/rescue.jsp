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
<script type="text/javascript">

    //救援记录 点击添加按钮事件
    function rescueAdd(){
        var rescue={
            "MemberId": $("#MemberId").val(),
			"RescueTime":$("#RescueTime").val(),
			"RescuePlace":$("#RescuePlace").val(),
			"RescueStatus":$("#RescueStatus").val(),
            "CarId":$("#CarId").val()
		}
        $.ajax({
            url:("rescue/add"),
			data:rescue,
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“添加成功”
            success:function(data){
                alert("添加成功");
                window.location.href="rescue";

            },
            error:function(e){
                alert("添加失败");
            }
        });
    }

    //救援记录 点击修改获取内容
    /**
	 * 无法填充进去
     * @param id
     */
    function rescueModify(id)
    {
        //alert("modify")
        $.ajax({
            url:("rescue/"+id),
            type:"post",
            dataType:"json",
            success:function(data){
                $("#MemberId2").val(data.memberId);
                $("#MemberName2").val(data.memberName);
                $("#RescueId2").val(data.rescueId);
                $("#RescueTime2").val(data.rescueTime);
                $("#RescuePlace2").val(data.rescuePlace);
                $("#RescueStatus2").val(data.rescueStatus);
                $("#CarId2").val(data.carId);
            },
            error:function(e){

            }
        });
    }

    //救援记录  点击删除按钮事件
    function rescueDelete(id){
        // alert("delete");
        $.ajax({
            url:("rescue/delete/"+id),
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“删除成功”
            success:function(data){
                alert("删除成功");
                window.location.href="rescue";
            },
            error:function(e){
                alert("删除失败");
            }
        });
    }

    //救援记录  点击删除全部按钮事件
    function rescueDelAll(){
        //alert("delAll");
        $.ajax({
            url:(""),
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“删除成功”
            success:function(data){
			alert("删除成功");
                window.location.href="rescue";
            },
            error:function(e){
                alert("删除失败");
            }
        });
    }
	/**
	 *数据库修改成功，但弹出失败提示
	 */
    //救援记录  模态框点击修改按钮事件
    function rescueModify2()
    {
        var rescue={
            "MemberId": $("#MemberId2").val(),
            "rescueId":$("#RescueId2").val(),
            "RescueTime":$("#RescueTime2").val(),
            "RescuePlace":$("#RescuePlace2").val(),
            "RescueStatus":$("#RescueStatus2").val(),
            "carId":$("#CarId2").val()
        };
//        alert("rescueModify2");
        $.ajax({
            url:("rescue/modify"),
            data:rescue,
            type:"post",
            dataType:"text",
            success:function(data){
                alert("修改成功");
                window.location.href="rescue";
            },
            error:function(e){
				alert("修改失败");
            }
        });
    }
    /**
	 * 切换失败，后台的错
     * @param id
     */
    //救援车辆 点击状态切换按钮事件
    function carModify(id)
    {
        $.ajax({
            url:("car/change/"+id),
            type:"post",
            dataType:"text",
            success:function(data){
                //$("#"+data.carId).val(data.carStatus);
                window.location.href="rescue";
            },
            error:function(e){

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
			<h2 class="left-title">救援服务</h2>
			<ul class="leftNav">
				<li><a href="javascript:">救援记录</a></li>
				<li><a href="javascript:">救援车辆管理</a></li>
			</ul>
		</div>
		<div class="content-right">
			<h2 class="right-title">救援记录</h2>
			<table class="table  table-responsive table-hover myTable">
				<tbody>
				<tr class="active">
					<th>编号</th>
					<th>会员编号</th>
					<th>会员名字</th>
					<th>救援时间</th>
					<th>救援地点</th>
					<th>救援车辆</th>
					<th>救援情况</th>
					<th>&nbsp;修改&nbsp;</th>
					<th>&nbsp;删除&nbsp;</th>
				</tr>
				<c:forEach items="${rescueList}" var="rescue">
					<tr>
						<td>${rescue.rescueId}</td>
						<td>${rescue.memberId}</td>
						<td>${rescue.memberName}</td>
						<td>${rescue.rescueTime}</td>
						<td>${rescue.rescuePlace}</td>
						<td>${rescue.carId}</td>
						<td>${rescue.rescueStatus}</td>
						<td><button type="button" class="btn btn-xs btn-warning" onclick="rescueModify('${rescue.rescueId}')" data-toggle="modal" data-target="#MyRescueModify" >修改</button></td>
						<td><button type="button" class="btn btn-xs btn-danger " onclick="rescueDelete('${rescue.rescueId}')">删除</button></td>
					</tr>
				</c:forEach>

				</tbody>
			</table><br/><br/>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#MyRescueAdd">添加</button>
			<button type="button" id="rescueDelAll" class="btn btn-danger" onclick="rescueDelAll()">全部删除</button>
		</div>
		<div class="content-right">
			<h2 class="right-title">救援车辆管理</h2>
			<table class="table  table-responsive table-hover myTable">
				<tbody>
				<tr class="active">
					<th>救援车辆</th>
					<th>品牌</th>
					<th>车型</th>
					<th>状态</th>
					<th>&nbsp;状态切换&nbsp;</th>
				</tr>
				<c:forEach items="${carList}" var="car">
					<tr>
						<td>${car.carId}</td>
						<td>${car.carBrand}</td>
						<td>${car.carModel}</td>
						<td id="$(carId)">${car.carStatus}</td><!-- id为车辆id, 方便赋值-->
						<td><button type="button" class="btn btn-xs btn-warning" onclick="carModify('${car.carId}')">切换 </button></td>
					</tr>
				</c:forEach>

				</tbody>
			</table><br/><br/>
		</div>
	</div>
</div>
<!--模态框-->
<!-- 救援记录 添加按钮模态框 -->
<div class="modal fade in" id="MyRescueAdd">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="close" data-dismiss="modal">×</div>
				<h3 class="modal-title">添加救援记录</h3>
			</div>
			<div class="modal-body">
				<form action="">
					<div class="form-group">
						<label for="MemberId" class="control-label">会员编号:</label>
						<input type="text" class="form-control" name="MemberId" id="MemberId" required="">
					</div>
					<div class="form-group">
						<label for="MemberName" class="control-label">会员名字:</label>
						<input type="text" class="form-control" name="MemberName" id="MemberName" required="">
					</div>
					<div class="form-group">
						<label for="RescueTime" class="control-label">救援时间:</label>
						<input type="date" class="form-control" name="RecueTime" id="RescueTime" required="">
					</div>
					<div class="form-group">
						<label for="RescuePlace" class="control-label">救援地点:</label>
						<input type="text" class="form-control" name="RescuePlace" id="RescuePlace" required="">
					</div>
					<div class="form-group">
						<label for="CarId" class="control-label">救援车辆:</label>
						<input type="text" class="form-control" name="CarId" id="CarId" required="">
					</div>
					<div class="form-group">
						<label for="RescueStatus" class="control-label">救援情况:</label>
						<input type="text" class="form-control" name="RescueStatus" id="RescueStatus" required="">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="rescueAdd" class="btn btn-primary" onclick="rescueAdd()">添加</button>
				<button type="button" class="btn btn-danger " data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>

<!-- 救援记录 修改按钮模态框 -->
<div class="modal fade in" id="MyRescueModify">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="close" data-dismiss="modal">×</div>
				<h3 class="modal-title">修改救援记录</h3>
			</div>
			<div class="modal-body">
				<form action="">
					<div class="form-group">
						<label for="RescueId2" class="control-label">编号:</label>
						<input type="text" class="form-control" name="RescueId2" id="RescueId2" required="" disabled>
					</div>
					<div class="form-group">
						<label for="MemberId2" class="control-label">会员编号:</label>
						<input type="text" class="form-control" name="MemberId2" id="MemberId2" required="">
					</div>
					<div class="form-group">
						<label for="MemberName2" class="control-label">会员名字:</label>
						<input type="text" class="form-control" name="MemberName2" id="MemberName2" required="">
					</div>
					<div class="form-group">
						<label for="RescueTime2" class="control-label">救援时间:</label>
						<input type="date" class="form-control" name="RescueTime2" id="RescueTime2" required="">
					</div>
					<div class="form-group">
						<label for="RescuePlace2" class="control-label">救援地点:</label>
						<input type="text" class="form-control" name="RescuePlace2" id="RescuePlace2" required="">
					</div>
					<div class="form-group">
						<label for="CarId2" class="control-label">救援车辆:</label>
						<input type="text" class="form-control" name="CarId" id="CarId2" required="">
					</div>
					<div class="form-group">
						<label for="RescueStatus2" class="control-label">救援情况:</label>
						<input type="text" class="form-control" name="RescueStatus2" id="RescueStatus2" required="">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="rescueModify" class="btn btn-primary" onclick="rescueModify2()">修改</button>
				<button type="button" class="btn btn-danger " data-dismiss="modal">取消</button>
			</div>
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
        $(".nav li:eq(3) a:first").addClass("navCur");
    });
</script>
<script src="js/index.js"></script>
</html>