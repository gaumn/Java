<%--
  Created by IntelliJ IDEA.
  User: gaumn
  Date: 2020/10/9
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%--jsp找不到js资源--%>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base href="<%=basePath%>">
<head>
    <title>登录界面</title>
    <link rel="stylesheet" href="../plugin/layui/css/layui.css" media="all">
    <script src="../plugin/layui/layui.js"></script>
    <script src="../plugin/layui/extend/city-picker/city-picker.data.js"></script>
    <link href="../plugin/layui/extend/city-picker/city-picker.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../plugin/css/web.css" />
    <script type="text/javascript" src="../plugin/js/jquery.min.js" ></script>
    <script  type="text/javascript" src="../plugin/js/jQuery.md5.js" ></script>
    <script type="text/javascript">
        $(function(){
            $("#loginBut").bind("click",function(){
                var v_md5password=$.md5($("#password").val());
                // alert(v_md5password)
                $("#md5Password").val(v_md5password)
            })
        })
    </script>
</head>
<div class="layui-container " >
    <div class="layui-login layui-anim layui-anim-scale">
        <div class="layui-top-title">
            <h3>登录</h3>
            <p>注释</p>
        </div>
        <!-- 表单选项 -->
        <div class="layui-login-form">
            <form class="layui-form" id="myForm" method="post"action="/integral/sysUser/login" >
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i></label>
                    <div class="layui-input-block">
                        <input type="text" name="username" required lay-verify="required" placeholder="请输入用户名/账号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
                    <div class="layui-input-block">
                        <input type="password" id="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        <input type="hidden" name="password" id="md5Password">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type="submit" value="登录" class="layui-btn layui-btn-fluid" id="loginBut">
                    </div>
                </div>
                <div  align="left">
                    <hr style="width: 100%" />
                    <a href="/integral/sysUser/register" class="fl">没有账号？立即注册</a>
                    <a href="javascript:;" class="fr"style=" float: right">忘记密码？</a>
                </div>
            </form>
        </div>
    </div>
</div>



<script type="text/javascript">
    layui.define(['layer', 'form','jquery'], function(exports){
        var $ = layui.$
        var layer = layui.layer
            ,form = layui.form;
        exports('login', {});
    });
</script>

</body>
</html>
