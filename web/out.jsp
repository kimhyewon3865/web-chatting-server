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
    String myNickname = request.getParameter("myNickname");

    String channelId = request.getParameter("channelId");

    String url = "jdbc:mysql://localhost:3306/chatting";
    Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
    Statement stmt = conn.createStatement();
    String sql = "DELETE FROM users_channels WHERE channel_id = " + Integer.parseInt(channelId) + " AND user_nickname='"+ myNickname + "'";
    stmt.executeUpdate(sql);
%>
</body>
</html>
