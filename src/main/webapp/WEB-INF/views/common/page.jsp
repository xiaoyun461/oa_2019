<%--
  Created by IntelliJ IDEA.
  User: xiaoyun461
  Date: 2019/11/21
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
    <script src="lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript">
        layui.use(['laypage', 'layer'], function () {
            var laypage = layui.laypage
                , layer = layui.layer;

            //总页数低于页码总数
            laypage.render({
                elem: 'pager'
                , count: ${pageInfo.total} //数据总数
                , limit:  ${pageInfo.size}
                , limits: [1, 2, 3, 4, 5]
                , curr: ${pageInfo.current}
                , groups: 3
                , layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh']
                , jump: function (obj, first) {
                    //obj包含了当前分页的所有参数，比如：
                    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    console.log(obj.limit); //得到每页显示的条数
                    console.log(${params})
                    //首次不执行
                    console.log("${param.bodyId}");
                    if (!first) {
                        //实现分页信息的刷新
                        <%--location.href = "sysOrg/page?pageByCondition=" + obj.curr + "&size=" + obj.limit +--%>
                        <%--    "$orgNma=${org.orgName}";--%>
                        //异步提交

                        $("#${param.bodyId}").load("${url}?current=" + obj.curr + "&size=" + obj.limit,
                            // getQueryConditionParam()
                            ${params}
                        );
                    }
                }
            });
        });
    </script>
</head>
<body>

<div id="pager"></div>

</body>
</html>
