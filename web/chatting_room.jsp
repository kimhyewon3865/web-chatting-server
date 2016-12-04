<%@ page import="com.hyewon.chatting.model.Channel" %>
<%@ page import="com.hyewon.chatting.model.Message" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: ryan-yoo
  Date: 2016. 12. 1.
  Time: 오전 2:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<head>
    <title>채팅방</title>
    <%--<link href="<c:url value="/res/css/main.css" />" rel="stylesheet">--%>
    <link rel="stylesheet" href="css/style.css">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/nicescroll/3.5.4/jquery.nicescroll.js'></script>
    <script src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
    <script src="js/chatting_room.js"></script>
</head>
<body>
<%
    long nowChannelId = 1;
%>
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
            <li class="dropdown">
                <a href="javascript:void(0)" class="dropbtn" onclick="addFunction()">Add</a>
                <div class="dropdown-content" id="add-dropdown" style="right: 180px">
                    <form id="addForm">
                        <a>Chat Name:</a>
                        <input type="text" id="chat-name-textfield">
                        <br>
                        <a>Memebers:</a>
                        <input type="text" id="name-textfield">
                        <br><br>
                        <input type="button" value="완료" onclick="insertChannel()">
                    </form>
                </div>
            </li>
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
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                    }
                    try {
                        String url = "jdbc:mysql://localhost:3306/chatting";
                        Connection conn = DriverManager.getConnection(url, "root", "dltmf1995");
                        Statement stmt = conn.createStatement();

                        List<Channel> channels = Channel.findAll(stmt);
                        for (Channel channel : channels) {
                %>
                <li id=<%= channel.getId() %>>
                    <img width="50" height="50"
                         src=<%= channel.getImageUrl() %> id="profile-image">
                    <div class="info" id="channelListDiv">
                        <div id="chatting-room-name" class="chatting-room-name"><%= channel.getName() %>
                        </div>
                        <div id="chatting-room-users" class="users"><%= channel.getUserNames(stmt) %>
                        </div>
                    </div>
                    <input type="image" class="quit-chat" src="images/x.png"
                           onclick="quitChat(<%= channel.getId() %>)" id="quitButton"/>

                </li>
                <%
                        }
//                    resultSet.close();
                        stmt.close();
                        conn.close();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                %>
            </menu>
        </div>


        <div class="chat" id="chat">
            <ul class="messages" id="list-messages">
                <%--<% List<Message> messages = Message.findAll(null);--%>
                    <%--for (Message message : messages) {--%>
                        <%--if (!message.getUserNickname().equals(myNickname)) {--%>
                <%--%>--%>

                <%--<li class="friend-with-a-SVAGina">--%>
                    <%--<div class="head">--%>
                        <%--<span class="name"><%=message.getUserNickname()%></span>--%>
                        <%--<span class="time"><%=message.getCreateAt()%></span>--%>
                    <%--</div>--%>
                    <%--<div>--%>
                        <%--<div class="message"><%=message.getText()%>--%>
                        <%--</div>--%>
                        <%--<input type="image" class="friendButton"--%>
                               <%--src="images/star_unselected.png"--%>
                               <%--starred="false"/>--%>
                    <%--</div>--%>
                <%--</li>--%>
                <%--<% } else {%>--%>
                <%--<li class="i">--%>
                    <%--<div class="head">--%>
                        <%--<span class="name"><%=message.getUserNickname()%></span>--%>
                        <%--<span class="time"><%=message.getCreateAt()%></span>--%>
                    <%--</div>--%>
                    <%--<div>--%>
                        <%--<div class="message"><%=message.getText()%>--%>
                        <%--</div>--%>
                        <%--<input type="image" class="iButton" src="images/star_unselected.png"--%>
                               <%--starred="false"/>--%>
                    <%--</div>--%>
                <%--</li>--%>

                <%--<% }--%>
                <%--}--%>
                <%--%>--%>
            </ul>

            <%--<div class="write-form">--%>
            <%--<textarea class="text-area" placeholder="Type your message" name="e" id="text" rows="2"></textarea>--%>
            <%--<span class="send">Send</span>--%>
            <%--</div>--%>

            <form class="write-form">
                <input type="textarea" class="text-area" placeholder="Type your message" name="text" id="text" rows="2">
                <input type="hidden" name="channelId" id="channelId" value="<%=nowChannelId%>">
                <span><input type="button" class="send" value="submit" onclick="insertMessage()"></span>
            </form>
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

<script>
    var myNickname = "b"; // TODO: b 대신 로그인한 유저 닉네임을 설정

    function insertChannel() {
        var httpReq = getInstance();

        var channelName = document.getElementById("chat-name-textfield").value;
        var userNicknames = document.getElementById("name-textfield").value;


        var params = "channelName=" + channelName + "&userNicknames=" + userNicknames;

        if (httpReq) {
            httpReq.open("POST", 'makeChannel.jsp');
            httpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            httpReq.onreadystatechange = function () {
                if (httpReq.readyState == 4 && httpReq.status == 200) {
                    alert(httpReq.responseText);
                }
            };

            httpReq.send(params);
        }
    }

    function addFunction() {
        document.getElementById("add-dropdown").classList.toggle("show");
    }

    function quitChat(channelId) {
        var httpReq = getInstance();

        var params = "channelId=" + channelId;

        if (httpReq) {
            httpReq.open("POST", 'out.jsp');
            httpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            httpReq.onreadystatechange = function () {
                if (httpReq.readyState == 4 && httpReq.status == 200) {
                    //alert(httpReq.responseText);
                }

            }
        }

        httpReq.send(params);
        loadChannels();

    }


    function loadChannels() {
        var httpReq = getInstance();
        httpReq.open("GET", "getChattingList.jsp?userNickname=" + myNickname, true);
        httpReq.onreadystatechange = function () {
            if (httpReq.readyState == 4 && httpReq.status == 200) {
                var xmlDocument;
                if (window.ActiveXObject) {   //IE일 경우
                    xmlDocument = new ActiveXObject('Microsoft.XMLDOM');
                    xmlDocument.async = false;
                    xmlDocument.loadXML(httpReq.responseText);
                } else if (window.XMLHttpRequest) {   //Firefox, Netscape일 경우
                    var xmlParser = new DOMParser();
                    xmlDocument = xmlParser.parseFromString(httpReq.responseText, 'text/xml');

                } else {
                    return null;
                }

                var i;
                var channels = xmlDocument.getElementsByTagName("channel");

                var lis = $("#list-friends").children();
                for (i = 0; i < lis.length; i++) {
                    lis[i].remove();
                }

                for (i = 0; i < channels.length; i++) {
                    var channel = channels[i];
                    var id = channel.getAttribute("id");
                    var name = channel.getAttribute("name");
                    var image = channel.getAttribute("image");
                    var users = channel.getAttribute("users");
                    var markup = "<li id=\"" + id + "\"><img width=\"50\" height=\"50\" src=\"" + image + "\" id=\"profile-image\"><div class=\"info\" id=\"channelListDiv\"><div id=\"chatting-room-name\" class=\"chatting-room-name\">" + name + "</div><div id=\"chatting-room-users\" class=\"users\">" + users + "</div></div><input type=\"image\" class=\"quit-chat\" src=\"images/x.png\" onclick=\"quitChat(" + id + ")\" id=\"quitButton\"/></li>";
                    document.getElementById("list-friends").innerHTML += markup;
                }
            }
        };
        httpReq.send();
    }


    function getInstance() {
        var httpReq = false;
        if (window.ActiveXObject)
            httpReq = new ActiveXOjbect("Microsoft.XMLHTTP");
        else if (window.XMLHttpRequest)
            httpReq = new XMLHttpRequest();
        return httpReq;
    }

    function loadMessages(channelId) {
        var httpReq = getInstance();
        var url = "getMessageList.jsp?channelId=" + channelId;
        // TODO: 마지막 메시지의 createdAt을 받아와서 url의 파라미터로 설정해야함

        httpReq.open("GET", url, true);
        httpReq.onreadystatechange = function () {
            if (httpReq.readyState == 4 && httpReq.status == 200) {
                var xmlDocument;
                if (window.ActiveXObject) {   //IE일 경우
                    xmlDocument = new ActiveXObject('Microsoft.XMLDOM');
                    xmlDocument.async = false;
                    xmlDocument.loadXML(httpReq.responseText);
                } else if (window.XMLHttpRequest) {   //Firefox, Netscape일 경우
                    var xmlParser = new DOMParser();
                    xmlDocument = xmlParser.parseFromString(httpReq.responseText, 'text/xml');

                } else {
                    return null;
                }

                var i;
                var messages = xmlDocument.getElementsByTagName("message");

//                var lis = $("#list-messages").children();
//                for (i = 0; i < lis.length; i++) {
//                    lis[i].remove();
//                }

                for (i = 0; i < messages.length; i++) {
                    var message = messages[i];

                    var id = message.getAttribute("id");
                    var text = message.getAttribute("text");
                    var starred = message.getAttribute("starred");
                    var createdAt = message.getAttribute("createdAt");
                    var channelId = message.getAttribute("channelId");
                    var userNickname = message.getAttribute("userNickname");
                    var src = (starred ? "images/star_selected.png" : "images/star_unselected.png")

                    var markup;

                    if (myNickname == userNickname) {
                        markup = "<li class=\"i\"><div class=\"head\"><span class=\"name\">" + userNickname+ "</span><span class=\"time\">" + createdAt + "</span></div><div><div class=\"message\">" + text + "</div><input type=\"image\" class=\"iButton\" src=\"" + src + "\" starred=\"" + starred + "\"/></div></li>";
                    } else {
                        markup = "<li class=\"friend-with-a-SVAGina\"><div class=\"head\"><span class=\"name\">" + userNickname+ "</span><span class=\"time\">" + createdAt + "</span></div><div><div class=\"message\">" + text + "</div><input type=\"image\" class=\"friendButton\" src=\"" + src + "\" starred=\"" + starred + "\"/></div></li>";
                    }

                    document.getElementById("list-messages").innerHTML += markup;
                }
            }
        };
        httpReq.send();


    }

    function insertMessage() {
        var httpReq = getInstance();

        var text = document.getElementById("text").value;
        var channelId = document.getElementById("channelId").value; //long type
        var userNickname = "h";

        var params = "text=" + text + "&channelId=" + channelId + "&userNickname=" + userNickname;

        if (httpReq) {
            httpReq.open("POST", 'send.jsp');
            httpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            httpReq.onreadystatechange = function () {
                if (httpReq.readyState == 4 && httpReq.status == 200) {
                    alert(httpReq.responseText);
                }
            }

            httpReq.send(params);
        }
    }



</script>
</body>
</html>
