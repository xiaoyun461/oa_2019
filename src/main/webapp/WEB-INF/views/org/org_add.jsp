<%--
  Created by IntelliJ IDEA.
  User: xiaoyun461
  Date: 2019/11/21
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css"/>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-org-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>组织名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="orgName" name="orgName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>父级组织：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="晓允集团" name="orgParentName" id="orgParentName">
                <input type="hidden" name="orgParentId" id="orgParentId" value="1">
                <input class="btn btn-primary radius" type="button" value="选择父组织" onclick="selectParentOrg()"/>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否有效：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <select name="flag" id="flag" class="select">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">备注：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="orgDesc" cols="" rows="" class="textarea" placeholder="说点什么...100个字符以内"
                          dragonfly="true"></textarea>
<%--                <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>--%>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>


    <div id="orgParent" style="display: none;">
        <div id="ztreeDemo" class="ztree"></div>
    </div>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript">
    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-org-add").validate({
            rules: {
                orgName: {
                    required: true
                },
                orgParentName: {
                    required: true
                },
                flag: {
                    required: true
                },
                orgDesc: {
                    required: true
                }
            },
            messages: {
                orgName: {
                    required: "组织名称不能为空"
                },
                orgParentName: {
                    required: "组织父类名称不能为空"
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                $.ajax({
                    url: "sysOrg/add",
                    data: $("#form-org-add").serialize(),
                    type: "POST",
                    success: function (data) {
                        var icon;
                        if (data.result) {
                            icon = 5
                        } else {
                            icon = 6
                        }
                        layer.alert("添加成功", {icon: icon}, function () {
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.$('.btn-refresh').click();
                            parent.layer.close(index);
                            parent.location.reload();
                        });
                    },
                    error: function (data) {
                        var icon;
                        if (data.result) {
                            icon = 5
                        } else {
                            icon = 6
                        }
                        layer.alert("添加成功", {icon: icon}, function () {
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.$('.btn-refresh').click();
                            parent.layer.close(index);
                            parent.location.reload();
                        });
                    }
                });

            }

        });
    });

    function selectParentOrg() {
        //弹出一个层
        layer.open({
            title: '选择父组织',
            type: 1,
            content: $("#orgParent"),
            area: ['500px', '300px'],
            btn: '确认'
        });
        //渲染树
        var zNodes = [];
        var setting = {
            data: {
                key: {
                    name: "orgName"
                },
                simpleData: {
                    enable: true,
                    idKey: "orgId",
                    pIdKey: "orgParentId"
                }
            },
            callback: {
                onClick: function (event, treeId, treeNode) {
                    $("#orgParentName").val(treeNode.orgName);
                    $("#orgParentId").val(treeNode.orgId);
                }
            }
        };
        $.ajax({
                url: "sysOrg/list",
                type: "POST",
                dataType: "json",
                success: function (data) {
                    zNodes = data;
                    $(document).ready(function () {
                        var zTreeObj = $.fn.zTree.init($("#ztreeDemo"), setting, zNodes);
                    });
                }
            }
        );
    }

    $(".textarea").Huitextarealength({
        minlength: 2,
        maxlength: 100
    });

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
