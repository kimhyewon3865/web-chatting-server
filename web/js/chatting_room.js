(function () {
    var conf, lol, insertI, onChannelSelected, NYLM, claerResizeScroll, getRandomInt;
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
        $("#text").keypress(function (e) {
            if (e.keyCode === 13) {
                insertI();
                return false;
            }
        });
        return $(".send").click(function () {
            return insertI();
        });
    });
}).call(this);
