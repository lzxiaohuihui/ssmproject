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