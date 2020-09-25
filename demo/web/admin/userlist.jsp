<%--
  Created by IntelliJ IDEA.
  User: Ryan
  Date: 2020/9/20
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <ul class="breadcrumbs">
        <li><a href="dashboard.html"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
        <li><a href="table-static.html">Tables</a> <span class="separator"></span></li>
        <li>用户信息列表</li>
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
        <div style="float: right;">
            <form class="searchbar" action="${pageContext.request.contextPath}/findUserByPageServlet" method="post">
                <div class="form-group">
                    <label for="exampleInputName2">姓名</label>
                    <input type="text" name="name" value="${condition.name[0]}" class="form-control" id="exampleInputName2" >
                </div>
                <div class="form-group">
                    <label for="exampleInputName3">籍贯</label>
                    <input type="text" name="address" value="${condition.address[0]}" class="form-control" id="exampleInputName3" >
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail2">邮箱</label>
                    <input type="text" name="email" value="${condition.email[0]}" class="form-control" id="exampleInputEmail2"  >
                </div>
                <button type="submit" class="btn btn-default">查询</button>
            </form>
        </div>
        <div class="pageicon"><span class="iconfa-table"></span></div>
        <div class="pagetitle">
            <h5>用户管理</h5>
            <h1>用户信息列表</h1>
        </div>
    </div><!--pageheader-->

    <div class="maincontent">
        <div class="maincontentinner">

            <h4 class="widgettitle">用户信息列表</h4>
            <table id="dyntable" class="table table-bordered table-infinite">
                <colgroup>
                    <col class="con0" style="align:center; width: 4%" />
                    <col class="con1" />
                    <col class="con0" />
                    <col class="con1" />
                    <col class="con0" />
                    <col class="con1" />
                </colgroup>
                <thead>
                <tr>
                    <th class="head0 nosort"><input type="checkbox" class="checkall" /></th>
                    <th class="head0">ID</th>
                    <th class="head1">用户名</th>
                    <th class="head0">密码</th>
                    <th>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
          <c:forEach var="user" items="${users}">
                <tr class="gradeX">
                    <td class="aligncenter"><span class="center">
                            <input type="checkbox" />
                          </span></td>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td class="centeralign">
                        &nbsp;<a href="Useroperate?action1=updatelUser" class="updatarow"><span class="icon-pencil"></span></a>&nbsp;
                        <a href="javascript:;" onclick="DelUser(${user.id})" class="del1eterow"><span class="icon-trash"></span></a>
                    </td>
                </tr>
          </c:forEach>
                </tbody>
            </table>

            <br /><br />

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



<script type="text/javascript">
    jQuery(document).ready(function(){
        prettyPrint();

        // check all checkboxes in table
        if(jQuery('.checkall').length > 0) {
            jQuery('.checkall').click(function(){
                var parentTable = jQuery(this).parents('table');
                var ch = parentTable.find('tbody input[type=checkbox]');
                if(jQuery(this).is(':checked')) {

                    //check all rows in table
                    ch.each(function(){
                        jQuery(this).attr('checked',true);
                        jQuery(this).parent().addClass('checked');	//used for the custom checkbox style
                        jQuery(this).parents('tr').addClass('selected'); // to highlight row as selected
                    });

                } else {

                    //uncheck all rows in table
                    ch.each(function(){
                        jQuery(this).attr('checked',false);
                        jQuery(this).parent().removeClass('checked');	//used for the custom checkbox style
                        jQuery(this).parents('tr').removeClass('selected');
                    });

                }
            });
        }

        // delete row in a table
        if(jQuery('.deleterow').length > 0) {
            jQuery('.deleterow').click(function(){
                var conf = confirm('Continue delete?');
                if(conf)
                    jQuery(this).parents('tr').fadeOut(function(){
                        jQuery(this).remove();
                        // do some other stuff here

                    });
                return false;
            });
        }



    });


    function DelUser(userId) {
        if(confirm("您确定要删除学生信息吗？")) {
            window.location="Useroperate?action1=delUser&userId="+userId;
        }
    }

</script>