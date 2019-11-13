
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <script>
        $(function(){
            $("img.smallImg").mouseenter(function(){
                var bigImageURL = $(this).attr("src");
                $("img.bigImg").attr("src",bigImageURL);
            });
        });
        $(function(){
            var stock = 66;
            $(".productNumberSetting").keyup(function(){
                var num= $(".productNumberSetting").val();
                num = parseInt(num);
                if(isNaN(num))
                    num= 1;
                if(num<=0)
                    num = 1;
                if(num>stock)
                    num = stock;
                $(".productNumberSetting").val(num);
            });

            $(".increaseNumber").click(function(){
                var num= $(".productNumberSetting").val();
                num++;
                if(num>stock)
                    num = stock;
                $(".productNumberSetting").val(num);
            });
            $(".decreaseNumber").click(function(){
                var num= $(".productNumberSetting").val();
                --num;
                if(num<=0)
                    num=1;
                $(".productNumberSetting").val(num);
            });

        });
    </script>



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
            <div>销量 <span class="redColor boldWord"> 50</span></div>
            <div>累计评价 <span class="redColor boldWord"> 19</span></div>
        </div>
        <div class="productNumber">
            <span>数量</span>
            <span>
				<span class="productNumberSettingSpan">
				<input type="text" value="1" class="productNumberSetting">
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
            <span>库存66件</span>
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
            <a href="buy/${product.pid}" class="buyLink"><button class="buyButton">立即购买</button></a>
            <a class="addCartLink" href="addCart/${product.pid}"><button class="addCartButton"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button></a>
        </div>
    </div>
</div>