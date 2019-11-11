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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/item.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <title>${product.name}</title>

</head>
<body style="width: 1400px">
    <%@include file="include/top.jsp"%>
    <%@include file="include/imgAndInfo.jsp"%>
    <%@include file="include/footer.jsp"%>
</body>
</html>
