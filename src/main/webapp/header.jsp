<%@ page import="cn.carClub.pojo.Employee" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!-- 头部 -->
<div class="header">
	<div class="width1003">
		<div class="logo">

		</div>
		<div class="topLink">
			<a class="tl1" data-toggle="modal" data-target="#contact">联系我们</a>
			<a class="tl2" data-toggle="modal" data-target="#suggest">投诉建议</a>
			<a class="tl3" data-toggle="modal" data-target="#wanted">人才招聘</a>
			<p class="phone">服务热线：<strong>854854854</strong></p>
		</div>
		<div class="right">
			<a href="userInfo" class="user_info">${pageContext.session.getAttribute("employee").employeeName}</a>
			<span class="line">|</span>
			<a href="logout">注销</a>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<!-- 导航条 -->
<div class="nav">
	<%
		Employee employee = (Employee) session.getAttribute("employee");
		String power = employee.getEmployeePower();
		if(power.equals("1"))
		{
		    %>
	<ul>
		<li style="margin-left:180px"><a href="index">首页</a></li>
	<%
		}else{
		    %>
		<ul class="width1003">
			<li><a href="index">首页</a></li>
		<%
		}
	%>

		<li>
			<a href="train" class="carManger">车务管理</a>
			<div class="childNav">
				<a href="train">代办服务</a>
				<a href="train">提醒服务</a>
			</div>
		</li>
		<li>
			<a href="travel">旅行服务</a>
			<div class="childNav">
				<a href="travel">定制旅行服务</a>
				<a href="travel">查看旅行记录</a>
			</div>
		</li>
		<li>
			<a href="rescue">救援服务</a>
			<div class="childNav">
				<a href="rescue">救援记录</a>
				<a href="rescue">救援车辆管理</a>
			</div>
		</li>
		<li>
			<a href="report">报表图表</a>
			<div class="childNav">
				<a href="report">服务信息</a>
				<a href="report">收费情况</a>
			</div>
		</li>
		<li>
			<a href="member">会员管理</a>
			<div class="childNav">
				<a href="member">会员管理</a>
			</div>
		</li>
			<%
				if(power.equals("1")){
				    %>
			<li>
			<a href="employee">员工管理</a>
			<div class="childNav">
				<a href="employee">员工管理</a>
			</div>
		</li>
			<%
				}
			%>

	</ul>
</div>
<span  id="index" style="display:none"><%=session.getAttribute("index")%></span>
<script type="text/javascript">

    $(".user_info").click(function(){
        $.ajax({
            url:(""),
            type:"post",
            dataType:"text",
            success:function(data){

            },
            error:function(e){

            }
        })
	})
    //点击车务管理获取数据
    $(".nav ul li").eq(1).click(function(){
        //alert("1");
		/*  $.ajax({
		 url:(""),
		 type:"post",
		 dataType:"json",
		 //添加成功后返回一个文本：“提交成功”
		 success:function(data){
		 alert(data);
		 },
		 error:function(e){

		 }
		 })  */
    });

    //点击旅行服务获取数据
    $(".nav ul li").eq(2).click(function(){
        ///alert("2");
		/* $.ajax({
		 url:(""),
		 type:"post",
		 dataType:"json",
		 success:function(data){
		 alert(data);
		 },
		 error:function(e){

		 }
		 }) */
    });
    //点击救援服务获取数据
    $(".nav ul li").eq(3).click(function(){
        //alert("3");
		/* $.ajax({
		 url:(""),
		 type:"post",
		 dataType:"json",
		 success:function(data){
		 alert(data);
		 },
		 error:function(e){

		 }
		 }) */
    });

    //点击报表图表获取数据
    $(".nav ul li").eq(4).click(function(){
        //alert("4");
		/* $.ajax({
		 url:(""),
		 type:"post",
		 dataType:"json",
		 success:function(data){
		 alert(data);
		 },
		 error:function(e){

		 }
		 }) */
    });

    //个人信息按钮点击后区数据库拿信息
    $(".user_info").click(function(){
        window.location.herf="";
    })


</script>