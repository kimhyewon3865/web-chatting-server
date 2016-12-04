<%@ page import="com.hyewon.chatting.model.Message" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/xml; charset=UTF-8" language="java" %>
<messages>
    <%
        String url = "jdbc:mysql://localhost:3306/chatting";
        Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
        Statement stmt = conn.createStatement();

        long channelId = Long.parseLong(request.getParameter("channelId"));

        long createdAt = 0;
        String createdAtString = request.getParameter("createdAt");
        if (createdAtString != null)
            createdAt = Long.parseLong(createdAtString);

        List<Message> messages = Message.findByChannelAndCreatedAt(stmt, channelId, createdAt);

        for (Message message : messages) {
    %>
    <message
            id="<%= message.getId() %>"
            text="<%= message.getText() %>"
            starred="<%= message.getStarred() %>"
            createdAt="<%= message.getCreateAt() %>"
            channelId="<%= message.getChannelId() %>"
            userNickname="<%= message.getUserNickname() %>"/>
    <%
        }
    %>
</messages>
