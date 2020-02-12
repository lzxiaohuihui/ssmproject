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
    <script src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <title>注册天狗</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/ico/favicon.ico" mce_href="${pageContext.request.contextPath}/img/ico/favicon.ico" type="image/x-icon" />
    <script src="${pageContext.request.contextPath}/js/javascript.js"></script>
    <link rel="stylesheet" href="css/register.css"/>
</head>
<body background="img/bg/物语%20-%201.jpg">

    <div class="login">
        <div class="title">注册会员</div>
        <form action="registerPage" method="POST">
            <div id="tip">请输入名称</div>
            <div>会员名：<input class="form-control" autocomplete="off" type="text" name="username" id="userName" placeholder="会员名必须以字母开头，长度在三位以上"></div>

            <div>登陆密码：<input class="form-control" type="password" name="pwd" id="userPwd" placeholder="密码必须以字母开头，长度在六位以上"></div>

            <input class="btn btn-block" disabled type="submit" id="sub" value="注册">
        </form>

    </div>
</body>
</html>