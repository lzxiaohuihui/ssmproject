<%--
  Created by IntelliJ IDEA.
  User: 小灰灰
  Date: 2020/1/14
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试</title>
</head>
<body>
    <form  action="testUpload" method="post" enctype="multipart/form-data">
        <input type="file" name="file"/>
        描述：<input type="text" name="desc"/>
        <input type="submit" value="上传"/>
    </form>
</body>
</html>
