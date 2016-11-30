<%@ page import="com.hyewon.chatting.model.Channel" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ryan-yoo
  Date: 2016. 12. 1.
  Time: 오전 2:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<html>
<head>
    <title>채팅방</title>
    <%--<link href="<c:url value="/res/css/main.css" />" rel="stylesheet">--%>
    <link rel="stylesheet" href="css/style.css">

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/nicescroll/3.5.4/jquery.nicescroll.js'></script>
    <script src="js/chatting_room.js"></script>
</head>
<body>

<div class="screenui">
    <!-- Navigation -->
    <div class="nav">
        <ul>
            <li style="float: left;">
                <a href="#">Home</a>
            </li>
            <li>
                <a href="javascript:void(0)">Star</a>
            </li>
            <li class="dropdown">
                <a href="javascript:void(0)" class="dropbtn">Dropdown</a>
                <div class="dropdown-content" id="my-dropdown" style="right: 19px">
                    <a href="#">Profile</a>
                    <a href="#">Logout</a>
                </div>
            </li>
            <%--<li class="dropdown">--%>
            <%--<a href="javascript:void(0)" class="dropbtn">Add</a>--%>
            <%--<div class="dropdown-content" id="add-dropdown" style="right: 180px">--%>
            <%--<form action="action_page.php" id="addForm">--%>
            <%--<a>Chat Name:</a>--%>
            <%--<input type="text" id="chat-name-textfield">--%>
            <%--<br>--%>
            <%--<a>Memebers:</a>--%>
            <%--<input type="text" id="name-textfield">--%>
            <%--<br><br>--%>
            <%--<input type="submit" value="완료">--%>
            <%--</form>--%>
            <%--</div>--%>
            <%--</li>--%>
        </ul>
    </div>

    <hr size="1">

    <!-- Chatting UI -->
    <div class="ui">
        <!-- Left Menu -->
        <div class="left-menu">
            <form class="search">
                <input placeholder="search..." type="search" id="my-input">
                <input type="submit" value="&#xf002;">
            </form>

            <menu class="list-friends" id="list-friends">
                <%
                    List<Channel> channels = Channel.findAll(null);
                    for (Channel channel : channels) {
                %>
                <li id=<%= channel.getId() %>>
                    <img width="50" height="50"
                         src=<%= channel.getImageUrl() %>>
                    <div class="info">
                        <div class="chatting-room-name"><%= channel.getName() %>
                        </div>
                        <div class="users"><%= channel.getUserNames() %>
                        </div>
                    </div>
                    <input type="image" class="quit-chat" src="images/x.png"/>
                </li>
                <%
                    }
                %>
            </menu>
        </div>


        <div class="chat" id="chat">
            <ul class="messages">
                <% for (int i = 0; i < 10; i++) { %>

                <li class="friend-with-a-SVAGina">
                    <div class="head">
                        <span class="name">유병한</span>
                        <span class="time">10:15 AM, Today</span>
                    </div>
                    <div>
                        <div class="message">안녕ㅎㅎ</div>
                        <input type="image" class="friendButton"
                               src="images/star_unselected.png"
                               id="<%= "button" + 2 * i %>" starred="false"/>
                    </div>
                </li>

                <li class="i">
                    <div class="head">
                        <span class="name">김혜원</span>
                        <span class="time">10:15 AM, Today</span>
                    </div>
                    <div>
                        <div class="message">안녕!!</div>
                        <input type="image" class="iButton" src="images/star_unselected.png"
                               id="<%= "button" + 2 * i + 1 %>" starred="false"/>
                    </div>
                </li>

                <% } %>
            </ul>

            <div class="write-form">
                <textarea placeholder="Type your message" name="e" id="text" rows="2"></textarea>
                <span class="send">Send</span>
            </div>
        </div>

        <div class="rightMenu" id="rightMenu" style="display: none;">
            <menu class="starList" id="starList">
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/2">
                    <div class="info">
                        <div>
                            <span class="user">성시경</span>
                            <span class="time">2016/11/16 10:15 AM</span>
                        </div>
                        <div class="content">안녕ㅎㅎ</div>
                    </div>
                </li>
                <hr size="1">

                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/2">
                    <div class="info">
                        <div>
                            <span class="user">성시경</span>
                            <span class="time">2016/11/16 10:18 AM</span>
                        </div>
                        <div class="content">뭐해?</div>
                    </div>
                </li>
                <hr size="1">
            </menu>
        </div>
    </div>
</div>

</body>
</html>
