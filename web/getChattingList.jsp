<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="static com.hyewon.chatting.model.Channel.convertResultSetToChannel" %>
<%@ page import="com.hyewon.chatting.model.Channel" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 12. 3.
  Time: 오전 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  //db: users_channels rs = select channel_id from users_channels where id = myid; , usersString += select user_nickname from where user_channels where channel_id = rs;


   // List<Channel> channels;
    String myNickname = "a";

    String url = "jdbc:mysql://localhost:3306/chatting";
    Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
    Statement statement = conn.createStatement();
    String sql = "SELECT * FROM channels where id in (select users_channels.channel_id from users_channels where users_channels.user_nickname = '" + myNickname + "');";
    ResultSet resultSet = statement.executeQuery(sql);
    String users = "";

    //channels = Channel.findAll(statement);



//    ResultSet resultSet = statement.executeQuery("SELECT * FROM channels;");
//    while (resultSet.next()) {
//        channels.add(convertResultSetToChannel(resultSet));
//    }
//    resultSet.close();


//    String sql = "DELETE FROM channels WHERE id = " + Integer.parseInt(channelId);
//    out.println(sql);
//    stmt.executeUpdate(sql);
%>
<%--<channel>--%>
    <%

        while (resultSet.next()) {
            //Integer channelId = resultSet.getInt("id");
            out.println("<channel>");

   //         out.println("<id>" + resultSet.getInt("id") + " </id>");
            out.println("<name>" + resultSet.getString("name") + " </name>");
 //           out.println("<image>" + resultSet.getString("image_url") + " </image>");
            out.println("</channel>");

//            ResultSet userResultSet = statement.executeQuery("SELECT user_nickname FROM users_channels WHERE channel_id=" + channelId + ";");
//
//            while (userResultSet.next()) {
//                users += userResultSet.getString("user_nickname");
//                users += ", ";
//            }
//           out.println("<users>" + "aa" + " </users>");









//            Integer channelId = resultSet.getInt("id");
//            out.println("<li id=" + channelId + ">");
//            out.println("<img width="50" height="50" src=" + resultSet.getString("image_url") + "/>");
//            out.println("<div class=\"info\">");
//            out.println("<div class=\"chatting-room-name\">" + resultSet.getString("name") + "</div>");
//            ResultSet userResultSet = statement.executeQuery("SELECT user_nickname FROM users_channels WHERE channel_id=" + channelId + ";");
//            while (userResultSet.next()) {
//                users += userResultSet.getString("user_nickname");
//                users += ", ";
//            }
//            userResultSet.close();
//            out.println("<div class=\"users\">" + users + "</div>");
//            out.println("</div>");
//            out.println("<input type=\"image\" class=\"quit-chat\" src=\"images/x.png\" onclick=\"quitChat(" + channelId + ")/>");
//            out.println("</li>");
        }
    %>
<%--</channel>--%>
<%
  resultSet.close();
  statement.close();
  conn.close();
%>
</body>
</html>
