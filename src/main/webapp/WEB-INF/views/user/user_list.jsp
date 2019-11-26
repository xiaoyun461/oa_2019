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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span
        class="c-gray en">&gt;</span> 员工管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>

<div class="page-container">
    <!-- 加入搜索功能-->
    <div class="text-c">
        <div class="row cl">
            <div class="formControls col-md-4">
                员工名称:<input type="text" class="input-text " style="width: 250px" id="userName"
                            value="${userName}"/>
            </div>
            <div class="formControls col-md-8">
                日期范围：
                <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })"
                       id="datemin" class="input-text " style="width:120px;" value="${sDatemin}">
                -
                <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })"
                       id="datemax" class="input-text " style="width:120px;" value="${sDatemax}">
            </div>
        </div>
        <div class="row cl">
            <div class="cl pd-5">
                <button type="button" class="btn btn-success radius" id="" name="" onclick="query()">
                    <i class="Hui-iconfont">&#xe665;</i>搜用户
                </button>
            </div>
        </div>
    </div>

    <div class="cl pd-5 bg-1 bk-gray"><span class="l">
        <a href="javascript:;" onclick="batchDel()" class="btn btn-danger radius">
            <i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
        <a class="btn btn-primary radius" href="javascript:;"
           onclick="admin_user_add('添加员工','sysUser/toAdd','800')"><i
                class="Hui-iconfont">&#xe600;</i> 添加员工</a> </span> <span
            class="r">共有数据：<strong>${pageInfo.total}</strong> 条</span></div>
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
                    <a title="编辑" href="javascript:;"
                       onclick="admin_user_edit('员工编辑','sysUser/toUpdate?userId=${user.userId}','600')"
                       style="text-decoration:none">
                        <i class="Hui-iconfont">&#xe6df;</i></a>
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
        <jsp:param name="bodyId" value="userBody"/>
    </jsp:include>

</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/lib/My97DatePicker/4.8/WdatePicker.js"></script>

<script type="text/javascript">

    <%--function getQueryConditionParam() {--%>
    <%--    return {--%>
    <%--        'userName': "${user.userName}"--%>
    <%--    };--%>
    <%--}--%>


    /*管理员-员工-添加*/
    function admin_user_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*管理员-员工-编辑*/
    function admin_user_edit(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*管理员-员工-删除*/
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

    /** 批量删除*/
    function batchDel() {
        var checkeds = $(".delbox:checked");
        if (checkeds.length == 0) {
            return;
        }

        layer.confirm('员工删除须谨慎，确认要删除吗？删除之后，数据不恢复', function (index) {
            var ids = [];
            for (var i = 0; i < checkeds.length; i++) {
                ids.push(checkeds[i].value);
            }
            $.ajax({
                type: 'POST',
                url: 'sysUser/batchDel',
                data: "idList=" + ids,
                dataType: 'json',
                success: function (data) {
                    if (data.result) {
                        // $(data).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 2000});
                        window.location.reload();
                    } else {
                        layer.msg('当前员工下面有子员工，不能删除!', {icon: 2, time: 2000});
                        window.location.reload();
                    }
                },
            });
        });
    }

    function query() {
        var userName = $("#userName").val();
        var datemin = $("#datemin").val();
        var datemax = $("#datemax").val();

        $("#userBody").load("sysUser/pageByCondition",
            {
                "userName": userName,
                "datemin": datemin,
                "datemax": datemax
            }, function () {
            })
    }

</script>
</body>
</html>

