 Created by IntelliJ IDEA.
  User: 小灰灰
  Date: 2019/10/3
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <style>

        .simpleSearchOutDiv{
            margin: 10px 250px 10px 250px;
            height: 50px;
        }
        .simpleSearchOutDiv a{
            float: left;
        }
        .simpleSearchDiv{
            background-color: #c40000;
            float: right;
        }

        .simpleSearchDiv input{
            margin: 1px;
        }
        .simpleSearchDiv button{
            left: 2px;
            font-weight: bold;
            border: none;
            background-color: #c40000;
            border: 1px solid transparent;
            color: white;
        }
        .belowItem{
            background-color: white;
        }
        .belowItem span{
            font-size: 10px;
            color: #999;
        }

        .categoryPictureInProductPageDiv{
            margin: 40px 250px 10px 250px;
        }

        .itemAndInfo{
            margin: 40px 250px 10px 250px;
            float: left;
        }
        .imgInfoDiv{
            width: 400px;
            float: left;

        }
        div.imgInfoDiv img.bigImg{
            width: 358px;
            padding: 20px;
            border: 1px solid #e7e7e7;
        }
        .smallImgDiv{
            padding: 20px;
        }
        .smallImg{
            width: 60px;
            height: 60px;
            border: 2px solid white;
        }
        .smallImg:hover{
            border: 1px solid black;
        }

        .itemInfoDiv{
            float: left;
            overflow: hidden;
            width: 450px;
            padding: 0px 20px ;
        }
        .productTitle{
            font-size: 16px;
            color: black;
            margin: 0px 10px ;
            font-weight: bold;
        }
        .jvhuasuan{
            background-color: #2DA77A;
            color: white;
            text-align: center;
            font-size: 12px;
            line-height: 40px;
            margin-top: 10px;
        }
        .jvhuasuanbig{
            font-size: 16px;
            font-weight: bold;

        }
        .jvhuasuanTime{
            color: #FFC057;
            font-weight: bold;
        }
        .productPriceDiv{
            background-image:url(img/site/priceBackground.png);
            height: 102px;
            padding: 10px;
            color: #666666;
        }
        .gouwujuanDiv{
            margin-top: 5px;
        }
        .originalPriceDesc{
            color: #999999;
            display: inline-block;
            width: 68px;
        }
        div.originalDiv{
            margin-top: 5px;
        }
        .originalPrice{
            font-family: Arial;
            font-size: 12px;
            color: #333333;
            text-decoration: line-through;
        }
        .promotionPriceYuan{
            font-family: Arial;
            font-size: 18px;
            color: #C40000;
        }
        .promotionPrice{
            color: #c40000;
            font-family: Arial;
            font-size: 30px;
            font-weight: bold;
        }
        .promotionPriceDesc{
            color: #999999;
            display: inline-block;
            width: 68px;
            position: relative;
            left: 0px;
            top: -10px;
        }
        .productSaleAndReviewNumber{
            margin: 20px 0px;
            border-top-style: dotted;
            border-top-color: #C9C9C9;
            border-top-width: 1px;
            border-bottom-style: dotted;
            border-bottom-color: #C9C9C9;
            border-bottom-width: 1px;
            padding: 10px;
        }
        .productSaleAndReviewNumber div{
            display: inline-block;
            width: 49%;
            text-align: center;
            color: #999999;
            font-size: 12px;
        }
        .productSaleAndReviewNumber div:first-child{
            border-right-width: 1px;
            border-right-style: solid;
            border-right-color: #E5DFDA;
        }
        .productNumber{
            color: #999999;
        }
        .productNumberSettingSpan{
            border: 1px solid #999;
            display: inline-block;
            width: 43px;
            height: 32px;
            padding-top:7px;
        }
        .productNumberSetting{
            border: 0px;
            height: 80%;
            width: 80%;
        }
        .updown img{
            display:inline-block;
            vertical-align:top;
        }
        .updown{
            border: 1px solid #999;
            display: block;
            width: 20px;
            height: 14px;
            text-align: center;
            padding-top:4px;
        }
        .updownMiddle{
            height: 4px;
            display: block;
        }
        .arrow{
            display: inline-block;
            width: 22px;
            height: 32px;
            vertical-align:top;
        }
        div.serviceCommitment{
            margin: 20px 0px;
        }
        div.infoInimgAndInfo span.serviceCommitmentDesc{
            color: #999999;
        }
        div.infoInimgAndInfo span.serviceCommitmentLink a{
            color: #666666;
        }
        div.buyDiv{
            margin: 20px auto;
            text-align: center;
        }
        div.buyDiv button{
            display: inline-block;
            margin: 0px 10px;
            width: 180px;
            height: 40px;
        }
        button.buyButton{
            border: 1px solid #C40000;
            background-color: #FFEDED;
            text-align: center;
            line-height: 40px;
            font-size: 16px;
            color: #C40000;
            font-family: arial;
        }
        button.addCartButton{
            border: 1px solid #C40000;
            background-color: #C40000;
            text-align: center;
            line-height: 40px;
            font-size: 16px;
            color: white;
            font-family: arial;
        }
        button.addCartButton span.glyphicon{
            font-size: 12px;
            margin-right: 8px;
        }
        a:hover{
            text-decoration:none;
        }
        .redColor{
            color: #C40000;
        }
        .boldWord{
            font-weight: bold;
        }
    </style>

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
</head>
<body>


