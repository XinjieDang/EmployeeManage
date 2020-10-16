
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<style>
    .msg{ font-size: 13px; }
    .onError{ color: red; }
    .onSuccess{ color: green; }
</style>
<ul class="breadcrumbs">
    <li><a href="../dashboard.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
    <li><a href="../forms.html">Forms</a> <span class="separator"></span></li>
    <li>Wizard Forms</li>

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
        <h5></h5>
        <h1>添加管理员</h1>
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
                <form class="stdform stdform2" method="post" action="Useroperate?action2=savaUser">
                    <p>
                        <label><font color="red">*</font>登录名：</label>
                        <span class="field"><input type="text" name="loginname" id="loginname" class="input-xxlarge" /></span>
                    </p>
                    <p>
                        <label><font color="red">*</font>管理员名称：</label>
                        <span class="field"><input type="text" name="username" id="username" class="input-xxlarge" /></span>
                    </p>

                    <p>
                        <label><font color="red">*</font>密码：</label>
                        <span class="field"><input type="password" name="password" id="password" class="input-xxlarge" /></span>
                    </p>
                    <p>
                        <label><font color="red">*</font>确认密码：</label>
                        <span class="field"><input type="password" class="input-xxlarge" name="pwd" id="pwd1" placeholder="请再次填写密码"><span id="tishi"></span></span>
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
<script>
    //表单未有信息时按钮默认不可用
    $("button").attr("disabled","disabled");
    //为表单元素添加失去焦点事件
    $("form :input").blur(function(){
        var $parent = $(this).parent();
        $parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）
        //验证登录姓名
        if($(this).is("#loginname")){
            var nameVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
            var regName = /[~#^$@%&!*()<>:;'"{}【】  ]/;
            if(nameVal == "" || nameVal.length < 5 || regName.test(nameVal)){
                var errorMsg = " 登录名非空，长度5位以上，不包含特殊字符！";
                $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                $('form').bind('submit',function(){
                    return false;
                })
            }
            else{
                var okMsg=" 输入正确";
                $parent.find(".high").remove();
                $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                $('form').unbind();
            }
        }
        //验证用户名
        if($(this).is("#username")){
            var usNameVal = $.trim(this.value);
            var regusName =/[~#^$@%&!*()<>:;'"{}【】  ]/;
            if(usNameVal == "" || usNameVal.length < 2 || regusName.test(usNameVal)){
                var errorMsg = " 用户名非空，长度2位以上，不包含特殊字符！";
                $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
            }
            else{
                var okMsg=" 输入正确";
                $parent.find(".high").remove();
                $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
            }
        }
        //验证密码
        if($(this).is("#password")){
            var pwdVal = $.trim(this.value);
            var regPwd =/[~#^$@%&!*()<>:;'"{}【】  ]/;
            if(pwdVal == "" || pwdVal.length < 6 ||pwdVal.length>11||regPwd.test(pwdVal)){
                var errorMsg = " 密码非空，长度6-10位，不包含特殊字符！";
                $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
            }
            else{
                var okMsg=" 输入正确";
                $parent.find(".high").remove();
                $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
            }
        }
        //验证两次输入的密码
        if($(this).is("#pwd1")){
            $("button").attr("disabled","disabled");
            var loginname = $("#loginname").val();
            var username = $("#username").val();
            var pwd = $("#password").val();
            var pwd1 = $("#pwd1").val();
            <!-- 对比两次输入的密码 -->
            if(pwd == pwd1&&loginname!=null&&username!=null)
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
    }).keyup(function(){
        //triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
        $(this).triggerHandler("blur");
    }).focus(function(){
        $(this).triggerHandler("blur");
    });

</script>