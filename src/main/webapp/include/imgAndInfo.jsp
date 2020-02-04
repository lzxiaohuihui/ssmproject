
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="simpleSearchOutDiv">
    <a href="index.html">
        <img src="${pageContext.request.contextPath}/img/site/simpleLogo.png" alt="">
    </a>
    <form action="">
        <div class="simpleSearchDiv">
            <input type="text" placeholder="平衡车" value name="keyValue">
            <button class="searchButton" type="submit">搜天狗</button>
            <div class="belowItem">
                <span>我是底下的字</span>
            </div>
        </div>
    </form>
</div>

<div class="categoryPictureInProductPageDiv">
    <img class="categoryPictureInProductPage" src="${pageContext.request.contextPath}/img/item//79.jpg" alt="">
</div>
<div class="itemAndInfo">
    <div class="imgInfoDiv">
        <img width="100px" class="bigImg" src="${pageContext.request.contextPath}/img/item//${product.pid*5}.jpg" alt="">
        <div class="smallImgDiv">
            <img width="56px" class="smallImg" src="${pageContext.request.contextPath}/img/item//${product.pid*5-4}.jpg" alt="">
            <img width="56px" class="smallImg" src="${pageContext.request.contextPath}/img/item//${product.pid*5-3}.jpg" alt="">
            <img width="56px" class="smallImg" src="${pageContext.request.contextPath}/img/item//${product.pid*5-2}.jpg" alt="">
            <img width="56px" class="smallImg" src="${pageContext.request.contextPath}/img/item//${product.pid*5-1}.jpg" alt="">
            <img width="56px" class="smallImg" src="${pageContext.request.contextPath}/img/item//${product.pid*5}.jpg" alt="">
        </div>
    </div>


    <div class="itemInfoDiv">
        <div class="productTitle">${product.name}</div>
        <div class="productPrice">
            <div class="jvhuasuan">
                <span class="jvhuasuanbig">聚划算</span>
                <span>
                        此商品即将参加聚划算，<span class="jvhuasuanTime">1天19小时</span>后开始，
                    </span>
            </div>
            <diV class="productPriceDiv">
                <img src="${pageContext.request.contextPath}/img/site/gouwujuan.png" height="16px" alt="">
                <span>全天猫实物商品通用</span>
<%--                <div class="originalDiv">--%>
<%--                    <span class="originalPriceDesc">价格</span>--%>
<%--                    <span class="originalPriceYuan">￥</span>--%>
<%--                    <span class="originalPrice"><%= item.getOriginalPrice()%></span>--%>

<%--                </div>--%>
                <div class="promotionDiv">
                    <span class="promotionPriceDesc">促销价格</span>
                    <span class="promotionPriceYuan">￥</span>
                    <span class="promotionPrice">${requestScope;product.price}</span>

                </div>
            </div>
        </div>
        <div class="productSaleAndReviewNumber">
            <div>销量 <span class="redColor boldWord"> ${product.getSales()}</span></div>
            <div>累计评价 <span class="redColor boldWord">${product.getReviews()}</span></div>
        </div>
        <div class="productNumber">
            <span>数量</span>
            <span>
				<span class="productNumberSettingSpan">
				<input type="text" value="1" class="productNumberSetting" id="productNumber">
				</span>
				<span class="arrow">
					<a class="increaseNumber" href="#">
					<span class="updown">
					   <img src="${pageContext.request.contextPath}/img/site/increase.png">
					</span>
					</a>
					<span class="updownMiddle"> </span>
					<a class="decreaseNumber" href="#">
					<span class="updown">
					    <img src="${pageContext.request.contextPath}/img/site/decrease.png">
					</span>
					</a>
				</span>
			    件</span>
            <span>库存${product.getStock()}件</span>
        </div>
        <div class="serviceCommitment">
            <span class="serviceCommitmentDesc">服务承诺</span>
            <span class="serviceCommitmentLink">
                    <a href="#nowhere">正品保证</a>
                    <a href="#nowhere">极速退款</a>
                    <a href="#nowhere">赠运费险</a>
                    <a href="#nowhere">七天无理由退换</a>
                </span>
        </div>

        <div class="buyDiv">
            <a href="${pageContext.request.contextPath}/buy/${product.pid}" class="buyLink"><button class="buyButton">立即购买</button></a>
            <a class="addCartLink"><button  id="addCartButton" name="${product.getPid()}" class="addCartButton"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button></a>
        </div>
    </div>
</div>