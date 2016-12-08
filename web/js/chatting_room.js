(function () {
    var conf, lol, insertI, onChannelSelected, star;
    var selectedChannelId;

    conf = {
        cursorcolor: "#696c75",
        cursorwidth: "4px",
        cursorborder: "none"
    };

    lol = {
        cursorcolor: "#cdd2d6",
        cursorwidth: "4px",
        cursorborder: "none"
    };

    star = {
        cursorcolor: "#cdd2d6",
        cursorwidth: "4px",
        cursorborder: "none"
    };

    // NYLM = ["오빠 사랑해😘", "배고팡 힝 ㅜㅜ", "보고싶당!!!", "모행??", "놀러가쟝!!", "머먹지??", "어디가지??", "머하지??"];
    //
    // getRandomInt = function (min, max) {
    //     return Math.floor(Math.random() * (max - min + 1)) + min;
    // };
    //
    // claerResizeScroll = function () {
    //     $("#texxt").val("");
    //     $(".messages").getNiceScroll(0).resize();
    //     return $(".messages").getNiceScroll(0).doScrollTop(999999, 999);
    // };
    //

    onChannelSelected = function(channelId) {

    };

    insertI = function () {
        var innerText, otvet;
        innerText = $.trim($("#text").val());

        if (innerText !== "") {
            // var date = new Date()
            // var buttonId = date.toUTCString() + date.getUTCMilliseconds()
            // $(".messages").append("<li class=\"i\"><div class=\"head\"><span class=\"name\">헤어니</span> <span class=\"time\">" + (new Date().getHours()) + ":" + (new Date().getMinutes()) + " AM, Today</span></div><div><div class=\"message\">" + innerText + "</div><input type=\"image\" class=\"iButton\" src=\"icon_star_unselected.png\" id=\"" + buttonId + "\" onclick=\"iButtonOnClick(\'" + buttonId + "\')\" starred=\"false\"></input></div></li>");
            // claerResizeScroll();
            //
            // return otvet = setInterval(function () {
            //     var date = new Date()
            //     var buttonId = date.toUTCString() + date.getUTCMilliseconds()
            //     $(".messages").append("<li class=\"friend-with-a-SVAGina\"><div class=\"head\"><span class=\"name\">뿅알</span> <span class=\"time\">" + (new Date().getHours()) + ":" + (new Date().getMinutes()) + " AM, Today</span></div><div><div class=\"message\">" + NYLM[getRandomInt(0, NYLM.length - 1)] + "</div><input type=\"image\" class=\"friendButton\" src=\"icon_star_unselected.png\" id=\"" + buttonId + "\" onclick=\"iButtonOnClick(\'" + buttonId + "\')\" starred=\"false\"></input></div></li>");
            //     claerResizeScroll();
            //     return clearInterval(otvet);
            // }, getRandomInt(2500, 500));


            // var params = "nickName="+encodeURIComponent(this.nickName)+
            //     "&msg="+encodeURIComponent(msg);
            // new ajax.xhr.Request("sendMessage.jsp", params,
            //     this.messageSended, "POST", this);

            // var parameters = "channelId=" +
        }
    };

    $(document).ready(function () {
        $(".list-friends").niceScroll(conf);
        $(".messages").niceScroll(lol);
        $("#starList").niceScroll(star);
        $("#text").keypress(function (e) {
            if (e.keyCode === 13) {
                insertI();
                return false;
            }
        });
        return $(".send").click(function () {
            return insertI();
        });
        $('#list-messages').animate({
            scrollTop:0
        }, 'slow');
        // var d = $('#list-messages');
        // d.scrollTop(d.prop("scrollHeight"));
//        $('#list-messages').scrollTop($('#list-messages').prop("scrollHeight"));

    });


}).call(this);

