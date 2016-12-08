<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 12. 8.
  Time: 오후 5:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String nickName = request.getParameter("signUpNickName");
    String pwd = request.getParameter("signUpPassword");
    String url = "jdbc:mysql://localhost:3306/chatting";
    Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
    Statement stmt = conn.createStatement();
    String sql = "SELECT COUNT(*) as count FROM users where nickName=\""+ nickName +"\"";
    ResultSet rs =  stmt.executeQuery(sql);
    Integer count = 0;
    Integer firstChannelId = 0;
    if (rs.next()) {
        count = rs.getInt(1);
    }

    System.out.println("nic>>" + nickName + " pwd>>" + pwd + " result>>" + count);

    if(count == 0)
    {
        sql = "INSERT INTO users VALUES (\'"+ nickName + "\',\'" + pwd +"\');";
        stmt.executeUpdate(sql);

        session.setAttribute("s_Id", nickName);
        session.setAttribute("s_channel", firstChannelId);

        response.sendRedirect("./chatting_room.jsp");
    }
    else
    {
    }

    rs.close();
    stmt.close();
    conn.close();
%>

