<%--
  Created by IntelliJ IDEA.
  User: gaumn
  Date: 2021/2/26
  Time: 21:28
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
    <link rel="icon" href="../img/48.png" type="image/x-icon">
    <title>个人信息</title>
    <link rel="stylesheet" href="../plugin/layui/css/layui.css" media="all">
    <script src="../plugin/layui/layui.js"></script>
    <script src="../plugin/layui/extend/city-picker/city-picker.data.js"></script>
    <link href="../plugin/layui/extend/city-picker/city-picker.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../plugin/css/web.css" />
    <script type="text/javascript" src="../plugin/js/jquery.min.js" ></script>
    <script  type="text/javascript" src="../plugin/js/jQuery.md5.js" ></script>
</head>
<body>
<h4 class="text-center" style="color:red">${T_name}</h4>
<h4 class="text-center" style="color:red">${UserName}</h4>
<h4 class="text-center" style="color:red">${UserPwd}</h4>
<h4 class="text-center" style="color:red">${Address}</h4>
<h4 class="text-center" style="color:red">${Score}</h4>
<h4 class="text-center" style="color:red">${FreezingScore}</h4>
<h4 class="text-center" style="color:red">${College}</h4>
<h4 class="text-center" style="color:red">${Clbum}</h4>
</body>
</html>
