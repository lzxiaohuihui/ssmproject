<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="payedDiv">
	<div class="payedTextDiv">
		<img src="${pageContext.request.contextPath}/img/site/paySuccess.png">
		<span>您已成功付款</span> 
		
	</div>
	<div class="payedAddressInfo">
		<ul>
			<li>收货地址：</li>
			<li>实付款：<span class="payedInfoPrice">
			￥${requestScope.total}
			</li>
			<li>预计不会送达	</li>
		</ul>
				
		<div class="paedCheckLinkDiv">
			您可以
			<a class="payedCheckLink" href="${pageContext.request.contextPath}/order">查看已买到的宝贝</a>
			<a class="payedCheckLink" href="">查看交易详情 </a>
		</div>
			
	</div>
	
	<div class="payedSeperateLine">
	</div>
	
	<div class="warningDiv">
		<img src="${pageContext.request.contextPath}/img/site/warning.png">
		<b>安全提醒：</b>下单后，<span class="redColor boldWord">用QQ给您发送链接办理退款的都是骗子！</span>天猫不存在系统升级，订单异常等问题，谨防假冒客服电话诈骗！
	</div>
	

</div>