(function () {
    var conf, lol, insertI, star;

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

    insertI = function () {
        var innerText;
        innerText = $.trim($("#text").val());

        if (innerText !== "") {

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
        $("#list-messages").scrollTop(document.getElementById("list-messages").scrollHeight);
    });
    //document.body.scrollTop = document.body.scrollHeight;


}).call(this);
