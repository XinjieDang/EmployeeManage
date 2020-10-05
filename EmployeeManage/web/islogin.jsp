<%@ page import="domain.User" %>
<%@ page import="domain.Staff" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User)session.getAttribute("user");
    if(user==null)
    {
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
    }

%>
