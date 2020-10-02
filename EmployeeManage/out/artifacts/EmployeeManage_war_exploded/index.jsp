
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shamcey -Shamcey - 企业员工资料管理系统</title>
    <link rel="stylesheet" href="static/css/style.default.css" type="text/css" />
    <link rel="stylesheet" href="static/css/responsive-tables.css">
    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/js/jquery-migrate-1.1.1.min.js"></script>
    <script type="text/javascript" src="static/js/jquery-ui-1.9.2.min.js"></script>
    <script type="text/javascript" src="static/js/modernizr.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="static/js/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="static/js/flot/jquery.flot.min.js"></script>
    <script type="text/javascript" src="static/js/flot/jquery.flot.resize.min.js"></script>
    <script type="text/javascript" src="static/js/responsive-tables.js"></script>
    <script type="text/javascript" src="static/js/custom.js"></script>
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
    <style>
        .vh_title{
            color: #F8F8FF;
            font-size: 18px;
        }

        .foter{
            font-size: 11px;
            color: #666;
            padding-top: 15px;
            margin-bottom: 20px;
            overflow: hidden;
            clear: both;
            border-top: 0;
        }
    </style>
</head>

<body>

<div class="mainwrapper">

    <div class="header" style="background: 	#080808">
        <div class="logo">
            <span class="field" style="font-weight: bold;font-size: 20px;color: #EEE9E9">企业员工资料管理系统</span>
        </div>
        <div class="headerinner">
            <ul class="headmenu">
                <li class="right">
                    <div class="userloggedinfo">
                        <img src="static/images/photos/userImg.png" alt="" />
                        <div class="userinfo">
                            <h5>${user.username} <small>- 欢迎您</small></h5>
                            <ul>

                                <li><a href="Useroperate?action1=findUser&userId=${user.id}">账户设置</a></li>
                                <li><a href="Useroperate?action1=exit">退出</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul><!--headmenu-->
        </div>
    </div>

    <div class="leftpanel">

        <div class="leftmenu">
            <ul class="nav nav-tabs nav-stacked">
                <li class="nav-header">Navigation</li>
                <li class="active"><a href="index.jsp"><span class="iconfa-laptop"></span>首页</a></li>
                <li class="dropdown"><a href=""><span class="iconfa-pencil"></span>用户管理</a>
                    <ul style="display: block">
                        <li><a href="${pageContext.request.contextPath }/userListServlet">用户信息信息列表</a></li>
                        <li><a href="Useroperate?action1=addUser">新建用户</a></li>
                    </ul>
                </li>

                <li class="dropdown"><a href=""><span class="iconfa-pencil"></span>部门管理</a>
                    <ul style="display: block">
                        <li><a href="deptControl?action1=showlist">部门信息列表</a></li>
                        <li><a href="deptControl?action1=adddept">新建部门</a></li>
                    </ul>
                </li>

                <li class="dropdown"><a href=""><span class="iconfa-pencil"></span>职位管理</a>
                    <ul style="display: block">
                        <li><a href="jobControl?action1=showlist">职位信息列表</a></li>
                        <li><a href="jobControl?action1=addjob">新建职位</a></li>
                    </ul>
                </li>

                <li class="dropdown"><a href=""><span class="iconfa-pencil"></span>职工管理</a>
                    <ul style="display: block">
                        <li><a href="staffControl?action1=showlist">职工信息列表</a></li>
                        <li><a href="staffControl?action1=addStaff">新建职工</a></li>
                    </ul>
                </li>


            </ul>
        </div><!--leftmenu-->

    </div><!-- leftpanel -->


    <div class="rightpanel">
        <jsp:include page="${mainPage==null?'admin/blank.jsp':mainPage}"></jsp:include>
    </div>

    <div class="foter footer">
        <div class="footer-left">
            <span>&copy; 2020. Shamcey Admin Template. </span>
        </div>
        <div class="footer-right">
            <span>Designed by: <a href="http://themepixels.com/">ThemePixels</a></span>
        </div>
    </div><!--footer-->

</div><!--mainwrapper-->
<script type="text/javascript">
    jQuery(document).ready(function() {
        $(".leftmenu ul li").click(function(){
            $(".leftmenu ul li").removeClass("active");
            $(this).addClass("active");
        });
    });
</script>
</body>
</html>
