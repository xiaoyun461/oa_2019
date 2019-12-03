<%--
  Created by IntelliJ IDEA.
  User: xiaoyun461
  Date: 2019/12/2
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath()+"/"%>">s
    <from action="shiro/login" method="get">
        username: <input type="text" name="username">
        <br/>
        password: <input type="text" name="password">
        <br/>
        <input type="submit" value="登录">
    </from>
</head>
<body>

</body>
</html>
