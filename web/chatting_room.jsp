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
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <title>채팅방</title>
    <link rel="stylesheet" href="css/style.css">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/nicescroll/3.5.4/jquery.nicescroll.js'></script>
    <script src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
    <script src="js/chatting_room.js"></script>
</head>
<body>
<%
    long nowChannelId = 1;
    String myNickName = (String)session.getAttribute("s_Id");
    Integer lastChannelId = (Integer)session.getAttribute("s_channel");

//    System.out.println("mynic>> "+myNickName);
%>
<div class="screenui">
    <!-- Navigation -->
    <div class="nav">
        <ul>
            <li class="homeLeftFloat">
                <a href="#">hyewon's chatting</a>
            </li>
            <li>
                <a href="javascript:void(0)" onclick="starButtonToggle()">Star</a>
            </li>
            <li class="dropdown">
                <a href="javascript:void(0)" class="dropbtn" onclick="myFunction()">logout</a>
                <div class="dropdown-content" id="my-dropdown" style="right: 19px">
                    <%--<a href="#">Profile</a>--%>
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
                        <input type="button" value="완료" onclick="insertChannel('chat')">
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
                <input placeholder="search..." type="search" id="my-input" onkeyup="filterFunction()">
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

                        List<Channel> channels = Channel.findByUserNickname(stmt, myNickName);
                        for (Channel channel : channels) {
                %>
                <li onclick="setGlogalChannelId(<%=channel.getId()%>)" id=<%= channel.getId() %>>
                    <img width="50" height="50"
                         src="images/person.png" id="profile-image">
                    <div class="info" id="channelListDiv">
                        <div id="chatting-room-name" class="chatting-room-name"><%= channel.getName() %>
                        </div>
                        <div id="chatting-room-users" class="users"><%= channel.getUserNames(stmt) %>
                        </div>
                    </div>
                    <input type="image" class="quit-chat" src="images/x.png"
                           onclick="quitChat(<%= channel.getId() %>, 'chat')" id="quitButton"/>

                </li>
                <%
                        }
                        stmt.close();
                        conn.close();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                %>
            </menu>
        </div>


        <div class="chat" id="chat">
            <ul class="messages" id="list-messages" style="overflow: scroll">

            </ul>

            <form class="write-form">
                <input type="textarea" class="text-area" placeholder="Type your message" name="text" id="text" rows="2">
                <input type="hidden" name="channelId" id="channelId" value="<%=nowChannelId%>">
                <span><input type="button" class="send" value="submit" onclick="insertMessage()"></span>
            </form>
        </div>

        <div class="rightMenu" id="rightMenu" style="display: none;">
            <menu class="starList" id="starList">

            </menu>
        </div>
    </div>
</div>

<script>

var myNickname = "<%=myNickName%>"; // TODO: b 대신 로그인한 유저 닉네임을 설정
var globalChannelId = <%=lastChannelId%>; // TODO: 가장상위의 채널 아이디 설정 SELECT MIN(channel_id) FROM chatting.users_channels WHERE user_nickname="b";
var globalLastCreatedAt = 0;
var clickNewChannelFlag = 0;// TODO: 새로운 채널 눌렀을때 기존 채팅 내용 remove

function insertChannel(pageFlag) {
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
                loadChannels(pageFlag);
                addFunction();

            }
        };
        httpReq.send(params);
    }
}

function addFunction() {
    document.getElementById("add-dropdown").classList.toggle("show");
}

function quitChat(channelId, pageFlag) {
    var httpReq = getInstance();

    var params = "channelId=" + channelId + "&myNickname=" + myNickname ;

    if (httpReq) {
        httpReq.open("POST", 'out.jsp');
        httpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        httpReq.onreadystatechange = function () {
            if (httpReq.readyState == 4 && httpReq.status == 200) {
                alert(httpReq.responseText);
                loadChannels(pageFlag);
            }

        }
    }

    httpReq.send(params);

}


