<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/register.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="content">
	<div class="main">
		<h2>用户注册表</h2>
		<form action="login.jsp" method="post">
			<h5>姓名</h5>
			<input type="text" value="name" name="EmployeeName" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'name';}" required="">
			<h5>电话</h5>
			<input type="text" value="phonenumber" name="EmployeePhone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'phonenumber';}" required="">
			<h5>Email</h5>
			<input type="text" value="1548132154@qq.com" name="EmployeeEmail" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '1548132154@qq.com';}" required="">
			<h5>地址</h5>
			<input type="text" value="address" name="EmployeeAddr" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'address';}" required="">
			<h5>年龄</h5>
			<input type="text" value="age" name="EmployeeAge" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'age';}" required=""><br/><br/>
			<h5>密码</h5>
			<input type="password" value="password" name="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}" required="">
			<h5>确认密码</h5>
			<input type="password" value="password2" name="password2" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}" required="">
			<h5>注册码</h5>
			<input type="text" value="register code" name="code" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'register code';}" required="">
			<input type="submit"  class="register" value="注册">
		</form>
	</div>
</div>
</body>
<script type="text/javascript">

</script>
</html>