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

});

//注销
$(document).ready(function(){
    $("#forelogout").click(function(){
        //通过ajax请求springmvc
        $.post(
            "forelogout",//服务器地址
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

//删除订单
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

