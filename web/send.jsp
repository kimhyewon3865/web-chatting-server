<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    String text = request.getParameter("text");
    String channelId = request.getParameter("channelId"); //long type
    String userNickname = request.getParameter("userNickname");
    long createdAt = System.currentTimeMillis();
    System.out.println("createAt >> " + createdAt);
    String url = "jdbc:mysql://localhost:3306/chatting";
    try {
        Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
        Statement stmt = conn.createStatement();
        String sql = "insert into messages(text, starred, create_at, channel_id, user_nickname) values(" +
                "'" + text + "', 0, " + createdAt + ", "+ channelId + ", '" + userNickname + "');";
        stmt.executeUpdate(sql);
        conn.close();
        stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
