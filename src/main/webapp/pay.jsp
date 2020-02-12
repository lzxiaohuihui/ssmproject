<%--
  Created by IntelliJ IDEA.
  User: 小灰灰
  Date: 2019/11/16
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <title>支付页面</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/ico/favicon.ico" mce_href="${pageContext.request.contextPath}/img/ico/favicon.ico" type="image/x-icon" />
    <style>

        div.aliPayPageLogo {
            margin: 20px;
        }

        div.aliPayPageDiv {
            text-align: center;
            padding-bottom: 40px;
            max-width: 1013px;
            margin: 10px auto;
        }

        span.confirmMoneyText {
            color: #4D4D4D;
        }

        span.confirmMoney {
            display: block;
            color: #FF6600;
            font-weight: bold;
            font-size: 20px;
            margin: 10px;
        }

        img.aliPayImg {
            /* 	width:230px; */
            /* 	height:230px;	 */

        }

        button.confirmPay {
            background-color: #00AAEE;
            border: 1px solid #00AAEE;
            text-align: center;
            line-height: 31px;
            font-size: 14px;
            font-weight: 700;
            color: white;
            width: 107px;
            margin-top: 20px;
        }

    </style>
</head>
<body>

    <%@include file="/include/top.jsp"%>
    <%@include file="/include/alipayPage.jsp"%>
    <%@include file="/include/footer.jsp"%>

</body>
</html>