<div class="simpleSearchOutDiv">
    <a href="index.html">
        <img src="img/site/simpleLogo.png" alt="">
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
    <img class="categoryPictureInProductPage" src="img/item/79.jpg" alt="">
</div>
<div class="itemAndInfo">
    <div class="imgInfoDiv">
        <img width="100px" class="bigImg" src="img/item/<%=cid*5%>.jpg" alt="">
        <div class="smallImgDiv">
            <img width="56px" class="smallImg" src="img/item/<%=cid*5-4%>.jpg" alt="">
            <img width="56px" class="smallImg" src="img/item/<%=cid*5-3%>.jpg" alt="">
            <img width="56px" class="smallImg" src="img/item/<%=cid*5-2%>.jpg" alt="">
            <img width="56px" class="smallImg" src="img/item/<%=cid*5-1%>.jpg" alt="">
            <img width="56px" class="smallImg" src="img/item/<%=cid*5%>.jpg" alt="">
        </div>
    </div>


    <div class="itemInfoDiv">
        <div class="productTitle"><%=item.getName()%></div>
        <div class="productPrice">
            <div class="jvhuasuan">
                <span class="jvhuasuanbig">聚划算</span>
                <span>
                        此商品即将参加聚划算，<span class="jvhuasuanTime">1天19小时</span>后开始，
                    </span>
            </div>
            <diV class="productPriceDiv">
                <img src="img/site/gouwujuan.png" height="16px" alt="">
                <span>全天猫实物商品通用</span>
                <div class="originalDiv">
                    <span class="originalPriceDesc">价格</span>
                    <span class="originalPriceYuan">￥</span>
                    <span class="originalPrice"><%= item.getOriginalPrice()%></span>

                </div>
                <div class="promotionDiv">
                    <span class="promotionPriceDesc">促销价格</span>
                    <span class="promotionPriceYuan">￥</span>
                    <span class="promotionPrice"><%= item.promotionPrice%></span>

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
					<a class="increaseNumber" href="#nowhere">
					<span class="updown">
					   <img src="http://how2j.cn/tmall/img/site/increase.png">
					</span>
					</a>
					<span class="updownMiddle"> </span>
					<a class="decreaseNumber" href="#nowhere">
					<span class="updown">
					    <img src="http://how2j.cn/tmall/img/site/decrease.png">
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
        <script>
            <%
                String result = (String) request.getAttribute("result");
            %>
            var res = <%=result%>;
            if (res!=null){
                alert("已成功加入到购物车！");
            }
        </script>
        <div class="buyDiv">
            <a href="buy.jsp?cid=<%=cid%>" class="buyLink"><button class="buyButton">立即购买</button></a>
            <a class="addCartLink" href="AddCartServlet?cid=<%=cid%>"><button class="addCartButton"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button></a>
        </div>
    </div>
</div>
</body>
</html>