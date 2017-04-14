<%-- 
    Document   : login
    Created on : Mar 28, 2017, 7:27:31 PM
    Author     : mdism
--%>

<%@page import="ExamSyatem.UserInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="w3css.css" type="text/css">
    </head>
    <body>

        <div class="w3-topbar w3-gray">
            <div class="bar w3-padding-12 w3-card-2 w3-gray w3-container">
                <a class="w3-button w3-blue " href="index.jsp" style="font-family: "serif" color: #ccccff" ><b>Exam |</b> System</a>
                <div class="w3-right w3-hide-small">
                    <%
                        HttpSession ss = request.getSession(false);
                        UserInfo user = (UserInfo) ss.getAttribute("UserInfo");%>
                    <a class="w3-button w3-white  w3-bar-item" href="login.jsp" style="font-family: "serif" color: #ccccff">Login</a>
                    <%
                        if (user != null && user.getSecLevel() != "Level1") {
                    %>
                    <a class="w3-button w3-white w3-bar-item" href="AddUser.jsp" style="font-family: "serif" color: #ccccff" >Register</a>
                    <a class="w3-button w3-white  w3-bar-item" href="AddQuetions.jsp" style="font-family: "serif" color: #ccccff" >Add Questions</a>

                    <!--                    <a class="w3-button w3-white  w3-bar-item" href="#" style="font-family: "serif" color: #ccccff" >Add Users</a>-->
                    <a class="w3-button w3-white  w3-bar-item" href="AllUser.jsp" style="font-family: "serif" color: #ccccff" >All Student</a>
                    <a class="w3-button w3-white  w3-bar-item" href="AllQuestions.jsp" style="font-family: "serif" color: #ccccff" >All Question</a>
                    <%}
                    %>
                    <a class="w3-button w3-white  w3-bar-item" href="#" style="font-family: "serif" color: #ccccff" >Exam</a>
                    <a class="w3-button w3-white  w3-bar-item w3-margin-right" href="#" style="font-family: "serif" color: #ccccff" >ContactUs</a>
                </div>
            </div>
        </div>
        <%
//            HttpSession ss = request.getSession(true);
%>
    <body>
        <div class="w3-container">
            <div class="w3-container ">
                <div class="w3-container ">
                    <div class="w3-container w3-center">
                        <h1 >Please Enter Login Information</h1>
                    </div>
                    <div class="w3-container ">
                        <form method="POST" action="auth.jsp" class="w3-form ">
                            Email ID: <input class="w3-input " name="email" ><br>
                            Password : <input class="w3-input " type="password" name="password"><br>
                            <input type="submit" value="Submit" name="submit" class=" w3-button w3-right w3-round-large" />
                        </form> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
