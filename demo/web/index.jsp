<%--
  Created by IntelliJ IDEA.
  User: Ryan
  Date: 2020/9/20
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
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
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            $("ul li:eq(0)").addClass("active");
        });
    </script>
</head>

<body>

<div class="mainwrapper">

    <div class="header">
        <div class="logo">
            <a href="dashboard.html" class="vh_title">企业员工资料后台管理系统</a>
        </div>
        <div class="headerinner">
            <ul class="headmenu">
                <li class="right">
                    <div class="userloggedinfo">
                        <img src="static/images/photos/userImg.png" alt="" />
                        <div class="userinfo">
                            <h5>${user.username} <small>- 欢迎您</small></h5>
                            <ul>

                                <li><a href="">账户设置</a></li>
                                <li><a href="index.html">退出</a></li>
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
                <li class="active"><a href="#"><span class="iconfa-laptop"></span> 欢迎！</a></li>

                <li class="dropdown"><a href=""><span class="iconfa-pencil"></span>用户管理</a>
                    <ul style="display: block">
                        <li  class="active"><a href="${pageContext.request.contextPath }/userListServlet">用户信息信息列表</a></li>
                        <li><a href="Useroperate?action1=addUser">新建用户</a></li>
                    </ul>
                </li>

                <li class="dropdown"><a href=""><span class="iconfa-pencil"></span>部门管理</a>
                    <ul style="display: block">
                        <li  class="active"><a href="deptControl?action1=showlist">部门信息列表</a></li>
                        <li><a href="deptControl?action1=adddept">新建部门</a></li>
                    </ul>
                </li>

                <li class="dropdown"><a href=""><span class="iconfa-pencil"></span>职位管理</a>
                    <ul style="display: block">
                        <li  class="active"><a href="jobControl?action1=showlist">职位信息列表</a></li>
                        <li><a href="jobControl?action1=addjob">新建职位</a></li>
                    </ul>
                </li>

                <li class="dropdown"><a href=""><span class="iconfa-pencil"></span>职工管理</a>
                    <ul style="display: block">
                        <li  class="active"><a href="staffControl?action1=showlist">职工信息列表</a></li>
                        <li><a href="staffControl?action1=addStaff">新建职工</a></li>
                    </ul>
                </li>


            </ul>
        </div><!--leftmenu-->

    </div><!-- leftpanel -->


    <div class="rightpanel">
        <jsp:include page="${mainPage==null?'admin/blank.jsp':mainPage}"></jsp:include>
    </div>

</div><!--mainwrapper-->
<script type="text/javascript">
    jQuery(document).ready(function() {

        // simple chart
        var flash = [[0, 11], [1, 9], [2,12], [3, 8], [4, 7], [5, 3], [6, 1]];
        var html5 = [[0, 5], [1, 4], [2,4], [3, 1], [4, 9], [5, 10], [6, 13]];
        var css3 = [[0, 6], [1, 1], [2,9], [3, 12], [4, 10], [5, 12], [6, 11]];

        function showTooltip(x, y, contents) {
            jQuery('<div id="tooltip" class="tooltipflot">' + contents + '</div>').css( {
                position: 'absolute',
                display: 'none',
                top: y + 5,
                left: x + 5
            }).appendTo("body").fadeIn(200);
        }


        var plot = jQuery.plot(jQuery("#chartplace"),
            [ { data: flash, label: "Flash(x)", color: "#6fad04"},
                { data: html5, label: "HTML5(x)", color: "#06c"},
                { data: css3, label: "CSS3", color: "#666"} ], {
                series: {
                    lines: { show: true, fill: true, fillColor: { colors: [ { opacity: 0.05 }, { opacity: 0.15 } ] } },
                    points: { show: true }
                },
                legend: { position: 'nw'},
                grid: { hoverable: true, clickable: true, borderColor: '#666', borderWidth: 2, labelMargin: 10 },
                yaxis: { min: 0, max: 15 }
            });

        var previousPoint = null;
        jQuery("#chartplace").bind("plothover", function (event, pos, item) {
            jQuery("#x").text(pos.x.toFixed(2));
            jQuery("#y").text(pos.y.toFixed(2));

            if(item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;

                    jQuery("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(2),
                        y = item.datapoint[1].toFixed(2);

                    showTooltip(item.pageX, item.pageY,
                        item.series.label + " of " + x + " = " + y);
                }

            } else {
                jQuery("#tooltip").remove();
                previousPoint = null;
            }

        });

        jQuery("#chartplace").bind("plotclick", function (event, pos, item) {
            if (item) {
                jQuery("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
                plot.highlight(item.series, item.datapoint);
            }
        });


        //datepicker
        jQuery('#datepicker').datepicker();

        // tabbed widget
        jQuery('.tabbedwidget').tabs();



    });
</script>
</body>
</html>
