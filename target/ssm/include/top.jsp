<%--
  Created by IntelliJ IDEA.
  User: 小灰灰
  Date: 2019/11/8
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<nav class="top ">
    <a href="${pageContext.request.contextPath}/index">
        <span class="glyphicon glyphicon-home redColor"></span>
        天狗首页
    </a>

    <span>喵，欢迎来天狗</span>

    <c:if test="${sessionScope;!empty user}">
        <a href="${pageContext.request.contextPath}/loginPage">${user.username}</a>
        <a href="#" id="forelogout">退出</a>
    </c:if>

    <c:if test="${sessionScope;empty user}">
        <a href="${pageContext.request.contextPath}/loginPage">请登录</a>
        <a href="${pageContext.request.contextPath}/register">免费注册</a>
    </c:if>


    <span class="pull-right">
                    <a href="${pageContext.request.contextPath}/order">我的订单</a>
                    <a href="${pageContext.request.contextPath}/cart">
                    <span class=" glyphicon glyphicon-shopping-cart redColor" ></span>
                    购物车<strong id="cartSize">
                        <c:choose>
                            <c:when test="${empty user}">0</c:when>
                            <c:when test="${!empty user}">${sessionScope;cart.size()}</c:when>
                        </c:choose>
                    </strong>件</a>
                </span>
</nav>


