<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="aliPayPageDiv">
	<div class="aliPayPageLogo">
		<img class="pull-left" src="${pageContext.request.contextPath}/img/site/simpleLogo.png">
		<div style="clear:both"></div>
	</div>
	
	<div>
		<span class="confirmMoneyText">扫一扫付款（元）</span>
		<span class="confirmMoney">
		￥${total}</span>
		
	</div>
	<div>
		<img class="aliPayImg" width="195px" height="296px" src="${pageContext.request.contextPath}/img/site/myalipay.jpg">
	</div>

	
	<div>
		<a href="${pageContext.request.contextPath}/payed/"><button class="confirmPay">确认支付</button></a>
	</div>

</div>