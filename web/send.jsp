<%@ page language="java" contentType="text/html;charset-euc-kr" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<HTML>
<head></head>

<body>
<%
    String text = request.getParameter("text");
    String channelId = request.getParameter("channelId"); //long type
    String userNickname = request.getParameter("userId");
    long createdAt = Long.parseLong((new SimpleDateFormat("yyyyMMddHHmmss")).format(new Date()));

    String url = "jdbc:mysql://localhost:3306/chatting";
    try {
        Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
        Statement stmt = conn.createStatement();
        String sql = "insert into messages(text, starred, create_at, channel_id, user_nickname) values(" +
                "'" + text + "', 0, " + createdAt + ", "+ channelId + ", '" + userNickname + "');";
        stmt.executeUpdate(sql);

        conn.close();
        stmt.close();
%>
<%= text %>
<%
    } catch (SQLException e) {
        e.printStackTrace();
%>
<%= e.getMessage() %>
<%
    }
%>

</body>
</html>