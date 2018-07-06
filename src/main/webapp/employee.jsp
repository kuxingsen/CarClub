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

    /**
     * 缺少username,password
     */
    function employeeAdd()
    {
        var employee={
            "employeeId":$("#EmployeeId").val(),
            "employeeName":$("#EmployeeName").val(),
            "employeeSex":$("#EmployeeSex").val(),
            "employeeAge":$("#EmployeeAge").val(),
            "employeePhone":$("#EmployeePhone").val(),
            "employeeEmail":$("#EmployeeEmail").val(),
            "employeeAddr":$("#EmployeeAddress").val(),
            "username":$("#username").val(),
            "password":$("#password").val()
        };
        //alert("sure");
        $.ajax({
            url:("employee/add"),
            data:employee,
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“提交成功”
            success:function(data){
                window.location.href="employee";
            },
            error:function(e){

            }
        });
    }



    //旅行服务 点击删除按钮事件
    function employeeDelete(id)
    {
        //alert("delete");
        $.ajax({
            url:("employee/delete/"+id),
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“删除成功”
            success:function(data){
               // alert("删除成功");
                window.location.href="employee";
            },
            error:function(e){
                alert("删除失败");
            }
        });
    }

    //旅行服务 点击删除全部按钮事件
    function employeeDelAll()
    {
        //lert("delAll");
        $.ajax({
            url:(""),
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“删除成功”
            success:function(data){
                //alert("删除成功");
            },
            error:function(e){
                alert("删除失败");
            }
        });
    }
    //旅行服务 点击修改按钮事件
    function employeeModify(id)
    {
        // alert("modify");
        $.ajax({
            url:("employee/"+id),
            type:"post",
            dataType:"json",
            success:function(data){
                $("#EmployeeId2").val(data.employeeId);
                $("#EmployeeName2").val(data.employeeName);
                $("#EmployeeSex2").val(data.employeeSex);
                $("#EmployeeAge2").val(data.employeeAge);
                $("#EmployeePhone2").val(data.employeePhone);
                $("#EmployeeEmail2").val(data.employeeEmail);
                $("#EmployeeAddress2").val(data.employeeAddr);
                $("#username2").val(data.username);
            },
            error:function(e){

            }
        });
    }

    //旅行服务 模态框点击修改按钮事件
    function employeeModify2()
    {
        var employee={
            "employeeId":$("#EmployeeId2").val(),
            "employeeName":$("#EmployeeName2").val(),
            "employeeSex":$("#EmployeeSex2").val(),
            "employeeAge":$("#EmployeeAge2").val(),
            "employeePhone":$("#EmployeePhone2").val(),
            "employeeEmail":$("#EmployeeEmail2").val(),
            "employeeAddr":$("#EmployeeAddress2").val(),
            "username":$("#username2").val()
        };
        //alert("modify")
        $.ajax({
            url:("employee/modify"),
            data:employee,
            type:"post",
            dataType:"text",
            success:function(data){
                alert("修改成功");
                window.location.href="employee";
            },
            error:function(e){
                alert("修改失败")
            }
        });
    }


</script>
<body>
<jsp:include page="header.jsp"/>
<div class="clearfix"></div>
<!-- 会员管理-->
<div class="content" style="margin-top:20px;">
    <div class="width1003">
        <div class="content-left">
            <h2 class="left-title">员工管理</h2>
            <ul class="leftNav">
                <li><a href="javascript:">员工管理</a></li>
            </ul>
        </div>

        <div class="content-right">
            <h2 class="right-title">员工信息</h2>
            <table class="table  table-responsive table-hover myTable">
                <tbody>
                <tr class="active">
                    <th>员工编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>电话</th>
                    <th>Email</th>
                    <th>地址</th>
                    <th>&nbsp;修改&nbsp;</th>
                    <th>&nbsp;删除&nbsp;</th>
                </tr>
                <c:forEach items="${employeeList}" var="employee">
                    <tr>
                        <td>${employee.employeeId}</td>
                        <td>${employee.employeeName}</td>
                        <td>${employee.employeeSex}</td>
                        <td>${employee.employeeAge}</td>
                        <td>${employee.employeePhone}</td>
                        <td>${employee.employeeEmail}</td>
                        <td>${employee.employeeAddr}</td>
                        <td><button type="button" class="btn btn-xs btn-warning" onclick="employeeModify('${employee.employeeId}')" data-toggle="modal" data-target="#MyEmployeeModify">修改</button></td>
                        <td><button type="button" class="btn btn-xs btn-danger employeeDelete " onclick="employeeDelete('${employee.employeeId}')">删除</button></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table><br/><br/>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#MyEmployeeAdd">添加</button>
            <button type="button" id="employeeDelAll" class="btn btn-danger" onclick="employeeDelAll()">全部删除</button>
        </div>
    </div>
