<%--
  Created by IntelliJ IDEA.
  User: gaumn
  Date: 2020/10/9
  Time: 20:02
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
    <link rel="icon" href="../img/48.png" type="image/x-icon">
    <title>注册页</title>
    <link rel="stylesheet" href="../plugin/layui/css/layui.css" media="all">
    <script src="../plugin/layui/layui.js"></script>
    <script src="../plugin/layui/extend/city-picker/city-picker.data.js"></script>
    <link href="../plugin/layui/extend/city-picker/city-picker.css" rel="stylesheet" />
    <script src="../plugin/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../plugin/css/web.css" />
    <script src="../plugin/js/city.js"></script>
    <style>
        .layui-login {
            width: 500px;
            height: auto;
            margin: 20px auto;
            border-radius: 4px;
            padding: 40px 50px;
            -moz-box-shadow: 1px 1px 6px #D6D6D6;
            -webkit-box-shadow: 1px 1px 6px #D6D6D6;
            box-shadow: 1px 1px 6px #D6D6D6;
            background-color: #FFFFFF;
        }

    </style>
</head>
<body>

<div class="layui-container">
    <div class="layui-login layui-anim layui-anim-scale">
        <div class="layui-top-title">
            <h3>用户注册</h3>
            <p>注释</p>
        </div>
        <h4 class="text-center" style="color:red">${error}</h4>
        <!-- 表单选项 -->
        <div class="layui-login-form" >
            <form class="layui-form" id="myForm" method="post" action="/integral/User/register" >
                <!-- 用户名  -->
                <div class="layui-form-item">
                    <div class="layui-inline" style="width: 100%">
                        <label class="layui-form-label"><i class=" layui-icon layui-icon-username"></i></label>
                        <div class="layui-input-block" style="width: 100%">
                            <input type="text" id="user" name="t_name" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <!-- 对号 -->
                    <i class="layui-icon" id="uri" style="color: green;font-weight: bolder;" hidden></i>
                    <!-- 错号 -->
                    <i class="layui-icon" id="uwr" style="color: red; font-weight: bolder;" hidden></i>
                </div>
                <!-- 密码    -->
                <div class="layui-form-item">
                    <div class="layui-inline" style="width: 100%">
                        <label class="layui-form-label"><i class=" layui-icon layui-icon-password"></i></label>
                        <div class="layui-input-block" style="width: 100%">
                            <input type="password" id="pwd" name="UserPwd" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <!-- 对号 -->
                    <i class="layui-icon" id="pri" style="color: green;font-weight: bolder;" hidden></i>
                    <!-- 错号 -->
                    <i class="layui-icon" id="pwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
                </div>
                <!-- 确认密码-->
                <div class="layui-form-item">
                    <div class="layui-inline" style="width: 100%">
                        <label class="layui-form-label"><i class=" layui-icon layui-icon-password"></i></label>
                        <div class="layui-input-block" style="width: 100%">
                            <input type="password" id="rpwd"  required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <!-- 对号 -->
                    <i class="layui-icon" id="rpri" style="color: green;font-weight: bolder;" hidden></i>
                    <!-- 错号 -->
                    <i class="layui-icon" id="rpwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
                </div>
                <!-- 学院   -->
                <div class="layui-form-item">
                    <div class="layui-inline" style="width: 100%">
                        <label class="layui-form-label "><i class="layui-icon layui-icon-template"></i> </label>
                        <div class="layui-input-block" style="width: 100%">
                            <input type="text" name="college" required  lay-verify="required" placeholder="请输入学院" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <!-- 班级   -->
                <div class="layui-form-item">
                    <div class="layui-inline" style="width: 100%">
                        <label class="layui-form-label"><i class="layui-icon layui-icon-component"></i> </label>
                        <div class="layui-input-block" style="width: 100%">
                            <input type="text" name="clbum" required  lay-verify="required" placeholder="请输入班级" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <!-- 真实姓名-->
                <div class="layui-form-item">
                    <div class="layui-inline" style="width: 100%">
                        <label class="layui-form-label "><i class="layui-icon layui-icon-user"></i></label>
                        <div class="layui-input-block" style="width: 100%">
                            <input type="text" name="UserName" required  lay-verify="required" placeholder="请输入真实姓名"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <!-- 地址   -->
                <div class="layui-form-item">
                    <div class="layui-inline" style="width: 100%">
                        <label class="layui-form-label"><i class="layui-icon layui-icon-location"></i></label>
                        <div class="layui-input-block">
                            <select id="province" name="address"></select>
                        </div>
                    </div>
                </div>
                <!-- 提交按钮 -->
                <div class="layui-form-item" align="right">
                    <div class="layui-input-block">
                        <input type="submit" id="sub" class="layui-btn layui-btn-normal layui-btn-radius"/>
                        <button  type="reset" class="layui-btn layui-btn-danger layui-btn-radius"  >重置</button>
                    </div>
                </div>
                <div  align="left">
                    <hr style="width: 100%" />
                    <a href="login.html" class="fl">已有账号？立即登录</a>
                    <a href="javascript:;" class="fr"style=" float: right">忘记密码？</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!--地址模块Javascript-->
<!--密码匹对环节Javascript-->
<script type="text/javascript">
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        $("#myForm")[0].reset();
        //……
        //更改提交按钮的名称
        $("#sub").val("立即注册");
        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        form.render();

        $('#rpwd').blur(function() {
            if($('#pwd').val() != $('#rpwd').val()){
                $('#rpwr').removeAttr('hidden');
                $('#rpri').attr('hidden','hidden');
                layer.msg('两次输入密码不一致!');
            }else {
                $('#rpri').removeAttr('hidden');
                $('#rpwr').attr('hidden','hidden');
            };
        });
        $("#sub").click(function(){
            if($('#pwd').val() != $('#rpwd').val()){
                alert("两次密码不一致!");
                $('#pwd').val();
                $('#rpwd').val();
                return false;
            }
        });
        var pHtmlStr = '';
        for(var name in pc){
            pHtmlStr = pHtmlStr + '<option>'+name+'</option>';
        }
        $("#province").html(pHtmlStr);
        $("#province").change(function(){
            var pname = $("#province option:selected").text();
            var pHtmlStr = '';
            var cityList = pc[pname];
            for(var index in cityList){
                pHtmlStr = pHtmlStr + '<option>'+cityList[index]+'</option>';
            }
            $("#city").html(pHtmlStr);
        });
        $("#province").change();

    });

</script>

</body>
</html>
