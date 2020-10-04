
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<%--<script type="text/javascript" src="static/js/jquery-2.1.0.min.js"></script>--%>
<ul class="breadcrumbs">
    <li><a href="../dashboard.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
    <li><a href="../forms.html">Forms</a> <span class="separator"></span></li>
    <li>职工更改密码</li>

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

    <div class="pageicon"><span class="iconfa-pencil"></span></div>
    <div class="pagetitle">
        <h5>Forms</h5>
        <h1>修改密码</h1>
    </div>
</div><!--pageheader-->

<div class="maincontent">
    <div class="maincontentinner">

        <!-- START OF DEFAULT WIZARD -->


        <div class="clearfix"></div><br /><br />

        <!-- START OF DEFAULT WIZARD (INVERSE)-->
        <div class="widgetbox box-inverse">
            <h4 class="widgettitle">Form Bordered</h4>
            <div class="widgetcontent nopadding">
                <form class="stdform stdform2" method="post" action="staffControl?action2=savaStaff&flag=2">
                    <!--  隐藏域 提交id-->
                    <input type="hidden" name="sta_id" value="${staff.sta_id}">
                    <p>
                        <label>职工名称：</label>
                        <span class="field"><input type="text" name="staname" value="${staff.staname}" id="staname" class="form-control bt" /></span>
                    </p>
                    <p>
                        <label>新密码：</label>
                        <span class="field"> <input type="password" class="form-control bt" name="password" id="pwd" placeholder="请设置登录密码"></span>
                    </p>
                    <p>
                        <label>确认新密码：</label>
                        <span class="field">    <input type="password" class="form-control bt" name="pwd" id="pwd1" placeholder="请再次填写密码" onkeyup="validate()"><span id="tishi"></span></span>
                    </p>
                    <p class="stdformbutton">
                        <button class="btn btn-primary" type="submit">确定</button>
                    </p>
                </form>
            </div><!--widgetcontent-->
        </div><!--widget-->

        <!-- END OF TABBED WIZARD -->



    </div><!--maincontentinner-->
</div><!--maincontent-->
<script >
    //密码校验
    $("button").attr("disabled","disabled");
    function validate() {
        var pwd = $("#pwd").val();
        var pwd1 = $("#pwd1").val();
        <!-- 对比两次输入的密码 -->
        if(pwd == pwd1)
        {
            $("#tishi").html("两次密码相同");
            $("#tishi").css("color","green");
            $("#xiugai").removeAttr("disabled");
            $("button").removeAttr("disabled");
        }
        else {
            $("#tishi").html("两次密码不相同");
            $("#tishi").css("color","red")
            $("button").attr("disabled","disabled");
        }
    }

</script>