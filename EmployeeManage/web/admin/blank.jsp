<%--
  Created by IntelliJ IDEA.
  User: Ryan
  Date: 2020/9/21
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
    $(document).ready(function(){
        $("ul li:eq(0)").addClass("active");
    });
</script>
    <ul class="breadcrumbs">
        <li><a href="dashboard.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
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
            </div><!--row-fluid-->

            <div class="footer">
                <div class="footer-left">
                    <span>&copy; 2020. Shamcey Admin Template. All Rights Reserved.</span>
                </div>
                <div class="footer-right">
                    <span>Designed by: <a href="http://themepixels.com/">ThemePixels</a></span>
                </div>
            </div><!--footer-->

        </div><!--maincontentinner-->
    </div><!--maincontent-->

