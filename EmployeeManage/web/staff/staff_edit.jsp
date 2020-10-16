<%@ page import="domain.Job" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.Department" %>
<%@ page import="domain.Staff" %><%--
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
        <h5>修改职工信息</h5>
        <h1>修改职工信息</h1>
    </div>
</div><!--pageheader-->

<div class="maincontent">
    <div class="maincontentinner">

        <!-- START OF DEFAULT WIZARD -->


        <div class="clearfix"></div><br /><br />

        <!-- START OF DEFAULT WIZARD (INVERSE)-->
        <div class="widgetbox box-inverse">
            <h4 class="widgettitle">修改员工信息</h4>
            <div class="widgetcontent nopadding">
                <form class="stdform stdform2" method="post" action="staffControl?action2=savaStaff&flag=1">
                    <!--  隐藏域 提交id-->
                    <input type="hidden" name="sta_id" value="${stas.sta_id}">
                    <p>
                        <label><font color="red">*</font>职工登录账号：</label>
                        <span class="field"><input type="text" name="loginname" value="${stas.loginname}" id="loginname" class="input-xxlarge" /></span>
                    </p>
                    <p>
                        <label><font color="red">*</font>职工登录密码：</label>
                        <span class="field"><input type="text" name="password" value="${stas.password}" id="password" class="input-xxlarge" /></span>
                    </p>
                    <p>
                        <label><font color="red">*</font>职工姓名：</label>
                        <span class="field"><input type="text" name="staname" value="${stas.staname}" id="username" class="input-xxlarge" /></span>
                    </p>

                    <p>
                        <label><font color="red">*</font>性别：</label>
                        <span class="formwrapper">
                            	<input type="radio" name="sex" value="1" ${stas.sex eq"1"? select:""} checked="checked"/> 男 &nbsp; &nbsp;
                                <input type="radio" name="sex" value="2" ${stas.sex eq"2"? select:""} checked="checked" /> 女 &nbsp; &nbsp;
                        </span>
                    </p>
                    <p>
                        <label><font color="red">*</font>年龄：</label>
                        <span class="field"><input type="text" name="age" value="${stas.age}" id="age" class="input-xxlarge" /></span>
                    </p>
                    <p>
                        <label><font color="red">*</font>选择部门</label>
                        <span class="field">
                  <select id="dep_id" name="dep_id" class="uniformselect">
                      <%
                          List<Department> dept_staff= (ArrayList<Department>)request.getAttribute("dept_staff");
                          for (Department dept : dept_staff) {%>
                            <option value="<%=dept.getDep_id()%>" <c:if test="${stas.dep_id}==<%=dept.getDep_id()%>"></c:if><%=dept.getDepname() %></option>
                      <%
                          }
                      %>

                  </select>

                        </span>
                    </p>


                    <p>
                        <label><font color="red">*</font>选择职位</label>
                        <span class="field">
                 <select id="job_id" name="job_id" class="uniformselect">
                      <%
                          List<Job> job_staff= (ArrayList<Job>)request.getAttribute("job_staff");
                          for (Job job : job_staff) {%>
                            <option value="<%=job.getJob_id()%>" <c:if test="${stas.job_id == line.job_id }"></c:if><%=job.getJobname() %></option>
                            <%
                                }
                            %>
                  </select>
                        </span>
                    </p>

                    <p>
                        <label><font color="red">*</font>身份证号码：</label>
                        <span class="field"><input type="text" name="IDcard" value="${stas.IDcard}" id="IDcard" class="input-xxlarge" /></span>
                    </p>

                    <p>
                        <label><font color="red">*</font>学历</label>
                        <span class="field"><select name="education" id="education" class="uniformselect">
                            <option value="">选择学历</option>
                            <option value="博士" ${stas.education eq "博士"?"selected":"" }>博士</option>
                            <option value="硕士" ${stas.education eq "硕士"?"selected":"" }>硕士</option>
                            <option value="本科" ${stas.education eq "本科"?"selected":"" }>本科</option>
                            <option value="专科" ${stas.education eq "专科"?"selected":"" }>专科</option>
                        </select>
                        </span>
                    </p>

                    <p>
                        <label><font color="red">*</font>籍贯：</label>
                        <span class="field"><input type="text" name="adress" value="${stas.adress}" id="adress" class="input-xxlarge" /></span>
                    </p>


                    <p>
                        <label><font color="red">*</font>联系电话：</label>
                        <span class="field"><input type="text" name="tel" value="${stas.tel}" id="tel" class="input-xxlarge" /></span>
                    </p>

                    <p>
                        <label><font color="red">*</font>入职日期：</label>
                        <span class="field"><input type="date" name="cre_date" value="${stas.cre_date}" id="cre_date" placeholder="yyyy-MM-dd" placeholder="请输入入学日期"  style="margin-top:5px;height:30px;"  class="input-xxlarge" /></span>
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



