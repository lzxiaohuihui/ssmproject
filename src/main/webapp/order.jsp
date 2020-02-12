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
<%--    <script src="${pageContext.request.contextPath}/js/jquery/3.4.1/jquery-3.4.1.min.js"></script>--%>
    <script
            src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/javascript.js"></script>
    <title>我的订单</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/ico/favicon.ico" mce_href="${pageContext.request.contextPath}/img/ico/favicon.ico" type="image/x-icon" />
</head>
<body>
    <%@include file="include/top.jsp"%>
    <%@include file="include/orderPage.jsp"%>
    <%@include file="include/footer.jsp"%>
</body>
</html>
