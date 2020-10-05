<%@ page import="domain.User" %>
<%@ page import="domain.Staff" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Staff staff=(Staff)session.getAttribute("staff");
    if(staff==null)
    {
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
    }

%>
