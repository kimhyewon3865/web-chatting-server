<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 12. 7.
  Time: 오후 7:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<stars>
    <%
        String url = "jdbc:mysql://localhost:3306/chatting";
        Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
        Statement stmt = conn.createStatement();

        String channelId = request.getParameter("channel_id");

        String sql = "SELECT * FROM messages where channel_id=" + channelId +" and starred=1;";
        ResultSet resultSet = stmt.executeQuery(sql);
        while (resultSet.next()) {
    %>
    <star
            text="<%= resultSet.getString("text") %>"
            createdAt="<%= resultSet.getLong("create_at") %>"
            userNickname="<%= resultSet.getString("user_nickname") %>"/>
    <%
        }
        resultSet.close();
        stmt.close();
        conn.close();
    %>
</stars>

