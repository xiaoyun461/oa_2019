<%--
  Created by IntelliJ IDEA.
  User: xiaoyun461
  Date: 2019/11/21
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath()+"/"%>">
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css"/>
</head>
<body id="userBody">
<div class="page-container">

    <div class="cl pd-5 bg-1 bk-gray">
        <span
                class="r">共有数据：<strong>${pageInfo.total}</strong> 条</span>
    </div>
    <table class="table table-border table-bordered table-hover table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">员工管理</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" value="" name=""></th>
            <th width="40">ID</th>
            <th width="100">员工名</th>
            <th width="100">电话</th>
            <th width="100">邮箱</th>
            <th width="100">生日</th>
            <th width="70">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.records}" var="user">
            <tr class="text-c">
                <td><input type="checkbox" class="delbox" value="${user.userId}" name=""></td>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.phone}</td>
                <td>${user.email}</td>
                <td>${user.birthday.toString().split("T")[0]}</td>
                <td class="f-14">
                    <a title="删除" href="javascript:;" onclick="admin_user_del(this,${user.userId})" class="ml-5"
                       style="text-decoration:none">
                        <i class="Hui-iconfont">&#xe6e2;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 引入分页-->
    <jsp:include page="/WEB-INF/views/common/page.jsp">
        <jsp:param name="bodyId" value="authorization"/>
    </jsp:include>

</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>

<script type="text/javascript">


    /*管理员--删除-中间关系*/
    function admin_user_del(obj, id) {
        layer.confirm('员工删除须谨慎，确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: 'sysUser/delById',
                data: 'userId=' + id,
                dataType: 'json',
                success: function (data) {
                    if (data.result) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 2000});
                    } else {
                        layer.msg('当前员工下面有子员工-，不能删除!', {icon: 2, time: 2000});
                    }
                },
            });
        });
    }


</script>
</body>
</html>

