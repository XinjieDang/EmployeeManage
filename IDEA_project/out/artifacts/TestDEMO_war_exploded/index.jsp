
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>jsp练习</title>
    <style>
      .selectDrow{
        border: 1px solid burlywood;
        margin-top: auto;
        background: burlywood;
        height: 83px;
        width: 450px;
        font-size: 20px;
      }
      .sumit{
        padding-top: 50px;
        margin: auto;
      }
    </style>
  </head>
  <body>
  <form action="submit.jsp" method="post">
    <span>学生姓名：</span>
    <input type="text" name="stuName">
    <div class="selectDrow">
      <p>软件工程必修课有:</p>
      软件工程导论<input type="radio" name="bookNameA" value="B">
        uml系统建模<input type="radio" name="bookNameA" value="B">
      数据结构<input type="radio" name="bookNameA" value="B">
    </div>
    <div class="selectDrow">
      <p>前端技术有:</p>
      javascript<input type="radio" name="bookNameB" value="A">
      jquery<input type="radio" name="bookNameB" value="A">
      axaj<input type="radio" name="bookNameB" value="A">
    </div>
    <div class="selectDrow">
      <p>后端技术有:</p>
      java<input type="radio" name="bookNameC" value="C">
      .net<input type="radio" name="bookNameC" value="C">
      node.js<input type="radio" name="bookNameC" value="C">
    </div>
    <input type="hidden" name ="a1" value="B">
    <input type="hidden" name ="a2" value="A">
    <input type="hidden" name ="a3" value="C">
    <div class="sumit">
      <input type="submit" value="提交">
    </div>
  </form>
  </body>
</html>
