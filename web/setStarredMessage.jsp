<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 12. 7.
  Time: 오후 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<%
    int messageId = Integer.parseInt(request.getParameter("messageId"));
    boolean starred = Boolean.parseBoolean(request.getParameter("starred"));
    int intStarred = starred ? 1 : 0;

    System.out.println("messageId >>> " + messageId + " / starred >>> " + starred);

    String url = "jdbc:mysql://localhost:3306/chatting";
    try {
        Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
        Statement stmt = conn.createStatement();
        String sql = "update messages set starred=" + intStarred + " where id="+ messageId +";";
        stmt.executeUpdate(sql);
        conn.close();
        stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
