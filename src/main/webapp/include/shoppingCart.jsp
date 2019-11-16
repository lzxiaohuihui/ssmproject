<%@ page import="com.lz.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="cartDiv">
    <div class="cartTitle pull-right">
        <span>已选商品  (不含运费)</span>
        <span class="cartTitlePrice">￥0.00</span>
        <button class="createOrderButton" style="background-color: rgb(170, 170, 170);" disabled="disabled">结 算</button>
    </div>
    <div class="cartProductList">
        <table class="cartProductTable">
            <thead>
            <tr>
                <th class="selectAndImage">
                    <img src="http://how2j.cn/tmall/img/site/cartNotSelected.png" class="selectAllItem" selectit="false">
                    全选
                </th>
                <th>商品信息</th>
                <th>单价</th>
                <th>数量</th>
                <th width="120px">金额</th>
                <th class="operation">操作</th>
            </tr>
            </thead>
            <tbody>

<c:forEach var="product" items="${requestScope.products}" >

            <tr class="cartProductItemTR" oid="${product.pid}" style="background-color: rgb(255, 255, 255);">
                <td>
                    <img src="http://how2j.cn/tmall/img/site/cartNotSelected.png" class="cartProductItemIfSelected" oiid="${product.pid}" selectit="false" alt="">
                    <a href="#nowhere" style="display:none"><img src="http://how2j.cn/tmall/img/site/cartSelected.png"></a>
                    <img src="img/item/${product.pid*5}.jpg" class="cartProductImg" alt="">
                </td>
                <td>
                    <div class="cartProductLinkOutDiv">
                        <a class="cartProductLink" href="#nowhere">${product.name}</a>
                        <div class="cartProductLinkInnerDiv">
                            <img title="支持信用卡支付" src="http://how2j.cn/tmall/img/site/creditcard.png" alt="">
                            <img title="消费者保障服务,承诺7天退货" src="http://how2j.cn/tmall/img/site/7day.png" alt="">
                            <img title="消费者保障服务,承诺如实描述" src="http://how2j.cn/tmall/img/site/promise.png" alt="1">
                        </div>
                    </div>
                </td>
                <td>
                    <span class="cartProductItemPromotionPrice">￥${product.price}</span>
                </td>
                <td>
                    <div class="cartProductChangeNumberDiv">
                        <span pid="365" class="hidden orderItemStock ">75</span>
                        <span pid="365" class="hidden orderItemPromotePrice ">${product.price}</span>
                        <a href="#nowhere" class="numberMinus" pid="365">-</a>
                        <input value="1" autocomplete="off" class="orderItemNumberSetting" oiid="${product.pid}" pid="365">
                        <a href="#nowhere" class="numberPlus" pid="365" stock="75">+</a>
                    </div>
                </td>
                <td>
                            <span pid="365" oiid="${product.pid}" class="cartProductItemSmallSumPrice">
                            ￥${product.price}
                            </span>
                </td>
                <td>
                    <a href="#nowhere" oiid="${product.pid}" class="deleteOrderItem">删除</a>
                </td>
            </tr>

</c:forEach>
            </tbody>
        </table>
    </div>
    <div class="cartFoot">
        <img src="http://how2j.cn/tmall/img/site/cartNotSelected.png" class="selectAllItem" selectit="false">
        <span>全选</span>
        <!--         <a href="#">删除</a> -->
        <div class="pull-right">
            <span>已选商品 <span class="cartSumNumber">0</span> 件</span>
            <span>合计 (不含运费): </span>
            <span class="cartSumPrice">￥0.00</span>
            <button class="createOrderButton" style="background-color: rgb(170, 170, 170);" disabled="disabled">结  算</button>
        </div>
    </div>
</div>