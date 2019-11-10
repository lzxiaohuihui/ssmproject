<%--
  Created by IntelliJ IDEA.
  User: 小灰灰
  Date: 2019/11/8
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="categoryPageDiv">
    <div class="categorySortBar">
        <%--    <table class="categorySortBarTable categorySortTable">--%>
        <%--      <tbody><tr>--%>
        <%--        <td class="grayColumn"><a href="#nowhere">综合<span class="glyphicon glyphicon-arrow-down"></span></a></td>--%>
        <%--        <td><a href="#nowhere">人气<span class="glyphicon glyphicon-arrow-down"></span></a></td>--%>
        <%--        <td><a href="#nowhere">新品<span class="glyphicon glyphicon-arrow-down"></span></a></td>--%>
        <%--        <td><a href="#nowhere">销量<span class="glyphicon glyphicon-arrow-down"></span></a></td>--%>
        <%--        <td><a href="#nowhere">价格<span class="glyphicon glyphicon-resize-vertical"></span></a></td>--%>
        <%--      </tr>--%>
        <%--      </tbody></table>--%>
        <table class="categorySortBarTable">
            <tbody><tr>
                <td><input type="text" placeholder="最低价" class="sortBarPrice beginPrice"></td>
                <td class="grayColumn priceMiddleColumn">-</td>
                <td><input type="text" placeholder="最高价" class="sortBarPrice endPrice"></td>
            </tr>
            </tbody></table>
    </div>
</div>