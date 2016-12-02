<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 12. 2.
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    //String text = request.getParameter("text");
    //String createdAt = (new SimpleDateFormat("yyyyMMddHHmmss")).format( new Date() );
    //String channelId = request.getParameter("channelId"); //long type
    //String userId = "h";
    Integer channelId = 2;

    String url = "jdbc:mysql://localhost:3306/chatting";
    Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
    Statement stmt = conn.createStatement();
    String sql = "DELETE FROM channels WHERE id = " + channelId ;
    out.println(sql);
    stmt.executeUpdate(sql);
%>
</body>
</html>
