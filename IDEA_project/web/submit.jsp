
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>解析答案</title>
</head>
<body>
<%
    int score=0;
    String StuName=request.getParameter("stuName");
    if(request.getParameter("a1").equals(request.getParameter("bookNameA")))
    {
    score+=50;
    }
     if(request.getParameter("a2").equals(request.getParameter("bookNameB")))
    {
        score+=50;
    }
      if(request.getParameter("a3").equals(request.getParameter("bookNameC")))
    {
        score+=50;
    }
%>
<%=StuName+"分数为"+score%>
</body>
</html>
