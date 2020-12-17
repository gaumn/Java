<%--
  Created by IntelliJ IDEA.
  User: gaumn
  Date: 2020/10/9
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base href="<%=basePath%>">
<head>
    <link rel="icon" href="../../img/48.png" type="image/x-icon">
    <title>菜单</title>
    <link rel="stylesheet" href="../../plugin/layui/css/layui.css" media="all">
    <script src="../../plugin/layui/layui.js"></script>
</head>
<body class="layui-layout-body">

<div class="layui-layout-admin" >
    <div class="layui-header" >
        <div class="layui-logo">不知道叫啥名</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"> <a href="test7.html">test7</a></li>
            <li class="layui-nav-item"> <a href="main.html">main</a> </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"> <a href="javascript:;">
                <img src="../../img/two.jpg" class="layui-nav-img">
                贤心
            </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree "   lay-filter="test" >
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">权限列表</a>
                    <dl class="layui-nav-child">
                        <dd><a href="test.html">权限一</a></dd>
                        <dd><a href="test2.html">权限二</a></dd>
                        <dd><a href="test3.html">权限三</a></dd>
                        <dd><a href="test4.html">权限四</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">个人积分</a></li>
                <li class="layui-nav-item"><a href="">商城</a></li>
            </ul>
        </div>
    </div>
    <div class="layui-footer"></div>
</div>
<script>
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
