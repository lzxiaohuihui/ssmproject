
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


<c:forEach var="product" items="${requestScope.products}" >

        <table oid="946" orderstatus="waitReview" class="orderListItemTable" style="display: table;">
            <tbody><tr class="orderListItemFirstTR">
                <td colspan="2">
                    <b>2016-09-12 17:00:41</b>
                    <span>订单号: 20160912170041674794
					</span>
                </td>
                <td colspan="2"><img width="13px" src="http://how2j.cn/tmall/img/site/orderItemTmall.png">天猫商场</td>
                <td colspan="1">
                    <a href="#nowhere" class="wangwanglink">
                        <div class="orderItemWangWangGif"></div>
                    </a>
                </td>
                <td class="orderItemDeleteTD">
                    <a href="#nowhere" oid="${product.pid}" class="deleteOrderLink">
                        <span class="orderListItemDelete glyphicon glyphicon-trash"></span>
                    </a>
                </td>
            </tr>
            <tr class="orderItemProductInfoPartTR">
                <td class="orderItemProductInfoPartTD"><img width="80" height="80" src="img/item/${product.pid*5}.jpg"></td>
                <td class="orderItemProductInfoPartTD">
                    <div class="orderListItemProductLinkOutDiv">
                        <a href="${pageContext.request.contextPath}/item/${product.pid}">${product.name}</a>
                        <div class="orderListItemProductLinkInnerDiv">
                            <img title="支持信用卡支付" src="http://how2j.cn/tmall/img/site/creditcard.png">
                            <img title="消费者保障服务,承诺7天退货" src="http://how2j.cn/tmall/img/site/7day.png">
                            <img title="消费者保障服务,承诺如实描述" src="http://how2j.cn/tmall/img/site/promise.png">
                        </div>
                    </div>
                </td>
                <td width="100px" class="orderItemProductInfoPartTD">
                    <div class="orderListItemProductPrice">￥${product.price}</div>
                </td>
                <td width="100px" valign="top" class="orderListItemNumberTD orderItemOrderInfoPartTD" rowspan="1">
                    <span class="orderListItemNumber">1</span>
                </td>
                <td width="120px" valign="top" class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD" rowspan="1">
                    <div class="orderListItemProductRealPrice">￥${product.price}</div>
                    <div class="orderListItemPriceWithTransport">(含运费：￥0.00)</div>
                </td>
                <td width="100px" valign="top" class="orderListItemButtonTD orderItemOrderInfoPartTD" rowspan="1">
                    <a href="#nowhere">
                        <button class="orderListItemReview">评价</button>
                    </a>
                </td>
            </tr>
            </tbody></table>
    </c:forEach>
    </div>
</div>
