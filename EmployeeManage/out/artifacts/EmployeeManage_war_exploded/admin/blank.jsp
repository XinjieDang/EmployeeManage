
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
    $(document).ready(function(){
        $("ul li:eq(0)").addClass("active");
    });
</script>

    <ul class="breadcrumbs">
        <li><a href="#"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
        <li>Dashboard</li>
        <li class="right">
            <a href="" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-tint"></i> Color Skins</a>
            <ul class="dropdown-menu pull-right skin-color">
                <li><a href="default">Default</a></li>
                <li><a href="navyblue">Navy Blue</a></li>
                <li><a href="palegreen">Pale Green</a></li>
                <li><a href="red">Red</a></li>
                <li><a href="green">Green</a></li>
                <li><a href="brown">Brown</a></li>
            </ul>
        </li>
    </ul>

    <div class="pageheader">

        <div class="pageicon"><span class="iconfa-laptop"></span></div>
        <div class="pagetitle">
            <h5>All Features Summary</h5>
            <h1>Dashboard</h1>
        </div>
    </div><!--pageheader-->

    <div class="maincontent">
        <div class="maincontentinner">
            <div class="row-fluid">
                <div class="span9" style="font-size:15px;font-weight: bold;padding: 5px;color: black">
                    <ul class="nav nav-list">
                        <li class="nav-header">系统统计信息</li>
                        <li><a href="#"><span class="iconsweets-admin"></span>&nbsp;${user_count}人</a></li>
                        <li><a href="#"><span class=" iconsweets-users2"></span>&nbsp;${count_staff}人</a></li>
                    </ul>
                </div>

            </div><!--row-fluid-->
        </div><!--maincontentinner-->
    </div><!--maincontent-->

