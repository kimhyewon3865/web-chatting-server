<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 12. 2.
  Time: 오후 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String channelId = request.getParameter("channelId"); //long type
    String userIds = request.getParameter("usersId");

    // TODO: userIds 파싱해서 for문으로 디비 insert

    String url = "jdbc:mysql://localhost:3306/chatting";
    Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
    Statement stmt = conn.createStatement();
    String sql = "insert into users_channels(user_nickname, channel_id) values("")" ;
    out.println(sql);
    stmt.executeUpdate(sql);
%>
</body>
</html>
