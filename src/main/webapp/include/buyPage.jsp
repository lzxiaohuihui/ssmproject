<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="buyPageDiv">
  <form action="${pageContext.request.contextPath}/forecreateOrder" method="post">

	<div class="buyFlow">
		<img class="pull-left" src="${pageContext.request.contextPath}/img/site/simpleLogo.png">
		<img class="pull-right" src="${pageContext.request.contextPath}/img/site/buyflow.png">
		<div style="clear:both"></div>
	</div>
	<div class="address">
		<div class="addressTip">输入收货地址</div>
		<div>
			<table class="addressTable">
				<tr>
					<td class="firstColumn">详细地址<span class="redStar">*</span></td>

					<td><textarea name="address" placeholder="建议您如实填写详细收货地址，例如接到名称，门牌号码，楼层和房间号等信息"></textarea></td>
				</tr>
				<tr>
					<td>邮政编码</td>
					<td><input  name="post" placeholder="如果您不清楚邮递区号，请填写000000" type="text"></td>
				</tr>
				<tr>
					<td>收货人姓名<span class="redStar">*</span></td>
					<td><input  name="receiver"  placeholder="长度不超过25个字符" type="text"></td>
				</tr>
				<tr>
					<td>手机号码 <span class="redStar">*</span></td>
					<td><input name="mobile"  placeholder="请输入11位手机号码" type="number"></td>
				</tr>
			</table>

		</div>








	</div>
	<div class="productList">
		<div class="productListTip">确认订单信息</div>


		<table class="productListTable">
			<thead>
				<tr>
					<th colspan="2" class="productListTableFirstColumn">
						<img class="tmallbuy" src="${pageContext.request.contextPath}/img/site/tmallbuy.png">
						<a class="marketLink" href="#nowhere">店铺：天猫店铺</a>
						<a class="wangwanglink" href="#nowhere"> <span class="wangwangGif"></span> </a>
					</th>
					<th>单价</th>
					<th>数量</th>
					<th>小计</th>
					<th>配送方式</th>
				</tr>
				<tr class="rowborder">
					<td  colspan="2" ></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</thead>
			<tbody class="productListTableTbody">

				<c:forEach var="i" begin="0" end="${products.size()-1}" >
					<tr class="orderItemTR">
						<td class="orderItemFirstTD"><img class="orderItemImg" src="${pageContext.request.contextPath}/img/item/${(products.get(i)).pid*5}.jpg"></td>
						<td class="orderItemProductInfo" >

						<a href="${pageContext.request.contextPath}/item/${(products.get(i)).pid}" class="orderItemProductLink">
							${(products.get(i)).name}
						</a>

						<img src="${pageContext.request.contextPath}/img/site/creditcard.png" title="支持信用卡支付">
						<img src="${pageContext.request.contextPath}/img/site/7day.png" title="消费者保障服务,承诺7天退货">
						<img src="${pageContext.request.contextPath}/img/site/promise.png" title="消费者保障服务,承诺如实描述">

						</td>
						<td>

						<span class="orderItemProductPrice">￥${(products.get(i)).price}</span>
						</td>
						<td>
						<span class="orderItemProductNumber">${nums[i]}</span>
						</td>
						<td><span class="orderItemUnitSum">￥${((products.get(i)).price) * Integer.parseInt(nums[i])}</span></td>
						<td rowspan="1"  class="orderItemLastTD">
							<label class="orderItemDeliveryLabel">
								<input type="radio" value="" checked="checked">
								普通配送
							</label>

						<select class="orderItemDeliverySelect" class="form-control">
							<option>快递 免邮费</option>
						</select>

						</td>

					</tr>
				</c:forEach>

			</tbody>

		</table>
		<div class="orderItemSumDiv">
			<div class="pull-left">
				<span class="leaveMessageText">给卖家留言:</span>
				<span>
					<img class="leaveMessageImg" src="${pageContext.request.contextPath}/img/site/leaveMessage.png">
				</span>
				<span class="leaveMessageTextareaSpan">
					<textarea name="userMessage" class="leaveMessageTextarea" placeholder="尽管你写，我理你算我输!"></textarea>
					<div>
						<span>还可以输入200个字符</span>
					</div>
				</span>
			</div>

			<span class="pull-right storePrice">店铺合计(含运费): 加载中...</span>
		</div>

	</div>

	<div class="orderItemTotalSumDiv">
		<div class="pull-right">
			<span>实付款：</span>
			<label class="orderItemTotalSumSpan">加载中...</label>
		</div>
	</div>

	<div class="submitOrderDiv">
			<button type="submit" class="submitOrderButton">提交订单</button>
	</div>
  </form>
</div>