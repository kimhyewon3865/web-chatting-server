<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 12. 4.
  Time: 오후 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <%
       String url = "jdbc:mysql://localhost:3306/chatting";
       Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
       Statement stmt = conn.createStatement();

   %>
</head>
<body>

</body>
</html>
