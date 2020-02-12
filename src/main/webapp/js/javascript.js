//注册时候校验名字
$(function(){
    $("#userName,#userPwd").keyup(function () {

        var username = $("#userName").val();
        var password = $("#userPwd").val();
        var flag1 = false;
        var flag2 = false;
        if(/^[a-zA-Z_-][a-zA-Z0-9_-]{2,16}$/.test(username)){
            flag1 = true;
        }else{
            flag2 = false;
            $("#tip").text("该会员名不合法");
            $("#sub").attr("disable","disabled");
        }
        if(/^[a-zA-Z_-][a-zA-Z0-9_-]{5,18}$/.test(password)){
            flag2 = true;
        }
        else {
            flag2 = false;
            $("#sub").attr("disabled","disabled");
        }

        if (flag1 && flag2){
            $("#sub").removeAttr("disabled");
        }else{

        }
        $.ajax({
            url:"checkName",
            type:"post",
            dataType:"json",
            data:{username:username},
            success:function (res) {
                if (res == "1") {
                    if (flag1){
                        $("#tip").text("该会员名可用");
                    }
                } else {
                    $("#tip").text("该会员名重复");
                }
            }
        });
    });
});

//item 页面的大图
$(function(){
    $("img.smallImg").mouseenter(function(){
        var bigImageURL = $(this).attr("src");
        $("img.bigImg").attr("src",bigImageURL);
    });
});
//item页面的产品数量
$(function(){
    var stock = 100;
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



//购物车页面
$(function(){
    $(".orderItemNumberSetting").keyup(function () {
        var pid = $(this).attr("pid");
        var stock = $(this).attr("stock");
        var num = $(".orderItemNumberSetting[pid="+pid+"]").val();
        num = parseInt(num);
        if(isNaN(num))
            num= 1;
        if(num<=0)
            num = 1;
        if(num>stock)
            num = stock;
        $(".orderItemNumberSetting[pid="+pid+"]").val(num);
        calPrice(pid,num);
        calSumPrice();
    });

    $(".numberPlus").click(function () {
        var pid = $(this).attr("pid");
        var stock = $(this).attr("stock");
        var num = $("input.orderItemNumberSetting[pid="+pid+"]").val();
        num++;
        if(num>stock)
            num = stock;
        $("input.orderItemNumberSetting[pid="+pid+"]").val(num);
        calPrice(pid,num);
        calSumPrice();
    });

    $(".numberMinus").click(function () {
        var pid = $(this).attr("pid");
        var num = $(".orderItemNumberSetting[pid="+pid+"]").val();
        num--;
        if(num == 0)
            num = 1;
        $(".orderItemNumberSetting[pid="+pid+"]").val(num);
        calPrice(pid,num);
        calSumPrice();
    });

    $(".cartProductItemIfSelected").click(function () {
        var oid = $(this).attr("oiid");
        var isSelected = $(this).attr("selectit");
        if(isSelected == "false") {
            $(".cartProductItemTR[oid=" + oid + "]").attr("style","background-color:#FFC0CB");
            $(this).attr("src","http://how2j.cn/tmall/img/site/cartSelected.png");
            $(this).attr("selectit","true");
        }else{
            $(".cartProductItemTR[oid=" + oid + "]").attr("style","background-color:white");
            $(this).attr("src","http://how2j.cn/tmall/img/site/cartNotSelected.png");
            $(this).attr("selectit","false");
        }
        calSumPrice();
        isSelect();
        calProductNum();
    });
    $(".selectAllItem").click(function () {
        var isAllSelected = false;
        $(".cartProductItemIfSelected").each(function () {
            if ( $(this).attr("selectit") == "true") {
                isAllSelected = true
            }
        });
        if (!isAllSelected){
            $(".cartProductItemTR").each(function () {
                var oid = $(this).attr("oid");
                $(this).attr("style","background-color:#FFC0CB");
                $(".cartProductItemIfSelected[oiid="+oid+"]").attr("src","http://how2j.cn/tmall/img/site/cartSelected.png");
                $(".cartProductItemIfSelected[oiid="+oid+"]").attr("selectit","true");
                $(".selectAllItem").attr("src","http://how2j.cn/tmall/img/site/cartSelected.png");
            });
        }else{
            $(".cartProductItemTR").each(function () {
                var oid = $(this).attr("oid");
                $(this).attr("style","background-color:white");
                $(".cartProductItemIfSelected[oiid="+oid+"]").attr("src","http://how2j.cn/tmall/img/site/cartNotSelected.png");
                $(".cartProductItemIfSelected[oiid="+oid+"]").attr("selectit","false");
                $(".selectAllItem").attr("src","http://how2j.cn/tmall/img/site/cartNotSelected.png");
            });
        }
        calSumPrice();
        isSelect();
        calProductNum();
    });

    $(".createOrderButton").click(function () {
        var pids = new Array();
        var nums = new Array();
        var temp = $(".cartSumPrice").text();
        var sum = temp.substr(1,temp.length-1);
        $(".cartProductItemIfSelected").each(function () {
            var oid = $(this).attr("oiid");
            if( $(this).attr("selectit") == "true"){
                var text = $(".cartProductItemSmallSumPrice[pid="+oid+"]").text();
                var sumPrice = text.substr(1,text.length-1);
                var price = $(".orderItemPromotePrice[pid="+oid+"]").text();
                pids.push(oid);
                nums.push(((new Number(sumPrice))/(new Number(price))).toString());
            }
        });
        $.ajax({
            url:"creatOrder",
            type:"post",
            dataType:"json",
            async:false,
            data:{pids:pids,nums:nums},
            traditional:true,
            success:function (result) {
                window.location.href = "buy";
            }
        });
    });



});
function calProductNum() {
    var num = 0;
    $(".cartProductItemIfSelected").each(function () {
        if ($(this).attr("selectit") == "true") {
            num ++;
        }
    });
    $(".cartSumNumber").text(num);
}

function isSelect() {
    var isSelect = false
    $(".cartProductItemIfSelected").each(function () {
        if ($(this).attr("selectit") == "true") {
            isSelect = true;
        }
    });
    if (isSelect) {
        $("button.createOrderButton").attr("style", "background-color:#C40000");
        $("button.createOrderButton").removeAttr("disabled");
    } else {
        $("button.createOrderButton").attr("style", "background-color:#AAAAAA");
        $("button.createOrderButton").attr("disabled", "disabled");
    }
}
function calSumPrice(){
    var sumPrice = 0;
    $(".cartProductItemSmallSumPrice").each(function () {
        var pid = $(this).attr("pid");
        if ($(".cartProductItemIfSelected[oiid="+pid+"]").attr("selectit") == "true"){
            var text = $(this).text();
            var strPrice = text.substr(1,text.length-1);
            var price = new Number(strPrice);
            sumPrice += price;
        }

    });
    $(".cartSumPrice").text("￥"+sumPrice);
    $(".cartTitlePrice").text("￥"+sumPrice);

}

function calPrice(pid,num) {
    var price = $(".orderItemPromotePrice[pid="+pid+"]").text();
    $(".cartProductItemSmallSumPrice[pid="+pid+"]").text("￥"+num*price);
}


//订单页面
$(function(){
    $("tbody:gt(0)").each(function (i) {
        $(this).children(".orderItemProductInfoPartTR:gt(0)").each(function () {
            $(this).children("td.orderListItemProductRealPriceTD,td.orderListItemButtonTD").remove();
        });
    });

    $("tbody:gt(0)").each(function (i) {
        var orderPrice = new Number();
        $(this).children(".orderItemProductInfoPartTR").each(function () {
            //console.log($(this).find(".orderListItemProductPrice").text());
            var text = $(this).find(".orderListItemProductPrice").text();
            var price = new Number(text.substr(1,text.length-1));
            var num = new Number($(this).find(".orderListItemNumber").text());
            orderPrice += num*price;
        });
        $(this).find(".orderListItemProductRealPrice").text("￥"+orderPrice);
    });

    $(".orderType>div:not(.orderTypeLastOne)").click(function () {
        $(".orderType>div").each(function () {
            $(this).removeClass("selectedOrderType");
        });
        $(this).addClass("selectedOrderType");

        $(".orderListItemTable").each(function () {
            $(this).attr("style","display: none;");
        });
        var type = $(this).children("a").attr("orderstatus");
        if (type == "waitPay"){
            $(".orderListItemTable").each(function () {
                if ($(this).attr("orderstatus") == "waitPay"){
                    $(this).attr("style","display: table;");
                }
            });
        }else if (type == "waitDelivery"){
            $(".orderListItemTable").each(function () {
                if ($(this).attr("orderstatus") == "waitDelivery"){
                    $(this).attr("style","display: table;");
                }
            });
        }else if (type == "waitConfirm"){
            $(".orderListItemTable").each(function () {
                if ($(this).attr("orderstatus") == "waitConfirm"){
                    $(this).attr("style","display: table;");
                }
            });
        }else if (type == "waitReview"){
            $(".orderListItemTable").each(function () {
                if ($(this).attr("orderstatus") == "waitReview"){
                    $(this).attr("style","display: table;");
                }
            });
        }else{
            $(".orderListItemTable").each(function () {
                $(this).attr("style","display: table;");
            });
        }

    });

    $(".orderItemStatus").click(function () {
        var text = $(this).parents(".orderItemProductInfoPartTR").find(".orderListItemProductRealPrice").text();
        var total = new Number(text.substr(1,text.length-1));
        var oid = new Number();
        oid = $(this).parents("table").attr("oid");
        console.log(oid);
        var text = $(this).attr("class");
        var status = new Number();
        console.log(text);
        if (text.indexOf("orderListItemPay") != -1){
            status = 0;
            console.log(status);
        }else if(text.indexOf("orderListItemSend") != -1){
            status = 1;
            console.log(status);
        }else if(text.indexOf("orderListItemReceive") != -1){
            status = 2;
            console.log(status);
        }else if(text.indexOf("orderListItemReview") != -1){
            status = 3;
            console.log(status);
        }else {
            alert("error!");
        }
        $.ajax({
            url:"changeOrderStatus",
            type:"post",
            dataType:"json",
            data:{oid:oid,total:total,status:status},
            success:function (msg) {
                if (msg == 0){
                    window.location.href = "pay";
                }else if (msg == 1){
                    $(this).attr("class","orderItemStatus orderListItemReceive");
                    $(this).text("确认收货");
                    alert("卖家已光速发货，刷新页面即可确认收货！");
                }else if (msg == 2){
                    alert("你已确认收货，刷新即可评价本次购买")
                    $(this).attr("class","orderItemStatus orderListItemReview");
                    $(this).text("评价");
                }else if (msg == 3){
                    var text = prompt("添加你对本次购买或商品的评价");
                    $.ajax({
                        url:"addReviews",
                        type:"post",
                        data:{oid:oid,content:text},
                        success:function (msg) {
                            alert("成功对"+msg+"件商品进行评价");
                            window.location.reload();
                        }
                    });
                }else{
                    alert("error");
                }
            }
        });

    });
    // $("button.orderListItemPay").click(function () {
    //     var oid = new Number();
    //     oid = $(this).parents("table").attr("oid");
    //     var text = $(this).parents(".orderItemProductInfoPartTR").find(".orderListItemProductRealPrice").text();
    //     var price = new Number(text.substr(1,text.length-1));
    //
    //     $.ajax({
    //         url:""
    //     });
    // });
    
    $(".deleteOrderLink").click(function () {
        var oid = new Number($(this).attr("oid"));
        $.ajax({
            url:"deleteOreder",
            data:{oid:oid},
            success: function (msg) {
                window.location.reload();
            }
        });
    });

});
//购买页面
$(function () {
    var orderPriceSum = new Number();
    var orderItemUnitSum = $(".orderItemUnitSum");
    for (var i=0; i<orderItemUnitSum.length; i++){
        var text = (orderItemUnitSum.get(i)).innerHTML;
        var price = new Number(text.substr(1,text.length-1));
        orderPriceSum += price;
    }
    $(".storePrice").text("￥ "+orderPriceSum);
    $(".orderItemTotalSumSpan").text("￥ "+orderPriceSum);
});
//评价
$(function() {

});

//注销
$(document).ready(function(){
    $("#forelogout").click(function(){
        //通过ajax请求springmvc
        $.post(
            "/ssmproject/forelogout",//服务器地址
            function(result){
                window.location.reload();
            }
        );
    });
    //加入购物车
    $("#addCartButton").click(function(){
        $.post(
            "../addCart",
            {pid:$(this).attr("name"),quantity:$("#productNumber").val()},
            function(result) {
                $("#cartSize").text(result);
            }
        );
    });


});

//移除购物车
$(document).ready(function(){
    $(".deleteOrderItem").click(function(){
        $.post(
            "deleteCartProduct",//服务器地址
            {"pid" : $(this).attr("oiid")},
            function(result){
                window.location.reload();
            }
        );
    });
});

