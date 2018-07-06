<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="css/register.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="content">
	<div class="main">
		<h2>用户登录</h2>
		<form action="index" method="post" style="height:250px">
			<h5>账号</h5>
			<input type="text" value="username" name="username" onfocus="this.value = '';" onblur="if (this.value === '') {this.value = 'username';}" required="">
			<h5>密码</h5>
			<input type="password" value="000000" name="password" onfocus="this.value = '';" onblur="if (this.value === '') {this.value = 'password';}" required="">
			<button type="submit" class="btn btn-warning">登录</button>
			<button type="submit" formaction="register.jsp" class="btn btn-primary">注册</button>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">

</script>
</html>