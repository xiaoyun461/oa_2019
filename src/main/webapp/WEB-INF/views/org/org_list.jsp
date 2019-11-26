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
<body id="orgBody">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span
        class="c-gray en">&gt;</span> 组织管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>

<div class="page-container">
    <!-- 加入搜索功能-->
    <div class="text-c">
        <div class="row cl">
            <div class="formControls col-md-4">
                组织名称:<input type="text" class="input-text" style="width: 250px" id="orgName"
                            value="${org.orgName}"/>
            </div>
            <div class="formControls col-md-4">
                父组织名称:<input type="text" class="input-text" style="width: 250px" id="orgParentName"
                             value="${org.orgParentName}"/>
            </div>
            <div class="formControls col-md-3">
                是否有效:
                <span class="select-box" style="width: 150px">
                <select class="select" name="brandclass" size="1" id="flag">
                    <option value="1" selected="">是</option>
                    <option value="0">否</option>
                </select>
                </span>
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
           onclick="admin_org_add('添加组织','sysOrg/toAdd','800')"><i
                class="Hui-iconfont">&#xe600;</i> 添加组织</a> </span> <span
            class="r">共有数据：<strong>${pageInfo.total}</strong> 条</span></div>
    <table class="table table-border table-bordered table-hover table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">组织管理</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" value="" name=""></th>
            <th width="40">ID</th>
            <th width="100">组织名</th>
            <th width="100">父级组织</th>
            <th width="100">是否有效</th>
            <th width="100">创建时间</th>
            <th width="100">更新时间</th>
            <th width="200">描述</th>
            <th width="70">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.records}" var="org">
            <tr class="text-c">
                <td><input type="checkbox" class="delbox" value="${org.orgId}" name=""></td>
                <td>${org.orgId}</td>
                <td>${org.orgName}</td>
                <td>${org.orgParentName}</td>
                <td>
                    <c:if test="${org.flag}">
                        是
                    </c:if>
                    <c:if test="${!org.flag}">
                        否
                    </c:if>
                </td>
                <td>${org.createTime.toString().replace("T"," ")}</td>
                <td>${org.updateTime.toString().replace("T"," ")}</td>
                <td>${org.orgDesc}</td>
                <td class="f-14">
                    <a title="编辑" href="javascript:;"
                       onclick="admin_org_edit('组织编辑','sysOrg/toUpdate?orgId=${org.orgId}','600')"
                       style="text-decoration:none">
                        <i class="Hui-iconfont">&#xe6df;</i></a>
                    <a title="删除" href="javascript:;" onclick="admin_org_del(this,${org.orgId})" class="ml-5"
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
        <jsp:param name="bodyId" value="orgBody"/>
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

    <%--function getQueryConditionParam() {--%>
    <%--    return {--%>
    <%--        'orgName': "${org.orgName}",--%>
    <%--        'orgParentName': "${org.orgParentName}",--%>
    <%--        'flag': "${org.flag}"--%>
    <%--    };--%>
    <%--}--%>


    /*管理员-组织-添加*/
    function admin_org_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*管理员-组织-编辑*/
    function admin_org_edit(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*管理员-组织-删除*/
    function admin_org_del(obj, id) {
        layer.confirm('组织删除须谨慎，确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: 'sysOrg/delById',
                data: 'orgId=' + id,
                dataType: 'json',
                success: function (data) {
                    if (data.result) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 2000});
                    } else {
                        layer.msg('当前组织下面有子组织，不能删除!', {icon: 2, time: 2000});
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

        layer.confirm('组织删除须谨慎，确认要删除吗？删除之后，数据不恢复', function (index) {
            var ids = [];
            for (var i = 0; i < checkeds.length; i++) {
                ids.push(checkeds[i].value);
            }
            $.ajax({
                type: 'POST',
                url: 'sysOrg/batchDel',
                data: "idList=" + ids,
                dataType: 'json',
                success: function (data) {
                    if (data.result) {
                        // $(data).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 2000});
                        window.location.reload();
                    } else {
                        layer.msg('当前组织下面有子组织，不能删除!', {icon: 2, time: 2000});
                        window.location.reload();
                    }
                },
            });
        });
    }

    function query() {
        var orgName = $("#orgName").val();
        var orgParentName = $("#orgParentName").val();
        var flag = $("#flag").val();

        $("#orgBody").load("sysOrg/pageByCondition",
            {"orgName": orgName, "orgParentName": orgParentName, "flag": flag}, function () {

            })
    }

</script>
</body>
</html>

