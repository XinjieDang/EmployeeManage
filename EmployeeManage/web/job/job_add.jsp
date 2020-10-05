
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
<style>
    .msg{ font-size: 13px; }
    .onError{ color: red; }
    .onSuccess{ color: green; }
</style>
<ul class="breadcrumbs">
    <li><a href="../dashboard.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
    <li><a href="../forms.html">Forms</a> <span class="separator"></span></li>
    <li>职位信息管理</li>

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
        <h5>新增职位信息</h5>
        <h1>新增职位信息</h1>
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
                <form class="stdform stdform2" method="post" action="jobControl?action2=savaJob">
                    <p>
                        <label><font color="red">*</font>职位名称：</label>
                        <span class="field"><input type="text" name="jobname" id="jobname" class="input-xxlarge" /></span>
                    </p>

                    <p>
                        <label><font color="red">*</font>职位描述：</label>
                        <span class="field"><input type="text" name="jobdescribe" id="jobdescribe" class="input-xxlarge" /></span>
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
        //验证部门名称
        if($(this).is("#jobname")){
            var adressVal = $.trim(this.value);
            var regadress =/^[\u4e00-\u9fa5a-z]+$/gi;
            if(adressVal == ""|| regadress.test(adressVal)==false){
                var errorMsg = "职位名称输入错误！";
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
        //验证部门描述
        if($(this).is("#jobdescribe")){
            var adressVal = $.trim(this.value);
            var regadress = /[~#^$@%&!*()<>:;'"{}【】  ]/;
            if(adressVal == ""|| regadress.test(adressVal)){
                var errorMsg = "职位描述输入错误！";
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
        $("button").removeAttr("disabled");


    }).keyup(function(){
        //triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
        $(this).triggerHandler("blur");
    }).focus(function(){
        $(this).triggerHandler("blur");
    });
</script>

