<%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 12. 7.
  Time: 오후 6:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // 세션 삭제
    //response.sendRedirect("./signUpIn.jsp"); // main.jsp 에 session 정보를 보낸다
pageContext.forward("./signUpIn.jsp");
%>