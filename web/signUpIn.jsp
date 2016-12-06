<%--
  Created by IntelliJ IDEA.
  User: kimhyewon
  Date: 2016. 12. 6.
  Time: 오후 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>signupin</title>
    <link rel="stylesheet" href="css/signUpIn.css">

</head>
<body>
<div class="form">
    <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
    </ul>
    <div class="tab-content">
        <div id="signup">
            <h3>Sign Up for Free</h3>
            <form action="./signInCheck.jsp" method="post">
                <div class="field-wrap">
                    <label>
                        nick Name<span class="req">*</span>
                    </label>
                    <input type="text" required autocomplete="off" name="signUpNickName"/>
                </div>

                <div class="field-wrap">
                    <label>
                        Set A Password<span class="req">*</span>
                    </label>
                    <input type="password"required autocomplete="off"/>
                </div>
                <button type="submit" class="button button-block" onclick="signUpButton()">Get Started</button>
            </form>
        </div>

        <div id="login">
            <h3>Welcome Back!</h3>
            <form action="./signInCheck.jsp" method="post">
                <div class="field-wrap">
                    <label>
                        nick Name<span class="req">*</span>
                    </label>
                    <input type="text" required autocomplete="off" name="signInNickName"/>
                </div>
                <div class="field-wrap">
                    <label>
                        Password<span class="req">*</span>
                    </label>
                    <input type="password"required autocomplete="off" name="signInPassword"/>
                </div>
                <p class="forgot"><a href="#">Forgot Password?</a></p>
                <button class="button button-block"/>Log In</button>
            </form>
        </div>
    </div><!-- tab-content -->
</div> <!-- /form -->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="js/signUpIn.js"></script>
<script>
    function signUpButton() {
        alert("");
    }
</script>
</body>
</html>
