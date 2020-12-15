<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>权限管理系统</title>
    <%@include file="common.jsp"%>
    <script>
        layui.use('layer');
        function logout() {
            layer.confirm('确定要退了?',{icon:3,title:'提示'},function (index) {
                location.href = "${path}/sysUser/logout";
            });
        }
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">权限管理系统</div>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${sessionScope.login_user.username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="javascript:void(0)" onclick="logout();">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <c:forEach items="${sessionScope.user_pers}" var="parent">
                    <c:if test="${parent.parentid == null}">
                        <li class="layui-nav-item layui-nav-itemed">
                            <a class="" href="javascript:;">${parent.text}</a>
                            <dl class="layui-nav-child">
                                <c:forEach items="${sessionScope.user_pers}" var="child">
                                    <c:if test="${child.parentid != null && child.parentid == parent.id}">
                                    <dd><a href="${path}/${child.url}" target="middle">${child.text}</a></dd>
                                    </c:if>
                                </c:forEach>
                            </dl>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <iframe src="" name="middle" width="100%" height="100%" frameborder="0"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="../src/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