// var myNickname = "b"; // TODO: b 대신 로그인한 유저 닉네임을 설정
// var globalChannelId = 18; // TODO: 가장상위의 채널 아이디 설정 SELECT MIN(channel_id) FROM chatting.users_channels WHERE user_nickname="b";
// var globalLastCreatedAt = 0;
// var clickNewChannelFlag = 0;// TODO: 새로운 채널 눌렀을때 기존 채팅 내용 remove
//
// function insertChannel(pageFlag) {
//     var httpReq = getInstance();
//
//     var channelName = document.getElementById("chat-name-textfield").value;
//     var userNicknames = document.getElementById("name-textfield").value;
//
//
//     var params = "channelName=" + channelName + "&userNicknames=" + userNicknames;
//
//     if (httpReq) {
//         httpReq.open("POST", 'makeChannel.jsp');
//         httpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//         httpReq.onreadystatechange = function () {
//             if (httpReq.readyState == 4 && httpReq.status == 200) {
//                 alert(httpReq.responseText);
//                 loadChannels(pageFlag);
//
//             }
//         };
//         httpReq.send(params);
//         alert("what");
//
//
//     }
//
//
// }
//
// function addFunction() {
//     document.getElementById("add-dropdown").classList.toggle("show");
// }
//
// function quitChat(channelId, pageFlag) {
//     var httpReq = getInstance();
//
//     var params = "channelId=" + channelId;
//
//     if (httpReq) {
//         httpReq.open("POST", 'out.jsp');
//         httpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//
//         httpReq.onreadystatechange = function () {
//             if (httpReq.readyState == 4 && httpReq.status == 200) {
//                 alert(httpReq.responseText);
//                 loadChannels(pageFlag);
//             }
//
//         }
//     }
//
//     httpReq.send(params);
//
// }
//
//
// function loadChannels(pageFlag) {
//     var httpReq = getInstance();
//     httpReq.open("GET", "getChattingList.jsp?userNickname=" + myNickname, true);
//     httpReq.onreadystatechange = function () {
//         if (httpReq.readyState == 4 && httpReq.status == 200) {
//             var xmlDocument;
//             if (window.ActiveXObject) {   //IE일 경우
//                 xmlDocument = new ActiveXObject('Microsoft.XMLDOM');
//                 xmlDocument.async = false;
//                 xmlDocument.loadXML(httpReq.responseText);
//             } else if (window.XMLHttpRequest) {   //Firefox, Netscape일 경우
//                 var xmlParser = new DOMParser();
//                 xmlDocument = xmlParser.parseFromString(httpReq.responseText, 'text/xml');
//
//             } else {
//                 return null;
//             }
//
//             var i;
//             var channels = xmlDocument.getElementsByTagName("channel");
//             if (pageFlag == "chat") {
//                 var lis = $("#list-friends").children();
//                 for (i = 0; i < lis.length; i++) {
//                     lis[i].remove();
//                 }
//
//                 for (i = 0; i < channels.length; i++) {
//                     var channel = channels[i];
//                     var id = channel.getAttribute("id");
//                     var name = channel.getAttribute("name");
//                     var image = channel.getAttribute("image");
//                     var users = channel.getAttribute("users");
//                     var markup = "<li onclick=\"setGlogalChannelId(" + id + ")\" id=\"" + id + "\"><img width=\"50\" height=\"50\" src=\"" + image + "\" id=\"profile-image\"><div class=\"info\" id=\"channelListDiv\"><div id=\"chatting-room-name\" class=\"chatting-room-name\">" + name + "</div><div id=\"chatting-room-users\" class=\"users\">" + users + "</div></div><input type=\"image\" class=\"quit-chat\" src=\"images/x.png\" onclick=\"quitChat(" + id + ", 'chat')\" id=\"quitButton\"/></li>";
//                     document.getElementById("list-friends").innerHTML += markup;
//                 }
//             } else {
//                 //home innerhtml
//             }
//         }
//     };
//     httpReq.send();
// }
//
//
// function getInstance() {
//     var httpReq = false;
//     if (window.ActiveXObject)
//         httpReq = new ActiveXOjbect("Microsoft.XMLHTTP");
//     else if (window.XMLHttpRequest)
//         httpReq = new XMLHttpRequest();
//     return httpReq;
// }
//
// setInterval(function loadMessages() {
//     if (clickNewChannelFlag) {
//
//         var lis = $("#list-messages").children();
//         for (i = 0; i < lis.length; i++) {
//             lis[i].remove();
//         }
//
//         clickNewChannelFlag = 0;
//         globalLastCreatedAt = 0;
//     }
//
//     var httpReq = getInstance();
//     var url = "getMessageList.jsp?channelId=" + globalChannelId + "&createdAt=" + globalLastCreatedAt;
//     // TODO: 마지막 메시지의 createdAt을 받아와서 url의 파라미터로 설정해야함
//
//     httpReq.open("GET", url, true);
//     httpReq.onreadystatechange = function () {
//         if (httpReq.readyState == 4 && httpReq.status == 200) {
//             var xmlDocument;
//             if (window.ActiveXObject) {   //IE일 경우
//                 xmlDocument = new ActiveXObject('Microsoft.XMLDOM');
//                 xmlDocument.async = false;
//                 xmlDocument.loadXML(httpReq.responseText);
//             } else if (window.XMLHttpRequest) {   //Firefox, Netscape일 경우
//                 var xmlParser = new DOMParser();
//                 xmlDocument = xmlParser.parseFromString(httpReq.responseText, 'text/xml');
//
//             } else {
//                 return null;
//             }
//
//             var i;
//             var messages = xmlDocument.getElementsByTagName("message");
//
//             for (i = 0; i < messages.length; i++) {
//                 var message = messages[i];
//
//                 var id = message.getAttribute("id");
//                 var text = message.getAttribute("text");
//                 var starred = message.getAttribute("starred");
//                 var createdAt = message.getAttribute("createdAt");
//                 var channelId = message.getAttribute("channelId");
//                 var userNickname = message.getAttribute("userNickname");
//                 var src = (starred ? "images/star_selected.png" : "images/star_unselected.png")
//
//                 if(i == messages.length-1)
//                     globalLastCreatedAt = createdAt;
//                 var markup;
//
//                 if (myNickname == userNickname) {
//                     markup = "<li class=\"i\"><div class=\"head\"><span class=\"name\">" + userNickname+ "</span><span class=\"time\">" + createdAt + "</span></div><div><div class=\"message\">" + text + "</div><input type=\"image\" class=\"iButton\" src=\"" + src + "\" starred=\"" + starred + "\"/></div></li>";
//                 } else {
//                     markup = "<li class=\"friend-with-a-SVAGina\"><div class=\"head\"><span class=\"name\">" + userNickname+ "</span><span class=\"time\">" + createdAt + "</span></div><div><div class=\"message\">" + text + "</div><input type=\"image\" class=\"friendButton\" src=\"" + src + "\" starred=\"" + starred + "\"/></div></li>";
//                 }
//                 document.getElementById("list-messages").innerHTML += markup;
//             }
//         }
//     };
//     httpReq.send();
// },1000);
//
// function insertMessage() {
//     var httpReq = getInstance();
//     var text = document.getElementById("text").value;
//     var channelId = document.getElementById("channelId").value; //long type
//     var params = "text=" + text + "&channelId=" + globalChannelId + "&userNickname=" + myNickname;
//
//     if (httpReq) {
//         httpReq.open("POST", 'send.jsp');
//         httpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//         httpReq.onreadystatechange = function () {
//             if (httpReq.readyState == 4 && httpReq.status == 200) {
//                 alert(httpReq.responseText);
//             }
//         }
//         httpReq.send(params);
//     }
// }
//
// function setGlogalChannelId(nowChannelId) {
//     globalChannelId = nowChannelId;
//     clickNewChannelFlag = 1;
//
//     $("li").click(function () {
//         $("li").removeAttr("style");
//         $(this).css("background-color", "lightblue");
//     });
// }
//
// $(function () {
//     $("li").click(function () {
//         $("li").removeAttr("style");
//         $(this).css("background-color", "lightblue");
//     }); //이부분이 li 클릭햇을때 이벤
// });
// function filterFunction() {
//     var input, filter, ul, li, a, i;
//     input = document.getElementById("my-input");
//     filter = input.value.toUpperCase();
//     div = document.getElementById("list-friends");
//     a = div.getElementsByTagName("li");
//
//     for (i = 0; i < a.length; i++) {
//         if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
//             a[i].style.display = "";
//         } else {
//             a[i].style.display = "none";
//         }
//     }
// }
//
// function myFunction() {
//     document.getElementById("my-dropdown").classList.toggle("show");
// }