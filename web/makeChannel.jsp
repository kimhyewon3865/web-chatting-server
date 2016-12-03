<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.sql.*" %><%--
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
    String channelName = request.getParameter("channelName"); //long type
    String userNicknames = request.getParameter("userNicknames");

    Integer lastChannelId = 0;

    String url = "jdbc:mysql://localhost:3306/chatting";
    Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
    Statement stmt = conn.createStatement();

    String user;

    String sql = "insert into channels(name, image_url) values( '" + channelName + "'," + "NULL )" ;
    stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);

    ResultSet rs = stmt.getGeneratedKeys();
    if (rs.next()){
        try {
            lastChannelId = rs.getInt(1);
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    StringTokenizer st = new StringTokenizer(userNicknames,",");

    while(st.hasMoreTokens()) {
        user = st.nextToken();
        sql = "insert into users_channels(user_nickname, channel_id) values( '" + user + "'," + lastChannelId +")";

        stmt.executeUpdate(sql);

    }
%>
</body>
</html>
