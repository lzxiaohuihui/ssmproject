<%--
  Created by IntelliJ IDEA.
  User: 小灰灰
  Date: 2019/11/8
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.lz.entity.Product" %>
<div class="productPage">
    <div class="product">



        <c:forEach  var="product" items="${requestScope.products}" >

            <div class="productUnit">
                <div class="productItem">
                    <a href="item/${product.getPid()}" class="productImage"> <img src="img/item/${product.getPid()*5}.jpg" width="190px" height="190px" alt=""></a>
                    <span class="productPrice">￥${product.getPrice()}</span>
                    <a href="item/${product.getPid()}" class="productDetail" style="height: 33px">${product.getName()}</a>
                    <a href="item/${product.getPid()}" class="productMall">天狗专卖</a>
                    <div class="showProductInfo">
                        <div class="productDealMonth">总销量
                            <span class="productDealMonthNumber">${product.getSales()}笔</span>
                        </div>
                        <div class="productReview">评价
                            <span class="productReviewNumber">${product.getReviews()}</span>
                        </div>
                        <a href="#"><span class="wangwang"><img src="img/site/wangwang.png" alt=""></span></a>
                    </div>
                </div>
            </div>

        </c:forEach>





    </div>
</div>