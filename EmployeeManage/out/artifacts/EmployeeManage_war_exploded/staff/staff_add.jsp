<%@ page import="domain.Job" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.Department" %>
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
    <li>职工信息管理</li>
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
        <h5>新增职工信息</h5>
        <h1>新增职工信息</h1>
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
                <form class="stdform stdform2" method="post" action="staffControl?action2=savaStaff">
                    <p>
                        <label><font color="red">*</font>职工登录账号：</label>
                        <span class="field"><input type="text" name="loginname" id="loginname" class="input-xxlarge" /></span>
                    </p>
                    <p>
                        <label><font color="red">*</font>职工登录密码：</label>
                        <span class="field"><input type="password" name="password" id="password" class="input-xxlarge" /></span>
                    </p>
                    <p>
                        <label><font color="red">*</font>确认登录密码：</label>
                        <span class="field"><input type="password" name="password" id="pwd1" class="input-xxlarge" /></span>
                    </p>
                    <p>
                        <label><font color="red">*</font>职工姓名：</label>
                        <span class="field"><input type="text" name="staname" id="staname" class="input-xxlarge" /></span>
                    </p>

                    <p>
                        <label><font color="red">*</font>性别：</label>
                        <span class="formwrapper">
                            	<input type="radio" name="sex" value="1" checked="checked"/> 男 &nbsp; &nbsp;
                                <input type="radio" name="sex" value="2" checked="checked" /> 女 &nbsp; &nbsp;
                        </span>

                    </p>

                    <p>
                        <label><font color="red">*</font>年龄：</label>
                        <span class="field"><input type="text" name="age" id="age" class="input-xxlarge" /></span>
                    </p>


                    <p>
                        <label><font color="red">*</font>选择部门</label>
                        <span class="field">
<%--                            <select name="dep_id" id="dep_id" class="uniformselect">--%>
<%--                                     <c:forEach items="${requestScope.dept_list}" var="line" varStatus="stat">--%>
<%--                                         <option value="${line.dep_id}" <c:if test="${staffs.dep_id == line.dep_id }">selected</c:if>${line.depname}</option>--%>
<%--                                     </c:forEach>--%>
<%--                                </select>--%>

                             <select name="dep_id" id="dep_id" class="uniformselect">
                            <%
                                List<Department> dept_list= (ArrayList<Department>)request.getAttribute("dept_list");
                                for (Department dept : dept_list) {%>
                            <option value="<%=dept.getDep_id()%>"><%=dept.getDepname()%></option>
                            <%
                                }
                            %>
                        </select>
                        </span>
                    </p>

                    <p>
                        <label><font color="red">*</font>选择职位</label>
                        <span class="field">
<%--                            <select name="job_id" id="job_id" class="uniformselect">--%>
<%--                                     <c:forEach items="${requestScope.job_list}" var="line" varStatus="stat">--%>
<%--                                         <option value="${line.job_id}" <c:if test="${staffs.job_id == line.job_id }">selected</c:if>${line.staname}</option>--%>
<%--                                     </c:forEach>--%>
<%--                                </select>--%>

                             <select name="job_id" id="job_id" class="uniformselect">
                            <%
                                List<Job> jobList= (ArrayList<Job>)request.getAttribute("job_list");
                                for (Job job : jobList) {%>
                            <option value="<%=job.getJob_id()%>"><%=job.getJobname() %></option>
                            <%
                                }
                            %>
                        </select>
                        </span>


                    </p>


                    <p>
                        <label><font color="red">*</font>身份证号码：</label>
                        <span class="field"><input type="text" name="IDcard" id="IDcard" class="input-xxlarge" /></span>
                    </p>


