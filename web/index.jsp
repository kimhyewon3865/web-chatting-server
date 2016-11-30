<%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 11. 30.
  Time: 오후 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hyewon.chatting.model.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.List" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>

  <%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost/javatest";
    Connection conn = DriverManager.getConnection(url,"root","1234");
    Statement statement = conn.createStatement();


    List<Channel> channels = Channel.findAll(statement);
  %>

  <%--<%=hw.sayHelloWorldFrom("안뇽")%>--%>

  $END$
  </body>
</html>
