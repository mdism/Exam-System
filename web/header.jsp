<%-- 
    Document   : header
    Created on : Mar 26, 2017, 11:20:46 AM
    Author     : mdism
--%>

<%@page import="ExamSyatem.UserInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="w3css.css" type="text/css">
<div class="w3-topbar w3-gray">
    <div class="bar w3-padding-12 w3-card-2 w3-gray w3-container">
        <a class="w3-button w3-blue " href="index.jsp" style="font-family: "serif" color: #ccccff" ><b>Exam |</b> System</a>
        <div class="w3-right w3-hide-small">
            <%
//                HttpSession ss = request.getSession(false);
//                UserInfo user = (UserInfo) ss.getAttribute("UserInfo");
//                if (user == null) { 
            %>
            <a class="w3-button w3-white  w3-bar-item" href="login.jsp" style="font-family: "serif" color: #ccccff">Login</a>
            <a class="w3-button w3-white w3-bar-item" href="AddUser.jsp" style="font-family: "serif" color: #ccccff" >Register</a>
            <a class="w3-button w3-white  w3-bar-item" href="AddQuetions.jsp" style="font-family: "serif" color: #ccccff" >Add Questions</a>
            <a class="w3-button w3-white  w3-bar-item" href="#" style="font-family: "serif" color: #ccccff" >Add Users</a>
            <a class="w3-button w3-white  w3-bar-item" href="#" style="font-family: "serif" color: #ccccff" >Exam</a>
            <a class="w3-button w3-white  w3-bar-item" href="#" style="font-family: "serif" color: #ccccff" >All Student</a>
            <a class="w3-button w3-white  w3-bar-item" href="#" style="font-family: "serif" color: #ccccff" >All Question</a>
            <a class="w3-button w3-white  w3-bar-item w3-margin-right" href="#" style="font-family: "serif" color: #ccccff" >ContactUs</a>
        </div>
    </div>
</div>

