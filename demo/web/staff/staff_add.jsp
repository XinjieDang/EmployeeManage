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
    <form action="../results.html" method="post" class="searchbar">
        <input type="text" name="keyword" placeholder="To search type and hit enter..." />
    </form>
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
                        <span class="field"><input type="text" name="staname" id="username" class="input-xxlarge" /></span>
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
                        <span class="field"><select name="education" id="education" class="uniformselect">
                                    <option value="">选择学历</option>
                                    <option value="博士">博士</option>
                                    <option value="硕士">硕士</option>
                                    <option value="本科">本科</option>
                                    <option value="专科">专科</option>
                                </select></span>
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

        <div class="footer">
            <div class="footer-left">
                <span>&copy; 2013. Shamcey Admin Template. All Rights Reserved.</span>
            </div>
            <div class="footer-right">
                <span>Designed by: <a href="http://themepixels.com/">ThemePixels</a></span>
            </div>
        </div><!--footer-->


    </div><!--maincontentinner-->
</div><!--maincontent-->


