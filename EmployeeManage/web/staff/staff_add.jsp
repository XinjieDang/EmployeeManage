<%@ page import="domain.Job" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.Department" %><%--
  Created by IntelliJ IDEA.
  User: Ryan
  Date: 2020/9/22
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
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
    //自定义表单验证
    jQuery(document).ready(function(){
        //为表单元素添加失去焦点事件
        $("form :input").blur(function() {
            var $parent = $(this).parent();
            $parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）
            //验证姓名
            if ($(this).is("#staname")) {
                var nameVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
                var regName = /[~#^$@%&!*()<>:;'"{}【】  ]/;
                if (nameVal == "" || nameVal.length < 6 || regName.test(nameVal)) {
                    var errorMsg = " 姓名非空，长度6位以上，不包含特殊字符！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span style='color: red' class='msg onError'>" + errorMsg + "</span>");
                } else {
                    var okMsg = " 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span  style='color: green' class='msg onSuccess'>" + okMsg + "</span>");
                }
            }

            //验证年龄
            if ($(this).is("#ages")) {
                var ageVal =$.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")

                var regName = /[~#^$@%&!*()<>:;'"{}【】  ]/;//验证是否输入特殊符号
                // if(ageVal>120||ageVal<0){
                //     var errorMsg = " 请输入0~120 的年龄";
                //     $parent.append("<span style='color: red' class='msg onError'>" + errorMsg + "</span>");
                // }

                if (ageVal == "" || ageVal.length < 6 || regName.test(ageVal)) {
                    var errorMsg = " 年龄非空，长度6位以上，不包含特殊字符！";
                    //class='msg onError' 中间的空格是层叠样式的格式
                    $parent.append("<span style='color: red' class='msg onError'>" + errorMsg + "</span>");
                } else {
                    var okMsg = " 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span  style='color: green' class='msg onSuccess'>" + okMsg + "</span>");
                }
            }

        })
    })
</script>

