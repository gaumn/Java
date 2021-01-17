<%--
  Created by IntelliJ IDEA.
  User: gaumn
  Date: 2020/12/16
  Time: 15:29
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
    <title>success</title>
</head>
<body>

<h3>MyName数据</h3><br/>

</body>
</html>
