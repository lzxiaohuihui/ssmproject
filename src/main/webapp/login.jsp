<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet"/>
    <title>login</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/ico/favicon.ico" mce_href="${pageContext.request.contextPath}/img/ico/favicon.ico" type="image/x-icon" />

</head>
<body>

    <form action="login" method="POST">
        <h1>Login</h1>

        <div class="txtb">
            <input type="text" autocomplete="off" name="username">
            <span class="tipSpan" data-placeholder="UserName"></span>
        </div>

        <div class="txtb">
            <input type="password" name="pwd">
            <span class="tipSpan" data-placeholder="Password" ></span>
        </div>

        <input class="logbtn" type="submit" value="login">
        
        <div class="bottom-text">
            don't have account?<a href="${pageContext.request.contextPath}/register">sign up</a>
        </div>
    </form>


    <script type="text/javascript">
        $(".txtb input").on("focus",function(){
            $(this).addClass("focus");
        });

        $(".txtb input").on("blur",function(){
            if($(this).val()==='')
            $(this).removeClass("focus");
        });
        
    </script>


</body>
</html>