<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="productReviewDiv" >
	<div class="productReviewTopPart">
		<a  href="#nowhere" class="selected">累计评价 <span class="productReviewTopReviewLinkNumber">${requestScope.product}</span> </a>
	</div>
	
		
	<div class="productReviewContentPart">
		<div class="productReviewItem">
		<c:forEach var="product" items="#{requestScope.product}">

			<div class="productReviewItemDesc">
				<div class="productReviewItemContent">
					阿维格法尔发色如隔热隔热隔热威威
				</div>
				<div class="productReviewItemDate">201900000</div>
			</div>
			<div class="productReviewItemUserInfo">
			
				asdfasdfasdf<span class="userInfoGrayPart"></span>
			</div>
			
			<div style="clear:both"></div>
		</c:forEach>
		</div>
	</div>

</div>
