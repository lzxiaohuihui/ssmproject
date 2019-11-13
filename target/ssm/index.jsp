<%--
  Created by IntelliJ IDEA.
  User: 小灰灰
  Date: 2019/9/26
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <script src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>

  <link rel="stylesheet" href="css/style.css">
  <script src="js/javascript.js"></script>


  <title>天狗</title>
</head>
<body>
<%@include file="/include/top.jsp"%>

<%@include file="/include/searchDiv.jsp"%>

<%--<%@include file="include/categoryPageDiv.jsp"%>--%>

<%@include file="/include/productPage.jsp"%>

<%@include file="/include/footer.jsp"%>


</body>
</html>