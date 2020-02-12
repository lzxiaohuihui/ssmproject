<%--
  Created by IntelliJ IDEA.
  User: 小灰灰
  Date: 2019/11/11
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/item.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/javascript.js"></script>
    <title>${product.name}</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/ico/favicon.ico" mce_href="${pageContext.request.contextPath}/img/ico/favicon.ico" type="image/x-icon" />

</head>
<body style="min-width: 1400px">
    <%@include file="include/top.jsp"%>
    <%@include file="include/imgAndInfo.jsp"%>
    <%@include file="include/productReview.jsp"%>
    <%@include file="include/footer.jsp"%>
</body>
</html>
