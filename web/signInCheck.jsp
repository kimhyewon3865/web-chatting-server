<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 12. 7.
  Time: 오전 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 로그인 정보 설정
    //String userNickName="id";
   // String userPWD="pwd";



    // login.jsp로부터 form data를 받는다
    String nickName = request.getParameter("signInNickName");
    String pwd = request.getParameter("signInPassword");

    String url = "jdbc:mysql://localhost:3306/chatting";
    Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
    Statement stmt = conn.createStatement();
    String sql = "SELECT COUNT(*) as count FROM users where nickName=\""+ nickName +"\" and password=\"" + pwd + "\"; ";
    ResultSet resultSet =  stmt.executeQuery(sql);
    Integer count = 0;
    Integer firstChannelId = 0;
    //Integer result = resultSet.getInt("count");
    //System.out.println("nic>>" + nickName + " pwd>>" + pwd + " result>>" +result);

    if (resultSet.next()) {
        count = resultSet.getInt(1);
    }

    sql = "SELECT MIN(channel_id) FROM users_channels WHERE user_nickname=\""+ nickName +"\"";
    resultSet =  stmt.executeQuery(sql);


    if (resultSet.next()) {
        firstChannelId = resultSet.getInt(1);
    }

    //System.out.println("nic>>" + nickName + " pwd>>" + pwd + " result>>" + count);

    // id, pwd가 맞을 경우 실행
    if(count == 1)
    {
        session.setAttribute("s_Id", nickName);
        session.setAttribute("s_channel", firstChannelId);

        response.sendRedirect("./chatting_room.jsp");
    }
    else
    {
        //response.sendRedirect("./chatting_room.jsp");
    }
%>
