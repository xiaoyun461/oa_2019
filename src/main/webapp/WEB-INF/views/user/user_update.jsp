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
    <form class="form form-horizontal" id="form-user-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>员工名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="hidden" name="userId" id="userId" value="${user.userId}">
                <input type="text" class="input-text" value="${user.userName}" placeholder="" id="userName"
                       name="userName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" value="${user.userPassword}" placeholder="" id="userPassword"
                       name="userPassword">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" autocomplete="off" placeholder="确认新密码" id="password2"
                       name="password2">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>生日：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input id="d11" type="text" class="input-text Wdate" onClick="WdatePicker({
                maxDate: '%y-%M-%d'
                })" datatype="*" name="birthday" value="${user.birthday}"/>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机号码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${user.phone}" placeholder="" id="phone" name="phone"
                       datatype="phone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${user.email}" placeholder="" id="email" name="email"
                       datatype="email">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">自我介绍：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="introduce" id="introduce" cols="" rows="" class="textarea" placeholder="说点什么...100个字符以内"
                          dragonfly="true">${user.introduce}</textarea>
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
<script type="text/javascript" src="/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript">
    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-user-add").validate({
            rules: {
                userName: {
                    required: true,
                    maxlength: 12
                },
                userPassword: {
                    required: true,
                    minlength: 6,
                    maxlength: 16
                },
                password2: {
                    required: true,
                    equalTo: "#userPassword",
                    minlength: 6,
                    maxlength: 16
                },
                birthday: {
                    required: true,
                    dateISO: true
                },
                phone: {
                    required: true,
                    digits: true
                },
                email: {
                    required: true,
                    email: true
                },
                introduce: {
                    required: true,
                    minlength: 2
                }
            },
            messages: {
                userName: {
                    required: "员工名字不能为空"
                },
                userPassword: {
                    required: "员工密码不能为空"
                },
                birthday: {
                    required: "员工生日不能为空"
                },
                phone: {
                    required: "员工电话不能为空"
                },
                email: {
                    required: "员工邮箱不能为空"
                },
                introduce: {
                    required: "员工自我介绍不能为空"
                }
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                $.ajax({
                    url: "sysUser/update",
                    data: $("#form-user-add").serialize(),
                    type: "POST",
                    success: function (data) {
                        var icon;
                        if (data.result) {
                            icon = 5
                        } else {
                            icon = 6
                        }
                        layer.alert("修改成功", {icon: icon}, function () {
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
            title: '选择父员工',
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
