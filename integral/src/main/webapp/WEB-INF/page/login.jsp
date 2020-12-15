<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <%@include file="common.jsp"%>
</head>
<body>

<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-sm-offset3 layui-col-md6">
            <h2>用户登录</h2>
            <hr>
            <form id="hello" class="layui-form" action="${path}/sysUser/login" method="post">
                <div class=" layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" autofocus name="username" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <button type="submit" onclick="subForm();return false;" class="layui-btn layui-btn-success layui-btn-fluid">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    layui.use('layer');
    function subForm() {
        var params = $("#hello").serialize();
        $.post("${path}/sysUser/login",params,function (data) {
            if(data.code != 0){
                layui.layer.msg(data.msg,{icon:5});
            }else{
                layui.layer.msg("登录成功",{icon:1,time:1000},function () {
                    location.href = "${path}/sysUser/main";
                });

            }
        });
    }
</script>
</body>
</html>
