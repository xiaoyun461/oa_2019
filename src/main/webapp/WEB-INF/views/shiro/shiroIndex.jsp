<%--
  Created by IntelliJ IDEA.
  User: xiaoyun461
  Date: 2019/12/2
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
shiro专门做安全控制的框架
<shiro:user>
    <a href="/shiro/login">注销</a>
</shiro:user>

<shiro:guest>
    <a href="/shiro/login">注销</a>
</shiro:guest>
<shiro:hasPermission name="">

</shiro:hasPermission>


</body>
</html>
