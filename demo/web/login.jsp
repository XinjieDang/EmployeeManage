<%--
  Created by IntelliJ IDEA.
  User: Ryan
  Date: 2020/9/20
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Shamcey - 企业员工资料管理系统</title>
  <link rel="stylesheet" href="static/css/style.default.css" type="text/css" />
  <link rel="stylesheet" href="static/css/style.shinyblue.css" type="text/css" />

  <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="static/js/jquery-migrate-1.1.1.min.js"></script>
  <script type="text/javascript" src="static/js/jquery-ui-1.9.2.min.js"></script>
  <script type="text/javascript" src="static/js/modernizr.min.js"></script>
  <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="static/js/jquery.cookie.js"></script>
  <script type="text/javascript" src="static/js/custom.js"></script>
  <script type="text/javascript">

    //验证码刷新，获取验证码路径，加上时间戳
    function refreshCode(){
      //1、获取验证码图片对象
      var vcode=document.getElementById("vcode");
      //2、设置验证src属性，加上时间戳
      vcode.src="${pageContext.request.contextPath}/checkCodeServlet?time="+new Date().getTime();
    }
  </script>
</head>

<body class="loginpage">
<div class="loginpanel">
  <div class="loginpanelinner">
    <div class="logo animate0 bounceIn"><h3 class="bg-primary">企业员工资料管理系统</h3></div>
    <form id="login" action="${pageContext.request.contextPath}/loginServlet" method="post">
      <div class="inputwrapper login-alert">
        <div class="alert alert-error">Invalid username or password</div>
      </div>
      <div class="inputwrapper animate1 bounceIn">
        <input type="text" name="username" id="username" placeholder="用户名" />
      </div>
      <div class="inputwrapper animate2 bounceIn">
        <input type="password" name="password" id="password" placeholder="密码" />
      </div>

      <div class="form-inline">
        <label for="vcode">验证码：</label>
        <input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码" style="width: 120px;"/>
        <a href="javascript:refreshCode()"><img src="${pageContext.request.contextPath }/checkCodeServlet" title="看不清点击刷新" id="vcode"/></a>
      </div>


      <div class="inputwrapper animate3 bounceIn">
        <button name="submit">登录</button>
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
