$(function(){
    $("input.sortBarPrice").keyup(function(){
        var num= $(this).val();
        if(num.length==0){
            $("div.productUnit").show();
            return;
        }

        num = parseInt(num);
        if(isNaN(num))
            num= 1;
        if(num<=0)
            num = 1;
        $(this).val(num);

        var begin = $("input.beginPrice").val();
        var end = $("input.endPrice").val();
        if(!isNaN(begin) && !isNaN(end)){
            $("div.productUnit").hide();
            $("div.productUnit").each(function(){
                var price = $(this).attr("price");
                price = new Number(price);
                if(price<=end && price>=begin)
                    $(this).show();
            });
        }

    });
});

$(function(){
    $("input.searchItem").keyup(function(){
        var searchName = $(this).val();
        if(searchName == null){
            $("div.productUnit").show();
            return;
        }

        if(searchName!=null){
            $("div.productUnit").hide();
            $("div.productUnit").each(function(){
                var name = $(this).attr("name");
                name = new String(name);
                if(name.indexOf(searchName)!=-1)
                    $(this).show();
            });
        }

    });
});




$(function(){
    $("img.smallImg").mouseenter(function(){
        var bigImageURL = $(this).attr("src");
        $("img.bigImg").attr("src",bigImageURL);
    });
});
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



function formatMoney(num){
    num = num.toString().replace(/\$|\,/g,'');
    if(isNaN(num))
        num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num*100+0.50000000001);
    cents = num%100;
    num = Math.floor(num/100).toString();
    if(cents<10)
        cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
        num = num.substring(0,num.length-(4*i+3))+','+
            num.substring(num.length-(4*i+3));
    return (((sign)?'':'-') + num + '.' + cents);
}


//购物车页面
$(function(){
    $("img.cartProductItemIfSelected").click(function(){
        var selectit = $(this).attr("selectit")
        if("selectit"==selectit){
            $(this).attr("src","http://how2j.cn/tmall/img/site/cartNotSelected.png");
            $(this).attr("selectit","false")
            $(this).parents("tr.cartProductItemTR").css("background-color","#fff");
        }
        else{
            $(this).attr("src","http://how2j.cn/tmall/img/site/cartSelected.png");
            $(this).attr("selectit","selectit")
            $(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
        }
        syncSelect();
        syncCreateOrderButton();
        calcCartSumPriceAndNumber();
    });
    $("img.selectAllItem").click(function(){
        var selectit = $(this).attr("selectit")
        if("selectit"==selectit){
            $("img.selectAllItem").attr("src","http://how2j.cn/tmall/img/site/cartNotSelected.png");
            $("img.selectAllItem").attr("selectit","false")
            $(".cartProductItemIfSelected").each(function(){
                $(this).attr("src","http://how2j.cn/tmall/img/site/cartNotSelected.png");
                $(this).attr("selectit","false");
                $(this).parents("tr.cartProductItemTR").css("background-color","#fff");
            });
        }
        else{
            $("img.selectAllItem").attr("src","http://how2j.cn/tmall/img/site/cartSelected.png");
            $("img.selectAllItem").attr("selectit","selectit")
            $(".cartProductItemIfSelected").each(function(){
                $(this).attr("src","http://how2j.cn/tmall/img/site/cartSelected.png");
                $(this).attr("selectit","selectit");
                $(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
            });
        }
        syncCreateOrderButton();
        calcCartSumPriceAndNumber();
    });
    $(".orderItemNumberSetting").keyup(function(){
        var pid=$(this).attr("pid");
        var stock= $("span.orderItemStock[pid="+pid+"]").text();
        var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();
        var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
        num = parseInt(num);
        if(isNaN(num))
            num= 1;
        if(num<=0)
            num = 1;
        if(num>stock)
            num = stock;
        syncPrice(pid,num,price);
    });
    $(".numberPlus").click(function(){
        var pid=$(this).attr("pid");
        var stock= $("span.orderItemStock[pid="+pid+"]").text();
        var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();
        var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
        num++;
        if(num>stock)
            num = stock;
        syncPrice(pid,num,price);
    });
    $(".numberMinus").click(function(){
        var pid=$(this).attr("pid");
        var stock= $("span.orderItemStock[pid="+pid+"]").text();
        var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();
        var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
        --num;
        if(num<=0)
            num=1;
        syncPrice(pid,num,price);
    });

})
function syncCreateOrderButton(){
    var selectAny = false;
    $(".cartProductItemIfSelected").each(function(){
        if("selectit"==$(this).attr("selectit")){
            selectAny = true;
        }
    });
    if(selectAny){
        $("button.createOrderButton").css("background-color","#C40000");
        $("button.createOrderButton").removeAttr("disabled");
    }
    else{
        $("button.createOrderButton").css("background-color","#AAAAAA");
        $("button.createOrderButton").attr("disabled","disabled");
    }
}
function syncSelect(){
    var selectAll = true;
    $(".cartProductItemIfSelected").each(function(){
        if("false"==$(this).attr("selectit")){
            selectAll = false;
        }
    });
    if(selectAll)
        $("img.selectAllItem").attr("src","http://how2j.cn/tmall/img/site/cartSelected.png");
    else
        $("img.selectAllItem").attr("src","http://how2j.cn/tmall/img/site/cartNotSelected.png");
}
function calcCartSumPriceAndNumber(){
    var sum = 0;
    var totalNumber = 0;
    $("img.cartProductItemIfSelected[selectit='selectit']").each(function(){
        var oiid = $(this).attr("oiid");
        var price =$(".cartProductItemSmallSumPrice[oiid="+oiid+"]").text();
        price = price.replace(/,/g, "");
        price = price.replace(/￥/g, "");
        sum += new Number(price);
        var num =$(".orderItemNumberSetting[oiid="+oiid+"]").val();
        totalNumber += new Number(num);
    });
    $("span.cartSumPrice").html("￥"+formatMoney(sum));
    $("span.cartTitlePrice").html("￥"+formatMoney(sum));
    $("span.cartSumNumber").html(totalNumber);
}
function syncPrice(pid,num,price){
    $(".orderItemNumberSetting[pid="+pid+"]").val(num);
    var cartProductItemSmallSumPrice = formatMoney(num*price);
    $(".cartProductItemSmallSumPrice[pid="+pid+"]").html("￥"+cartProductItemSmallSumPrice);
    calcCartSumPriceAndNumber();
}


//订单页面
$(function(){
    $("a[orderStatus]").click(function(){
        var orderStatus = $(this).attr("orderStatus");
        if('all'==orderStatus){
            $("table[orderStatus]").show();
        }
        else{
            $("table[orderStatus]").hide();
            $("table[orderStatus="+orderStatus+"]").show();
        }
        $("div.orderType div").removeClass("selectedOrderType");
        $(this).parent("div").addClass("selectedOrderType");
    });
    $("a.deleteOrderLink").click(function(){
        deleteOrderid = $(this).attr("oid");
        deleteOrder = false;
        $("#deleteConfirmModal").modal("show");
    });
    $("button.deleteConfirmButton").click(function(){
        deleteOrder = true;
        $("#deleteConfirmModal").modal('hide');
    });
    $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
        if(deleteOrder){
            var page="foredeleteOrder";
            $.post(
                page,
                {"oid":deleteOrderid},
                function(result){
                    if("success"==result){
                        $("table.orderListItemTable[oid="+deleteOrderid+"]").hide();
                    }
                    else{
                        location.href="login.jsp";
                    }
                }
            );
        }
    })
});


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
});


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