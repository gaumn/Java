<%--
  Created by IntelliJ IDEA.
  User: gaumn
  Date: 2020/10/9
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>登录界面</title>
    <link rel="stylesheet" href="../plugin/layui/css/layui.css" media="all">
    <script src="../plugin/layui/layui.js"></script>
    <script src="../plugin/layui/extend/city-picker/city-picker.data.js"></script>
    <link href="../plugin/layui/extend/city-picker/city-picker.css" rel="stylesheet" />
    <script src="../plugin/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../plugin/css/web.css" />
    <script src="../plugin/js/jQuery.md5.js"></script>
    <script>
        $(function(){
            $("#loginBut").bind("click",function(){
                var v_md5password=$.md5($("#password").val());
                alert(v_md5password)
                $("#md5Password").val(v_md5password)
            })
        })
    </script>
</head>
<body>

<form  method="post" action="/integral/sysUser/login">
    账号<input type="text" name="username"><br>
    密码<input type="text"  id="password"><br>
    <input type="hidden" name="password" id="md5Password">
    <input type="submit" value="登录" id="loginBut">
</form>

</body>
</html>
