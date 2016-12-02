<%@ page language="java" contentType="text/html;charset-euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>

<HTML>
<head><title>request °´Ã¼</title></head>

<body>
<%

    String text = request.getParameter("text");
    String createdAt = (new SimpleDateFormat("yyyyMMddHHmmss")).format( new Date() );
    String channelId = request.getParameter("channelId"); //long type
    String userId = "h";

    String url = "jdbc:mysql://localhost:3306/chatting";
    Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
    Statement stmt = conn.createStatement();
    String sql = "insert into messages(text,starred,create_at,channel_id,user_nickname) values(" +
            "'" + text + "', 0, '" + createdAt + "', 1 , '" + userId + "')" ;
    out.println(sql);
    stmt.executeUpdate(sql);
%>

</body>
</html>