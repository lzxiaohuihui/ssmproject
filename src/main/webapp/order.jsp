<%--
  Created by IntelliJ IDEA.
  User: 小灰灰
  Date: 2019/11/15
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <title>我的订单</title>
</head>
<body>
    <%@include file="include/top.jsp"%>
    <%@include file="include/orderPage.jsp"%>
    <%@include file="include/footer.jsp"%>
</body>
</html>
