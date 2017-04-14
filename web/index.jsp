<%-- 
    Document   : index
    Created on : Mar 27, 2017, 7:08:09 AM
    Author     : mdism
--%>


<%@page import="ExamSyatem.UserInfo"%>
<%@page import="ExamSyatem.Questions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam System</title>
        <link rel="stylesheet" href="w3css.css" type="text/css">
    </head>
    <body>
        <%--<%@include file="header.jsp" %>--%>

        <div class="w3-topbar w3-gray">
            <div class="bar w3-padding-12 w3-card-2 w3-gray w3-container">
                <a class="w3-button w3-blue " href="index.jsp" style="font-family: "serif" color: #ccccff" ><b>Exam |</b> System</a>
                <div class="w3-right w3-hide-small">
                    <%
                        HttpSession ss = request.getSession(false);
                        UserInfo user = (UserInfo) ss.getAttribute("UserInfo");
                        if (user == null) {
                    %>

                    <a class="w3-button w3-white  w3-bar-item" href="login.jsp" style="font-family: "serif" color: #ccccff">Login</a>
                    <%}
                    %>
                    <%
                        if (user != null && (!user.getSecLevel().equals("Level1"))) {
                    %>
                    <a class="w3-button w3-white  w3-bar-item" href="AddUser.jsp" style="font-family: "serif" color: #ccccff" >Register</a>
                    <a class="w3-button w3-white  w3-bar-item" href="AddQuetions.jsp" style="font-family: "serif" color: #ccccff" >Add Questions</a>
                    <a class="w3-button w3-white  w3-bar-item" href="AllUser.jsp" style="font-family: "serif" color: #ccccff" >All Student</a>
                    <a class="w3-button w3-white  w3-bar-item" href="AllQuestions.jsp" style="font-family: "serif" color: #ccccff" >All Question</a>
                    <%}
                        if (user != null && user.getSecLevel().equalsIgnoreCase("Level1")) {%>
                    <a class="w3-button w3-white  w3-bar-item" href="#" style="font-family: "serif" color: #ccccff" >Exam</a>
                    <%}
                    %>

                    <a class="w3-button w3-white  w3-bar-item w3-margin-right" href="#" style="font-family: "serif" color: #ccccff" >ContactUs</a>
                </div>
            </div>
        </div>

        <div class="w3-container">
            <%
                if (user != null) {
            %>
            <div class="w3-container w3-right-align">
                <p><label class="w3-right-align w3-label">Welcome: <%=user.getName()%></label></p>
                <a href="logout.jsp" style="color: red"  <label class="w3-label   w3-right-align " > Logout</label></a>
            </div>
            <%}
                String Error = (String) request.getAttribute("Error");
                if (Error != null) {%>
            <label class="w3-right-align w3-label"><%=Error%></label>
            <%}%>
            <div class="w3-container">
                <div class="w3-container">
                    <h1>Hello World!</h1>
                </div>
            </div>
        </div>
    </body>
</html>
