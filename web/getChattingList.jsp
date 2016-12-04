<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.hyewon.chatting.model.Channel" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 12. 3.
  Time: 오전 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/xml; charset=UTF-8" language="java" %>
<channels>
<%
    String url = "jdbc:mysql://localhost:3306/chatting";
    Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
    Statement stmt = conn.createStatement();
    List<Channel> channels = Channel.findAll(stmt);
    for (Channel channel : channels) {
%>
    <channel
            id="<%= channel.getId() %>"
            name="<%= channel.getName() %>"
            image="<%= channel.getImageUrl() %>"
            users="<%= channel.getUserNames(stmt) %>"/>
<%
    }
%>
</channels>
