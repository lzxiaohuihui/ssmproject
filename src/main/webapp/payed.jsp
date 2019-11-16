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
	<style>

		div.payedDiv {
			border: 1px solid #D4D4D4;
			max-width: 1013px;
			margin: 10px auto 20px auto;
		}

		div.payedTextDiv {
			height: 61px;
			background-color: #ECFFDC;
			padding: 17px 0px 0px 25px;
		}

		div.payedTextDiv span {
			font-weight: bold;
			font-size: 14px;
			margin-left: 10px;
		}

		div.payedAddressInfo {
			padding: 26px 35px;
		}

		div.payedAddressInfo li {
			background-image: url("../../img/site/li_dot.png");
			background-repeat: no-repeat;
			background-color: transparent;
			background-attachment: scroll;
			background-position: 0px 13px;
			list-style-type: none;
			color: #333333;
			padding-left: 15px;
			padding-top: 5px;
			/* 	background: rgba(0, 0, 0, 0) url("../../img/site/li_dot.png") no-repeat scroll 0 13px; */
		}

		span.payedInfoPrice {
			color: #B10000;
			font-weight: bold;
			font-size: 14px;
			font-family: arial;
		}

		a.payedCheckLink {
			color: #2D8CBA;
		}

		a.payedCheckLink:hover {
			color: #2D8CBA;
			text-decoration: underline;
		}

		div.paedCheckLinkDiv {
			margin-left: 38px;
		}

		div.payedSeperateLine {
			border-top: 1px dotted #D4D4D4;
			margin: 0px 31px;
		}

		div.warningDiv {
			margin: 23px 45px;
		}

		div.warningDiv {
			color: black;
		}

	</style>
</head>
<body>

<%@include file="/include/top.jsp"%>
<%@include file="/include/payedPage.jsp"%>
<%@include file="/include/footer.jsp"%>

</body>
</html>