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
                    <a href="order.jsp">我的订单</a>
                    <a href="shoppingCart.jsp">
                    <span class=" glyphicon glyphicon-shopping-cart redColor" ></span>
                    购物车<strong>0</strong>件</a>
                </span>
</nav>

<script>
    $(document).ready(function(){
        $("#forelogout").click(function(){
            //通过ajax请求springmvc
            $.post(
                "forelogout",//服务器地址
                function(result){//服务端处理完毕后的回调函数 List<Student> students， 加上@ResponseBody后， students实质是一个json数组的格式
                    alert("bye~");
                }
            );
        });

    });

</script>
