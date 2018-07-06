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

    //旅行服务  添加旅行记录 点击确认按钮
    function travelSure()
    {
        var travel={
            "MemberId":$("#MemberId").val(),
            "TravelTime":$("#TraveTime").val(),
            "TravelAddress":$("#TraveAddress").val(),
            "TravelPrice":$("#TravePrice").val()
        }
        // alert("sure");
        $.ajax({
            url:("travel/add"),
			data:travel,
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“提交成功”
            success:function(data){
                //alert("添加成功");
				$("#reset").trigger('click');
				window.location.href="travel";
            },
            error:function(e){

            }
        });
    }



    //旅行服务 点击删除按钮事件
    function travelDelete(id)
    {
        // alert("delete");
        $.ajax({
            url:("travel/delete/"+id),
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“删除成功”
            success:function(data){
               // alert("删除成功");
                window.location.href="travel";
            },
            error:function(e){
                alert("删除失败");
            }
        });
    }

    //旅行服务 点击删除全部按钮事件
    function travelDelAll()
    {
        //alert("delAll");
        $.ajax({
            url:(""),
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“删除成功”
            success:function(data){
              //  alert("删除成功");
            },
            error:function(e){
                alert("删除失败");
            }
        });
    }
    //旅行服务 点击修改按钮事件
    function travelModify(id)
    {
        //alert("modify");
        $.ajax({
            url:("travel/"+id),
            type:"post",
            dataType:"json",
            //添加成功后返回一个文本：“删除成功”
            success:function(data){
                $("#TravelId2").val(data.travelId);
                $("#MemberId2").val(data.memberId);
                $("#MemberName2").val(data.memberName);
                $("#TraveTime2").val(data.travelTime);
                $("#TraveAddress2").val(data.travelAddress);
                $("#TravePrice2").val(data.travelPrice);
            },
            error:function(e){

            }
        });
    }

    //旅行服务 模态框点击修改按钮事件
    function travelModify2()
    {
        var travel={
            "TravelId":$("#TravelId2").val(),
            "MemberId":$("#MemberId2").val(),
			"MemberName": $("#MemberName2").val(),
			"TravelTime":$("#TraveTime2").val(),
			"TravelAddress":$("#TraveAddress2").val(),
			"TravelPrice":$("#TravePrice2").val()
		}
        $.ajax({
            url:("travel/modify"),
			data:travel,
            type:"post",
            dataType:"text",
            success:function(data){
                alert("修改成功");
                window.location.href="travel";
            },
            error:function(e){
                alert("修改失败")
            }
        });
    }


</script>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="clearfix"></div>
<!-- 车务管理内容-->
<div class="content" style="margin-top:20px">
	<div class="width1003">
		<div class="content-left">
			<h2 class="left-title">旅行服务</h2>
			<ul class="leftNav">
				<li><a href="javascript:">定制旅行服务</a></li>
				<li><a href="javascript:">查看旅行记录</a></li>
			</ul>
		</div>
		<div class="content-right">
			<h2 class="right-title">定制旅行服务</h2>
			<form action="" method="post" class="travel">
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
					<label for="TraveTime" class="control-label">时间:</label>
					<input type="date" class="form-control" name="TraveTime" id="TraveTime" required="">
				</div>
				<div class="form-group has-warning">
					<label for="TraveAddress" class="control-label">地点:</label>
					<input type="text" class="form-control" name="TraveAddress" id="TraveAddress" required="">
				</div>
				<div class="form-group has-warning">
					<label for="TravePrice" class="control-label">价格:</label>
					<input type="text" class="form-control" name="TravePrice" id="TravePrice" required="">
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" onclick="travelSure()">确认</button>
					<button type="reset" class="btn btn-danger" id="reset">取消</button>
				</div>
			</form>
		</div>
		<div class="content-right">
			<h2 class="right-title">查看旅行记录</h2>
			<table class="table  table-responsive table-hover myTable">
				<tbody>
				<tr class="active">
					<th>服务编号</th>
					<th>会员编号</th>
					<th>姓名</th>
					<th>时间</th>
					<th>地点</th>
					<th>价格</th>
					<th>&nbsp;修改&nbsp;</th>
					<th>&nbsp;删除&nbsp;</th>
				</tr>
				<c:forEach items="${travelList}" var="travel">
					<tr>
						<td>${travel.travelId}</td>
						<td>${travel.memberId}</td>
						<td>${travel.memberName}</td>
						<td>${travel.travelTime}</td>
						<td>${travel.travelAddress}</td>
						<td>￥${travel.travelPrice}</td>
						<td><button type="button" class="btn btn-xs btn-warning" onclick="travelModify('${travel.travelId}')" data-toggle="modal" data-target="#MyTravelModify">修改</button></td>
						<td><button type="button" class="btn btn-xs btn-danger travelDelete " onclick="travelDelete('${travel.travelId}')">删除</button></td>
					</tr>
				</c:forEach>

				</tbody>
			</table><br/><br/>
			<button type="button" id="travelDelAll" class="btn btn-danger" onclick="travelDelAll()">全部删除</button>
		</div>
	</div>
</div>
<!--模态框-->
<!-- 旅行  修改按钮模态框 -->
<div class="modal fade in" id="MyTravelModify">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="close" data-dismiss="modal">×</div>
				<h3 class="modal-title">修改旅行记录</h3>
			</div>
			<div class="modal-body">
				<form action="" method="post" class="travel">
					<div class="form-group">
						<label for="TravelId2" class="control-label">会员编号:</label>
						<input type="text" class="form-control" name="TravelId2" id="TravelId2" required="" disabled>
					</div>
					<div class="form-group">
						<label for="MemberId2" class="control-label">会员编号:</label>
						<input type="text" class="form-control" name="MemberId2" id="MemberId2" required="" disabled>
					</div>
					<div class="form-group">
						<label for="MemberName2" class="control-label">姓名:</label>
						<input type="text" class="form-control" name="MemberName2" id="MemberName2" required="">
					</div>
					<div class="form-group">
						<label for="TraveTime2" class="control-label">时间:</label>
						<input type="date" class="form-control" name="TraveTime2" id="TraveTime2" required="">
					</div>
					<div class="form-group">
						<label for="TraveAddress2" class="control-label">地点:</label>
						<input type="text" class="form-control" name="TraveAddress2" id="TraveAddress2" required="">
					</div>
					<div class="form-group">
						<label for="TravePrice2" class="control-label">价格:</label>
						<input type="text" class="form-control" name="TravePrice2" id="TravePrice2" required="">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="travelModify" class="btn btn-primary" onclick="travelModify2()">修改</button>
				<button type="button" class="btn btn-danger " data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>

<div class="clearfix"></div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="modal.jsp"></jsp:include>
</body>
<script src="js/index.js"></script>
<script type="text/javascript">
    $(function(){
        //导航定位
        $(".nav li:eq(2) a:first").addClass("navCur");
    });
</script>
</html>