</div>
<!--模态框-->

<!-- 会员  添加按钮模态框 -->
<div class="modal fade in" id="MyEmployeeAdd">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="close" data-dismiss="modal">×</div>
                <h3 class="modal-title">添加员工</h3>
            </div>
            <div class="modal-body">
                <form action="" method="post" class="employee">
                    <div class="form-group">
                        <label for="EmployeeId" class="control-label">员工编号:</label>
                        <input type="text" class="form-control" name="EmployeeId" id="EmployeeId" required="">
                    </div>
                    <div class="form-group">
                        <label for="EmployeeName" class="control-label">姓名:</label>
                        <input type="text" class="form-control" name="EmployeeName" id="EmployeeName" required="">
                    </div>
                    <div class="form-group">
                        <label for="EmployeeSex" class="control-label">性别:</label>
                        <input type="text" class="form-control" name="EmployeeSex" id="EmployeeSex" required="">
                    </div>
                    <div class="form-group">
                        <label for="EmployeeAge" class="control-label">年龄:</label>
                        <input type="text" class="form-control" name="EmployeeAge" id="EmployeeAge" required="">
                    </div>
                    <div class="form-group">
                        <label for="EmployeePhone" class="control-label">电话:</label>
                        <input type="text" class="form-control" name="EmployeePhone" id="EmployeePhone" required="">
                    </div>
                    <div class="form-group">
                        <label for="EmployeeEmail" class="control-label">Email:</label>
                        <input type="text" class="form-control" name="EmployeeEmail" id="EmployeeEmail" required="">
                    </div>
                    <div class="form-group">
                        <label for="EmployeeAddress" class="control-label">地址:</label>
                        <input type="text" class="form-control" name="EmployeeAddress" id="EmployeeAddress" required="">
                    </div>
                    <div class="form-group">
                        <label for="username" class="control-label">账户:</label>
                        <input type="text" class="form-control" name="username" id="username" required="">
                    </div>
                    <div class="form-group">
                        <label for="password" class="control-label">密码:</label>
                        <input type="text" class="form-control" name="password" id="password" required="">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="employeeAdd" class="btn btn-primary" onclick="employeeAdd()">确认</button>
                <button type="button" class="btn btn-danger " data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- 会员  修改按钮模态框 -->
<div class="modal fade in" id="MyEmployeeModify">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="close" data-dismiss="modal">×</div>
                <h3 class="modal-title">修改员工信息</h3>
            </div>
            <div class="modal-body">
                <form action="" method="post" class="travel">
                    <div class="form-group">
                        <label for="EmployeeId2" class="control-label">员工编号:</label>
                        <input type="text" class="form-control" name="EmployeeId2" id="EmployeeId2" required="" disabled>
                    </div>
                    <div class="form-group">
                        <label for="EmployeeName2" class="control-label">姓名:</label>
                        <input type="text" class="form-control" name="EmployeeName2" id="EmployeeName2" required="">
                    </div>
                    <div class="form-group">
                        <label for="EmployeeSex2" class="control-label">性别:</label>
                        <input type="text" class="form-control" name="EmployeeSex2" id="EmployeeSex2" required="">
                    </div>
                    <div class="form-group">
                        <label for="EmployeeAge2" class="control-label">年龄:</label>
                        <input type="text" class="form-control" name="EmployeeAge2" id="EmployeeAge2" required="">
                    </div>
                    <div class="form-group">
                        <label for="EmployeePhone2" class="control-label">电话:</label>
                        <input type="text" class="form-control" name="EmployeePhone2" id="EmployeePhone2" required="">
                    </div>
                    <div class="form-group">
                        <label for="EmployeeEmail2" class="control-label">Email:</label>
                        <input type="text" class="form-control" name="EmployeeEmail2" id="EmployeeEmail2" required="">
                    </div>
                    <div class="form-group">
                        <label for="EmployeeAddress2" class="control-label">地址:</label>
                        <input type="text" class="form-control" name="EmployeeAddress2" id="EmployeeAddress2" required="">
                    </div>
                    <div class="form-group">
                        <label for="username2" class="control-label">账户:</label>
                        <input type="text" class="form-control" name="username2" id="username2" required="">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="employeeModify" class="btn btn-primary" onclick="employeeModify2()">修改</button>
                <button type="button" class="btn btn-danger " data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<div class="clearfix"></div>
<jsp:include page="footer.jsp"/>
<jsp:include page="modal.jsp"/>
</body>
<script src="js/index.js"></script>
<script type="text/javascript">
    //导航定位
    $(".nav li:eq(6) a:first").addClass("navCur");
    $(".content-left ul li").eq(0).css({"background": "#ed6c2c"});
    $(".content-left ul li").eq(0).find("a").css({"color": "#fff", "text-decoration": "none"});
    $(".content-right").css({"display":"block"});
</script>
</html>