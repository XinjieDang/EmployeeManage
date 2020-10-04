
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Shamcey - 企业员工资料管理系统</title>
    <link rel="stylesheet" href="static/css/style.default.css" type="text/css"/>
    <link rel="stylesheet" href="static/css/style.shinyblue.css" type="text/css"/>
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/js/jquery-migrate-1.1.1.min.js"></script>
    <script type="text/javascript" src="static/js/jquery-ui-1.9.2.min.js"></script>
    <script type="text/javascript" src="static/js/modernizr.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="static/js/custom.js"></script>
    <script type="text/javascript">
        //验证码刷新，获取验证码路径，加上时间戳
        function refreshCode() {
            //1、获取验证码图片对象
            var vcode = document.getElementById("vcode");
            //2、设置验证src属性，加上时间戳
            vcode.src = "${pageContext.request.contextPath}/checkCodeServlet?time=" + new Date().getTime();
        }
    </script>
    <script>
        //验证用户名和密码
        jQuery(document).ready(function () {
            jQuery('#login').submit(function () {
                var u = jQuery('#username').val();
                var p = jQuery('#password').val();
                if (u == '' && p == '') {
                    jQuery('.login-alert').fadeIn();
                    return false;
                }
            });
        });
    </script>

</head>
<body class="loginpage" style="background: #fbeed5;">
<div class="loginpanel">
    <div class="loginpanelinner">
        <div class="logo animate0 bounceIn"><span class="field"
                                                  style="font-weight: bold;font-size: 24px;">登录到您的账户</span></div>
        <form id="login" action="${pageContext.request.contextPath}/loginServlet" method="post">
            <div class="inputwrapper login-alert">
                <div class="alert alert-error">用户名或者密码不能为空，请重新输入</div>
            </div>
            <div class="inputwrapper animate1 bounceIn">
                <input type="text" style="height: 29px;margin-bottom:30px;width: 290px; " name="loginname" id="loginname"
                       placeholder="用户名"/>
            </div>
            <div class="inputwrapper animate2 bounceIn">
                <input type="password" style="height: 29px;width: 290px; " name="password"
                       id="password" placeholder="密码"/>
            </div>
          <div class="form-inline">


            <input type="text" style="height: 29px;margin-bottom:20px; " name="verifycode" class="form-control"
                   id="verifycode" placeholder="请输入验证码" style="width: 120px;"/>
            <a href="javascript:refreshCode()">
              <img src="${pageContext.request.contextPath }/checkCodeServlet"
                   style="height: 30px;padding-top: 20px;" title="看不清点击刷新"
                   id="vcode"/>
            </a>


          </div>
          <div style="font-size: 12px;margin-top: 5px;margin-bottom: 15px;">
            <span>选择登录角色:</span>
            <span class="formwrapper">
            <input type="radio" name="role" value="1" checked="checked"/><span class="iconsweets-admin"></span> &nbsp; &nbsp;
            <input type="radio" name="role" value="2" checked="checked" /><span class="iconsweets-users2"></span> &nbsp; &nbsp;
          </span>
          </div>

          <div class="inputwrapper animate3 bounceIn">
                <button class="btn btn-info alertinfo" name="submit">登录</button>
            </div>
        </form>
        <strong>${login_msg}</strong>

    </div><!--loginpanelinner-->
</div><!--loginpanel-->

<div class="loginfooter">
    <p>&copy; 2020. Shamcey Admin Template. All Rights Reserved.</p>
</div>

</body>
</html>
