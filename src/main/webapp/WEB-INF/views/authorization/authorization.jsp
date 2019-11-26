<%--
  Created by IntelliJ IDEA.
  User: xiaoyun461
  Date: 2019/11/25
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>授权管理页面</title>
</head>
<base href="<%=request.getContextPath()+"/"%>">
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css"/>
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css"/>
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css"/>
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin"/>
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css"/>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 授权管理 <span
        class="c-gray en">&gt;</span> 授权列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c">
        <div class="row cl">
            <div class="formControls col-md-4">
                角色:
                <select id="role">
                    <option value="-1">请选择</option>
                    <option value="2">CEO</option>
                    <option value="3">技术总监</option>
                </select>
            </div>
            <div class="formControls col-md-4">
                授权类型:
                <select id="type">
                    <option value="-1">请选择</option>
                    <option value="1">用户</option>
                    <option value="2">菜单</option>
                </select>
            </div>
        </div>
        <div class="row cl">
            <div class="cl pd-5">
                <button type="submit" class="btn btn-success radius" id="query" name="">
                    <i class="Hui-iconfont">&#xe665;</i> 搜用户
                </button>
            </div>
        </div>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="admin_add('添加授权','admin-add.html','800','500')"
               class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 授权新用户
            </a>
            <a href="javascript:;" onclick="admin_add('添加授权','admin-add.html','800','500')"
               class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 授权新菜单
            </a>
        </span>
        <span class="r">共有数据：<strong>54</strong> 条</span>
    </div>
    <table class="table table-border table-bordered table-bg" id="authorization">
        <!-- 动态填充,用户，菜单-->
    </table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

    $(function () {
        $("#query").click(function () {
            var role = $("#role").val();
            var type = $("#type").val();
            if (role == -1) {
                layer.msg('请选择角色', {icon: 2, time: 2000});
                return;
            } else if (type == -1) {
                layer.msg('请选择授权类型', {icon: 2, time: 2000});
                return;
            }
            if (type == 1) {
                //搜索当前 拥有该角色的用户
                $("#authorization").load("authorization/getUsersByRoleId", {
                    "roleId": role
                }, function () {
                })
            } else {
                //搜索当前角色拥有的菜单
            }

        })
    });
    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */
    /*授权-增加*/
    function admin_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*授权-删除*/
    function admin_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                },
                error: function (data) {
                    console.log(data.msg);
                },
            });
        });
    }

    /*授权-编辑*/
    function admin_edit(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*授权-停用*/
    function admin_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……

            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
            $(obj).remove();
            layer.msg('已停用!', {icon: 5, time: 1000});
        });
    }

    /*授权-启用*/
    function admin_start(obj, id) {
        layer.confirm('确认要启用吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……


            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!', {icon: 6, time: 1000});
        });
    }
</script>
</body>
</html>
