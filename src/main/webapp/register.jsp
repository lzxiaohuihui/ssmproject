<%--
  Created by IntelliJ IDEA.
  User: 小灰灰
  Date: 2019/9/27
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <title>注册天狗</title>

    <link rel="stylesheet" href="css/register.css"/>
    <script>
        $(document).ready(function(){

            $("#userName").keyup(function(){
                var username = $("#userName").val();
                $.post(
                    "checkName",
                    {"username":username},
                    function (result) {
                        if (result=="1")
                            $("#tip").text("可以使用");
                        else {
                            $("#tip").text("不可以使用");
                        }
                    }
                );
            });
        });

    </script>
</head>
<body background="img/bg/物语%20-%201.jpg">

    <div class="login">
        <div class="title">注册会员</div>
        <form action="registerPage" method="POST">
            <div id="tip">请输入名称</div>
            <div>会员名：<input class="form-control" autocomplete="off" type="text" name="username" id="userName"></div>

            <div>登陆密码：<input class="form-control" type="password" name="pwd" id="userPwd"></div>

            <input class="btn btn-block"  type="submit" id="sub" value="注册">
        </form>

    </div>
</body>
</html>