<%--                    <p>--%>
<%--                        <label><font color="red">*</font>学历：</label>--%>
<%--                        <span class="field"><input type="text" name="education" id="education" class="input-xxlarge" /></span>--%>
<%--                    </p>--%>

                    <p>
                        <label><font color="red">*</font>学历</label>
                        <span class="field">
                            <select name="education" id="education" class="uniformselect">
                                    <option value="">选择学历</option>
                                    <option value="博士">博士</option>
                                    <option value="硕士">硕士</option>
                                    <option value="本科">本科</option>
                                    <option value="专科">专科</option>
                                </select>
                        </span>
                    </p>


                    <p>
                        <label><font color="red">*</font>籍贯：</label>
                        <span class="field"><input type="text" name="adress" id="adress" class="input-xxlarge" /></span>
                    </p>


                    <p>
                        <label><font color="red">*</font>联系电话：</label>
                        <span class="field"><input type="text" name="tel" id="tel" class="input-xxlarge" /></span>
                    </p>

                    <p>
                        <label><font color="red">*</font>入职日期：</label>
                        <span class="field"><input type="date" name="cre_date" id="cre_date" placeholder="yyyy-MM-dd" placeholder="请输入入学日期"  style="margin-top:5px;height:30px;"  class="input-xxlarge" /></span>
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
        //验证职工登录账号
        if($(this).is("#loginname")){
            var nameVal = $.trim(this.value); //原生js去空格方式
            var regName = /[~#^$@%&!*()<>:;'"{}【】  ]/;
            if(nameVal == "" || nameVal.length < 6 || regName.test(nameVal)){
                var errorMsg = " 职工登录账号名非空，长度6位以上，不包含特殊字符！";
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

        //验证密码
        if($(this).is("#password")){
            var pwdVal = $.trim(this.value);
            var regPwd =/[~#^$@%&!*()<>:;'"{}【】  ]/;
            if(pwdVal == "" || pwdVal.length < 4 || regPwd.test(pwdVal)){
                var errorMsg = " 密码非空，长度6位以上，不包含特殊字符！";
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
        //验证两次输入的密码
        if($(this).is("#pwd1")){
            $("button").attr("disabled","disabled");
            var loginname = $("#loginname").val();
            var staname = $("#staname").val();
            var pwd = $("#password").val();
            var pwd1 = $("#pwd1").val();
            <!-- 对比两次输入的密码 -->
            if(pwd == pwd1||pwd1!=""&&loginname!=""&&staname!="")
            {
                var okMsg=" 两次密码相同";
                $parent.find(".high").remove();
                $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                $("button").removeAttr("disabled");
            }
            else {
                var errorMsg = "两次密码不相同";
                $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                $("button").attr("disabled","disabled");
            }
        }
        //验证职工姓名
        if($(this).is("#staname")){
            var usNameVal = $.trim(this.value);
            var regusName =/[~#^$@%&!*()<>:;'"{}【】  ]/;
            if(usNameVal == "" || usNameVal.length < 2 || usNameVal.length >5|| regusName.test(usNameVal)){
                var errorMsg = " 用户名非空，长度2位以上，4位以下，不包含特殊字符！";
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
        //验证年龄
        if($(this).is("#age")){
            var ageVal = $.trim(this.value);
            var regusage =/[~#^$@%&!*()<>:;'"{}【】  ]/;
            if(ageVal == "" || ageVal<18||ageVal>60 || regusage.test(ageVal)){
                var errorMsg = " 年龄非空，区间在18~59岁，不包含特殊字符！";
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
        //验证身份证号

        if($(this).is("#IDcard")){
            var IDcardVal = $.trim(this.value);
            var regIDcard =/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
            if(regIDcard.test(IDcardVal)==false||IDcardVal==""){
                var errorMsg = "身份证输入错误！";
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
        //验证手机号
        if($(this).is("#tel")){
            var telVal = $.trim(this.value);
            var regItel =/^[1][3,4,5,7,8][0-9]{9}$/;
            if(telVal == "" ||telVal.length!=11|| regItel.test(telVal)){
                var errorMsg = "手机号输入错误！";
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
        //验证籍贯
        if($(this).is("#adress")){
            var adressVal = $.trim(this.value);
            var regadress =/^[\u4e00-\u9fa5a-z]+$/gi;
            if(adressVal == ""|| regadress.test(adressVal)==false){
                var errorMsg = "籍贯输入错误！";
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

    }).keyup(function(){
        //triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
        $(this).triggerHandler("blur");
    }).focus(function(){
        $(this).triggerHandler("blur");
    });

</script>