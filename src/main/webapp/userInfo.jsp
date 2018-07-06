<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/register.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
</head>
<body>
<div class="content">
	<div class="main">
		<h2>个人信息</h2>
		<form method="post">
			<h5>编号:</h5>
			<input type="text" id="EmployeeId" value="${employee.employeeId}" disabled>
			<h5>姓名</h5>
			<input type="text" id="EmployeeName" value="${employee.employeeName}">
			<h5>电话</h5>
			<input type="text" id="EmployeePhone" value="${employee.employeePhone}">
			<h5>性别</h5>
			<input type="text" id="EmployeeSex" value="${employee.employeeSex}" >
			<h5>Email</h5>
			<input type="text" id="EmployeeEmail" value="${employee.employeeEmail}" >
			<h5>地址</h5>
			<input type="text" id="EmployeeAddr" value="${employee.employeeAddr}" >
			<h5>年龄</h5>
			<input type="text" id="EmployeeAge" value="${employee.employeeAge}" ><br/><br/>
			<h5>密码</h5>
			<input type="password"  id="password" value="${employee.password}">
			<h5>确认密码</h5>
			<input type="password"  id="password2" value="${employee.password}">
			<span class="info"></span>
			<input type="button"  class="infoModify" value="修改">
			<input type="button" value="返回主界面"  onclick="window.location.href='index'">
		</form>
	</div>
</div>
</body>
<script type="text/javascript">


    $(".infoModify").click(function(){
        //alert("ll");
       var password =  $("#password").val();
       var password2 = $("#password2").val();
       if(password != password2)
           $(".info").html("密码不一致！").css({"color":"#f00"});
       else
	   {
           var user={
               "employeeId":$("#EmployeeId").val(),
               "employeeName":$("#EmployeeName").val(),
               "employeeSex":$("#EmployeeSex").val(),
               "employeePhone": $("#EmployeePhone").val(),
               "employeeEmail":$("#EmployeeEmail").val(),
               "employeeAddr":$("#EmployeeAddr").val(),
               "employeeAge":$("#EmployeeAge").val(),
			   "username":${employee.username},
			   "employeePower":${employee.employeePower},
               "password":$("#password").val()
           };
           $.ajax({
               url:("user/modify"),
               type:"post",
			   data:user,
               dataType:"text",
               success:function(data){
					alert("修改成功");
               },
               error:function(e){

               }
           });
	   }
    })
</script>
</html>