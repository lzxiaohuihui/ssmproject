<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="productReviewDiv" >
	<div class="productReviewTopPart">
		<a  href="#nowhere" class="selected">累计评价 <span class="productReviewTopReviewLinkNumber">${requestScope.reviews.size()}</span> </a>
	</div>
	
		
	<div class="productReviewContentPart">
		<div class="productReviewItem">
		<c:forEach var="review" items="${requestScope.reviews}" >

			<div class="productReviewItemDesc">
				<div class="productReviewItemContent">
					${review.content}
				</div>
				<div class="productReviewItemDate">${review.date}</div>
			</div>
			<div class="productReviewItemUserInfo">
			
				${review.username}<span class="userInfoGrayPart"></span>
			</div>
			
			<div style="clear:both"></div>
		</c:forEach>
		</div>
	</div>

</div>