function loadChannels(pageFlag) {
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
            if (pageFlag == "chat") {
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
                    var markup = "<li onclick=\"setGlogalChannelId(" + id + ")\" id=\"" + id + "\"><img width=\"50\" height=\"50\" src=\"images/person.png\" id=\"profile-image\"><div class=\"info\" id=\"channelListDiv\"><div id=\"chatting-room-name\" class=\"chatting-room-name\">" + name + "</div><div id=\"chatting-room-users\" class=\"users\">" + users + "</div></div><input type=\"image\" class=\"quit-chat\" src=\"images/x.png\" onclick=\"quitChat(" + id + ", 'chat')\" id=\"quitButton\"/></li>";
                    document.getElementById("list-friends").innerHTML += markup;
                }
            } else {
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

setInterval(function loadMessages() {
    if (clickNewChannelFlag) {

        var lis = $("#list-messages").children();
        for (i = 0; i < lis.length; i++) {
            lis[i].remove();
        }

        clickNewChannelFlag = 0;
        globalLastCreatedAt = 0;
    }

    var httpReq = getInstance();
    var url = "getMessageList.jsp?channelId=" + globalChannelId + "&createdAt=" + globalLastCreatedAt;
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

            for (i = 0; i < messages.length; i++) {
                var message = messages[i];

                var id = message.getAttribute("id");
                var text = message.getAttribute("text");
                var starred = message.getAttribute("starred");
                var createdAt = message.getAttribute("createdAt");
                var createdAtString = message.getAttribute("createdAtString");
                var channelId = message.getAttribute("channelId");
                var userNickname = message.getAttribute("userNickname");
                var src = (starred == "true" ? "images/star_selected.png" : "images/star_unselected.png")


                if(i == messages.length-1)
                    globalLastCreatedAt = createdAt;
                var markup;

                if (myNickname == userNickname) {
                    markup = "<li class=\"i\"><div class=\"head\"><span class=\"name\">" + userNickname+ "</span><span class=\"time\">" + createdAtString + "</span></div><div><div class=\"message\">" + text + "</div><input id=\"" + "messageId:" + id + "\" type=\"image\" class=\"iButton\" src=\"" + src + "\" starred=\"" + starred + "\" onclick=\"starButtonClick("+ id +")\"/></div></li>";
                } else {
                    markup = "<li class=\"friend-with-a-SVAGina\"><div class=\"head\"><span class=\"name\">" + userNickname+ "</span><span class=\"time\">" + createdAtString + "</span></div><div><div class=\"message\">" + text + "</div><input id=\"" + "messageId:" + id + "\" type=\"image\" class=\"friendButton\" src=\"" + src + "\" starred=\"" + starred + "\" onclick=\"starButtonClick("+ id +")\"/></div></li>";
                }
                document.getElementById("list-messages").innerHTML += markup;
            }
        }
    };
    httpReq.send();
},1000);

function insertMessage() {
    var httpReq = getInstance();
    var text = document.getElementById("text").value;
    var channelId = document.getElementById("channelId").value; //long type
    var params = "text=" + text + "&channelId=" + globalChannelId + "&userNickname=" + myNickname;

    if (httpReq) {
        httpReq.open("POST", 'send.jsp');
        httpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        httpReq.onreadystatechange = function () {
            if (httpReq.readyState == 4 && httpReq.status == 200) {
                alert(httpReq.responseText);
                document.getElementById("text").value = "";
            }
        };
        httpReq.send(params);
    }
}

function setGlogalChannelId(nowChannelId) {
    globalChannelId = nowChannelId;
    clickNewChannelFlag = 1;

    loadStarredMessage();

    $("li").click(function () {
        $("li").removeAttr("style");
        $(this).css("background-color", "lightblue");
    });
}

$(function () {
    $("li").click(function () {
        $("li").removeAttr("style");
        $(this).css("background-color", "lightblue");
    }); //이부분이 li 클릭햇을때 이벤
});
function filterFunction() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("my-input");
    filter = input.value.toUpperCase();
    div = document.getElementById("list-friends");
    a = div.getElementsByTagName("li");

    for (i = 0; i < a.length; i++) {
        if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
            a[i].style.display = "";
        } else {
            a[i].style.display = "none";
        }
    }
}

function myFunction() {
    var httpReq = getInstance();
    httpReq.open("GET", "logOut.jsp", true);
    httpReq.send();
}

function starButtonToggle() {
    var x = document.getElementById('rightMenu');
    if (x.style.display === 'none') {
        x.style.width = "40%";
        x.style.display = 'block';
        loadStarredMessage();
    } else {
        x.style.display = 'none';
    }
}

function loadStarredMessage() {
    var x = document.getElementById('rightMenu');
        var i;
        var lis = $("#starList").children();
        for (i = 0; i < lis.length; i++) {
            lis[i].remove();
        }

        var httpReq = getInstance();
        var url = "getStarredList.jsp?channel_id=" + globalChannelId;

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
                var stars = xmlDocument.getElementsByTagName("star");

                for (i = 0; i < stars.length; i++) {
                    var star = stars[i];

                    var text = star.getAttribute("text");
//                    var createdAt = star.getAttribute("createdAt");
                    var userNickname = star.getAttribute("userNickname");

                    var markup = "<li><img width=\"50\" height=\"50\" src=\"http://lorempixel.com/50/50/people/2\"><div class=\"info\"><div><span class=\"user\">" + userNickname + "</span></div><div class=\"content\">"+text+"</div></div></li><hr size=\"1\">";

                    document.getElementById("starList").innerHTML += markup;
                }
            }

        };
        httpReq.send();

}

function starButtonClick(messageId) {
    var button = document.getElementById("messageId:"+messageId)

    var oldStarred = button.getAttribute("starred");
    var newStarred = (oldStarred == "true" ? "false" : "true");


    var httpReq = getInstance();
    var params = "messageId=" + messageId + "&starred=" + newStarred;

    if (httpReq) {
        httpReq.open("POST", './setStarredMessage.jsp');
        httpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        httpReq.onreadystatechange = function () {
            if (httpReq.readyState == 4 && httpReq.status == 200) {
                loadStarredMessage();
            }
        };
        httpReq.send(params);
    }
    if (button.getAttribute("starred") == "true") {
        button.src = 'images/star_unselected.png';
        button.setAttribute("starred", "false")
    } else {
        button.src = 'images/star_selected.png';
        button.setAttribute("starred", "true")
    }


}


</script>
</body>
</html>
