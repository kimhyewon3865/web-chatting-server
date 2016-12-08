<%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 12. 6.
  Time: 오전 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <title>channelList</title>
    <link rel="stylesheet" href="css/channelListStyle.css"/>
    <script src="js/chatting_room.js"></script>

</head>
<body>
<div class="nav">
    <ul>
        <li style="float: left;">
            <a href="#">Home</a>
        </li>
        <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn" onclick="myFunction()">Dropdown</a>
            <div class="dropdown-content" id="my-dropdown" style="right: 0px">
                <a href="#">Profile</a>
                <a href="../sign-up-login-form-2/index.html">Logout</a>
            </div>
        </li>
        <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn" onclick="addFunction()">+</a>
            <div class="dropdown-content" id="add-dropdown" style="right: 105px">
                <form id="addForm">
                    <a>Chat Name:</a>
                    <input type="text" id="chat-name-textfield">
                    <br>
                    <a>Memebers:</a>
                    <input type="text" id="name-textfield">
                    <br><br>
                    <input type="button" value="완료" onclick="insertChannel('home')">
                </form>
            </div>
        </li>
    </ul>
</div>
<p class="title">채팅방 목록</p>
<input type="text" placeholder="Search..." id="my-input" onkeyup="filterFunction()" class="search"/>
<table cellspacing='0' align="center" id="chat-list"> <!-- cellspacing='0' is important, must stay -->
    <tr>
        <td>
            <img width="50" height="50" src="http://cs625730.vk.me/v625730358/1126a/qEjM1AnybRA.jpg"/>
            <div onclick="window.location='./chatting_room.jsp'" class="list">
                <b>성시경</b>
                <br><br>
                성시경
            </div>
            <input type="image" class="quit-chat" src="cancel.png" onclick="quitChat(1, 'home')"/>
        </td>
    </tr>
</table>
<script>
//    var myNickname = "b";
//
//    function myFunction() {
//        document.getElementById("my-dropdown").classList.toggle("show");
//    }
////
////    function addFunction() {
////        document.getElementById("add-dropdown").classList.toggle("show");
////    }
//
//    function quitChat() {
//        var r = confirm('채팅방을 나가시겠습니까?');
//        if (r == true) {
//        } else {
//        }
//    }
//
//    function filterFunction() {
//        var input, filter, a, i;
//        input = document.getElementById("my-input");
//        filter = input.value.toUpperCase();
//        div = document.getElementById("chat-list");
//        a = div.getElementsByTagName("tr");
//
//        for (i = 0; i < a.length; i++) {
//            if (-1 < a[i].innerHTML.toUpperCase().indexOf(filter)) {
//                a[i].style.display = "";
//            } else {
//                a[i].style.display = "none";
//            }
//        }
//    }
//
//    function loadChannels() {
//        var httpReq = getInstance();
//        httpReq.open("GET", "getChattingList.jsp?userNickname=" + myNickname, true);
//        httpReq.onreadystatechange = function () {
//            if (httpReq.readyState == 4 && httpReq.status == 200) {
//                var xmlDocument;
//                if (window.ActiveXObject) {   //IE일 경우
//                    xmlDocument = new ActiveXObject('Microsoft.XMLDOM');
//                    xmlDocument.async = false;
//                    xmlDocument.loadXML(httpReq.responseText);
//                } else if (window.XMLHttpRequest) {   //Firefox, Netscape일 경우
//                    var xmlParser = new DOMParser();
//                    xmlDocument = xmlParser.parseFromString(httpReq.responseText, 'text/xml');
//
//                } else {
//                    return null;
//                }
//
//                var i;
//                var channels = xmlDocument.getElementsByTagName("channel");
//                    var lis = $("#chat-list").children();
//                    for (i = 0; i < lis.length; i++) {
//                        lis[i].remove();
//                    }
//
//                    for (i = 0; i < channels.length; i++) {
//                        var channel = channels[i];
//                        var id = channel.getAttribute("id");
//                        var name = channel.getAttribute("name");
//                        var image = channel.getAttribute("image");
//                        var users = channel.getAttribute("users");
//                        //var markup = "<li onclick=\"setGlogalChannelId(" + id + ")\" id=\"" + id + "\"><img width=\"50\" height=\"50\" src=\"" + image + "\" id=\"profile-image\"><div class=\"info\" id=\"channelListDiv\"><div id=\"chatting-room-name\" class=\"chatting-room-name\">" + name + "</div><div id=\"chatting-room-users\" class=\"users\">" + users + "</div></div><input type=\"image\" class=\"quit-chat\" src=\"images/x.png\" onclick=\"quitChat(" + id + ")\" id=\"quitButton\"/></li>";
//                        var markup = "<tr><td><img width=\"50\" height=\"50\" src=\"http://cs625730.vk.me/v625730358/1126a/qEjM1AnybRA.jpg\"/><div onclick=\"window.location=\'./chatting_room.jsp\'\" class=\"list\"><b>" + channelId+ "<br><br>" + users + "</div><input type=\"image\" class=\"quit-chat\" src=\"cancel.png\" onclick=\"quitChat()\"/></td></tr>" ;
//                        document.getElementById("chat-list").innerHTML += markup;
//                    }
//
//            }
//        };
//        httpReq.send();
//    }
//
//
//    function getInstance() {
//        var httpReq = false;
//        if (window.ActiveXObject)
//            httpReq = new ActiveXOjbect("Microsoft.XMLHTTP");
//        else if (window.XMLHttpRequest)
//            httpReq = new XMLHttpRequest();
//        return httpReq;
//    }
</script>
</body>
</html>
