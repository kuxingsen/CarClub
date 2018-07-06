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
    function memberAdd()
    {
        var member={
            "memberId":$("#MemberId").val(),
            "memberName":$("#MemberName").val(),
            "memberCard":$("#MemberCard").val(),
            "memberPhone":$("#MemberPhone").val(),
            "memberEmail":$("#MemberEmail").val()
        }
         //alert("sure");
        $.ajax({
            url:("member/add"),
            data:member,
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“提交成功”
            success:function(data){
                alert("添加成功");
                window.location.href="member";
            },
            error:function(e){

            }
        });
    }



    //旅行服务 点击删除按钮事件
    function memberDelete(id)
    {
        //alert("delete");
        $.ajax({
            url:("member/delete/"+id),
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“删除成功”
            success:function(data){
               // alert("删除成功");
                window.location.href="member";
            },
            error:function(e){
                alert("删除失败");
            }
        });
    }

    //旅行服务 点击删除全部按钮事件
    function memberDelAll()
    {
        //lert("delAll");
        $.ajax({
            url:(""),
            type:"post",
            dataType:"text",
            //添加成功后返回一个文本：“删除成功”
            success:function(data){
               // alert("删除成功");
            },
            error:function(e){
                alert("删除失败");
            }
        });
    }
    //旅行服务 点击修改按钮事件
    function memberModify(id)
    {
       // alert("modify");
        $.ajax({
            url:("member/"+id),
            type:"post",
            dataType:"json",
            success:function(data){
                $("#MemberId2").val(data.memberId);
                $("#MemberName2").val(data.memberName);
                $("#MemberCard2").val(data.memberCard);
                $("#MemberPhone2").val(data.memberPhone);
                $("#MemberEmail2").val(data.memberEmail);
            },
            error:function(e){

            }
        });
    }
    /**
     * 数据库修改成功，但弹出失败提示
     */
    //旅行服务 模态框点击修改按钮事件
    function memberModify2()
    {
        var member={
            "memberId":$("#MemberId2").val(),
            "memberName":$("#MemberName2").val(),
            "memberCard":$("#MemberCard2").val(),
            "memberPhone":$("#MemberPhone2").val(),
            "memberEmail":$("#MemberEmail2").val()
        };
        //alert("modify")
        $.ajax({
            url:("member/modify"),
            data:member,
            type:"post",
            dataType:"text",
            success:function(data){
                alert("修改成功");
                window.location.href="member";
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
            <h2 class="left-title">会员管理</h2>
            <ul class="leftNav">
                <li><a href="javascript:">会员管理</a></li>
            </ul>
        </div>

        <div class="content-right">
            <h2 class="right-title">会员信息</h2>
            <table class="table  table-responsive table-hover myTable">
                <tbody>
                <tr class="active">
                    <th>会员编号</th>
                    <th>姓名</th>
                    <th>身份证</th>
                    <th>电话</th>
                    <th>Email</th>
                    <th>&nbsp;修改&nbsp;</th>
                    <th>&nbsp;删除&nbsp;</th>
                </tr>
                <c:forEach items="${memberList}" var="member">
                    <tr>
                        <td>${member.memberId}</td>
                        <td>${member.memberName}</td>
                        <td>${member.memberCard}</td>
                        <td>${member.memberPhone}</td>
                        <td>${member.memberEmail}</td>
                        <td><button type="button" class="btn btn-xs btn-warning" onclick="memberModify('${member.memberId}')" data-toggle="modal" data-target="#MyMemberModify">修改</button></td>
                        <td><button type="button" class="btn btn-xs btn-danger memberDelete " onclick="memberDelete('${member.memberId}')">删除</button></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table><br/><br/>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#MyMemberAdd">添加</button>
            <button type="button" id="memberDelAll" class="btn btn-danger" onclick="memberDelAll()">全部删除</button>
        </div>
    </div>
</div>
<!--模态框-->

<!-- 会员  添加按钮模态框 -->
<div class="modal fade in" id="MyMemberAdd">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="close" data-dismiss="modal">×</div>
                <h3 class="modal-title">添加会员</h3>
            </div>
            <div class="modal-body">
                <form action="" method="post" class="travel">
                    <div class="form-group">
                        <label for="MemberId" class="control-label">会员编号:</label>
                        <input type="text" class="form-control" name="MemberId" id="MemberId" required="">
                    </div>
                    <div class="form-group">
                        <label for="MemberName" class="control-label">姓名:</label>
                        <input type="text" class="form-control" name="MemberName" id="MemberName" required="">
                    </div>
                    <div class="form-group">
                        <label for="MemberCard" class="control-label">身份证:</label>
                        <input type="text" class="form-control" name="MemberCard" id="MemberCard" required="">
                    </div>
                    <div class="form-group">
                        <label for="MemberPhone" class="control-label">电话:</label>
                        <input type="text" class="form-control" name="MemberPhone" id="MemberPhone" required="">
                    </div>
                    <div class="form-group">
                        <label for="MemberEmail" class="control-label">Email:</label>
                        <input type="text" class="form-control" name="MemberEmail" id="MemberEmail" required="">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="memberAdd" class="btn btn-primary" onclick="memberAdd()">确认</button>
                <button type="button" class="btn btn-danger " data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- 会员  修改按钮模态框 -->
<div class="modal fade in" id="MyMemberModify">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="close" data-dismiss="modal">×</div>
                <h3 class="modal-title">修改会员信息</h3>
            </div>
            <div class="modal-body">
                <form action="" method="post" class="travel">
                    <div class="form-group">
                        <label for="MemberId2" class="control-label">会员编号:</label>
                        <input type="text" class="form-control" name="MemberId2" id="MemberId2" required="" disabled>
                    </div>
                    <div class="form-group">
                        <label for="MemberName2" class="control-label">姓名:</label>
                        <input type="text" class="form-control" name="MemberName2" id="MemberName2" required="">
                    </div>
                    <div class="form-group">
                        <label for="MemberCard2" class="control-label">身份证:</label>
                        <input type="text" class="form-control" name="MemberCard2" id="MemberCard2" required="">
                    </div>
                    <div class="form-group">
                        <label for="MemberPhone2" class="control-label">电话:</label>
                        <input type="text" class="form-control" name="MemberPhone2" id="MemberPhone2" required="">
                    </div>
                    <div class="form-group">
                        <label for="MemberEmail2" class="control-label">Email:</label>
                        <input type="text" class="form-control" name="MemberEmail2" id="MemberEmail2" required="">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="travelModify" class="btn btn-primary" onclick="memberModify2()">修改</button>
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
        $(".nav li:eq(5) a:first").addClass("navCur");
        $(".content-left ul li").eq(0).css({"background": "#ed6c2c"});
        $(".content-left ul li").eq(0).find("a").css({"color": "#fff", "text-decoration": "none"});
        $(".content-right").css({"display":"block"});
</script>
</html>