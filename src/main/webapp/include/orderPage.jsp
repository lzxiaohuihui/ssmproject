
<%@ page import="com.lz.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="boughtDiv">
    <div class="orderType">
        <div class="selectedOrderType"><a href="#nowhere" orderstatus="all">所有订单</a></div>
        <div class=""><a href="#nowhere" orderstatus="waitPay">待付款</a></div>
        <div class=""><a href="#nowhere" orderstatus="waitDelivery">待发货</a></div>
        <div class=""><a href="#nowhere" orderstatus="waitConfirm">待收货</a></div>
        <div class=""><a class="noRightborder" href="#nowhere" orderstatus="waitReview">待评价</a></div>
        <div class="orderTypeLastOne"><a class="noRightborder"> </a></div>
    </div>
    <div style="clear:both"></div>
    <div class="orderListTitle">
        <table class="orderListTitleTable">
            <tbody><tr>
                <td>宝贝</td>
                <td width="100px">单价</td>
                <td width="100px">数量</td>
                <td width="120px">实付款</td>
                <td width="100px">交易操作</td>
            </tr>
            </tbody></table>
    </div>
    <div class="orderListItem">


<c:forEach var="i" begin="0" end="${requestScope;orders.size()-1}" >

        <table oid="${requestScope;(orders.get(orders.size()-1-i)).oid}" orderstatus=<c:choose>
        <c:when test="${(orders.get(orders.size()-1-i)).status == 0}">waitPay</c:when>
        <c:when test="${(orders.get(orders.size()-1-i)).status == 1}">waitDelivery</c:when>
        <c:when test="${(orders.get(orders.size()-1-i)).status == 2}">waitConfirm</c:when>
        <c:when test="${(orders.get(orders.size()-1-i)).status == 3}">waitReview</c:when>
        <c:otherwise>other</c:otherwise>
        </c:choose> class="orderListItemTable" style="display: table;">
            <tbody><tr class="orderListItemFirstTR">
                <td colspan="2">
                    <b>${requestScope;(orders.get(orders.size()-1-i)).getDate()}</b>
                    <span>${requestScope;(orders.get(orders.size()-1-i)).getNo()}
					</span>
                </td>

                <td colspan="2"><img width="13px" src="http://how2j.cn/tmall/img/site/orderItemTmall.png">天猫商场</td>
                <td colspan="1">
                    <a href="#nowhere" class="wangwanglink">
                        <div class="orderItemWangWangGif"></div>
                    </a>
                </td>

                <td class="orderItemDeleteTD">
                    <a href="#nowhere" oid="${requestScope;(orders.get(orders.size()-1-i)).getOid()}" class="deleteOrderLink">
                        <span class="orderListItemDelete glyphicon glyphicon-trash"></span>
                    </a>
                </td>
            </tr>


            <c:forEach var="orderItem" items="${requestScope;orderItems.get(orders.size()-1-i)}">
            <tr class="orderItemProductInfoPartTR">
                <td class="orderItemProductInfoPartTD"><img width="80" height="80" src="${pageContext.request.contextPath}/img/item/${(orderItem.product.pid)*5}.jpg"></td>
                <td class="orderItemProductInfoPartTD">
                    <div class="orderListItemProductLinkOutDiv">
                        <a href="${pageContext.request.contextPath}/item/${orderItem.product.pid}">${orderItem.product.name}</a>
                        <div class="orderListItemProductLinkInnerDiv">
                            <img title="支持信用卡支付" src="http://how2j.cn/tmall/img/site/creditcard.png">
                            <img title="消费者保障服务,承诺7天退货" src="http://how2j.cn/tmall/img/site/7day.png">
                            <img title="消费者保障服务,承诺如实描述" src="http://how2j.cn/tmall/img/site/promise.png">
                        </div>
                    </div>
                </td>
                <td width="100px" class="orderItemProductInfoPartTD">
                    <div class="orderListItemProductPrice">￥${orderItem.product.price}</div>
                </td>


                <td width="100px" valign="top" class="orderListItemNumberTD orderItemOrderInfoPartTD" rowspan="1">
                    <span class="orderListItemNumber">${orderItem.quantity}</span>
                </td>
                <td width="120px" valign="top" class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD" rowspan="${orderItems.size()}">
                    <div class="orderListItemProductRealPrice">￥${orderItem.quantity * orderItem.product.price}</div>
                    <div class="orderListItemPriceWithTransport">(含运费：￥0.00)</div>
                </td>
                <td width="100px" valign="top" class="orderListItemButtonTD orderItemOrderInfoPartTD" rowspan="${orderItems.size()}">
                    <c:choose>
                        <c:when test="${(orders.get(orders.size()-1-i)).status == 0}">
                            <a href="#nowhere">
                                <button class="orderItemStatus orderListItemPay">去付款</button>
                            </a>
                        </c:when>
                        <c:when test="${(orders.get(orders.size()-1-i)).status == 1}">
                            <a href="#nowhere">
                                <button class="orderItemStatus orderListItemSend">催发货</button>
                            </a>
                        </c:when>
                        <c:when test="${(orders.get(orders.size()-1-i)).status == 2}">
                            <a href="#nowhere">
                                <button class="orderItemStatus orderListItemReceive">确认收货</button>
                            </a>
                        </c:when>
                        <c:when test="${(orders.get(orders.size()-1-i)).status == 3}">
                            <a href="#nowhere">
                                <button class="orderItemStatus orderListItemReview">评价</button>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="#nowhere">
                            </a>
                        </c:otherwise>
                    </c:choose>

                </td>
            </tr>
            </c:forEach>
            </tbody></table>
    </c:forEach>
    </div>
</div>
