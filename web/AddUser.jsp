<%-- 
    Document   : AddUser
    Created on : Mar 28, 2017, 7:56:07 PM
    Author     : mdism
--%>

<%@page import="ExamSyatem.UserInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam System| Add User</title>
        <link rel="stylesheet" href="w3css.css" type="text/css">
    </head>
    <body>
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
                        if (user != null && user.getSecLevel() != "Level1") {
                    %>
                    <a class="w3-button w3-white w3-bar-item" href="AddUser.jsp" style="font-family: "serif" color: #ccccff" >Register</a>
                    <a class="w3-button w3-white  w3-bar-item" href="AddQuetions.jsp" style="font-family: "serif" color: #ccccff" >Add Questions</a>

                    <a class="w3-button w3-white  w3-bar-item" href="AllUser.jsp" style="font-family: "serif" color: #ccccff" >All Student</a>
                    <a class="w3-button w3-white  w3-bar-item" href="AllUser.jsp" style="font-family: "serif" color: #ccccff" >All Question</a>
                    <%}
                        if (user != null && user.getSecLevel().equalsIgnoreCase("Level1")) {%>
                    <a class="w3-button w3-white  w3-bar-item" href="#" style="font-family: "serif" color: #ccccff" >Exam</a>
                    <%}
                    %>

                    <a class="w3-button w3-white  w3-bar-item w3-margin-right" href="#" style="font-family: "serif" color: #ccccff" >ContactUs</a>
                </div>
            </div>
        </div>
        <%
//            if (!ss.) {
        %>
        <div class="w3-container">
            <%
                if (user != null) {
            %>
            <div class="w3-container w3-right-align">
                <label class="w3-right-align w3-label">WelCome <%=user.getName()%></label>
                <a href="logout.jsp"  <label class="w3-label  w3-right-align " > Logout</label></a>
            </div>
            <%}
                String Error = (String) request.getAttribute("Error");
                if (Error != null) {%>
            <label class="w3-right-align w3-label"><%=Error%></label>
            <%}%>
            <div class="w3-container">
                <div class="w3-container">
                    <form class="w3-form" action="Controller.jsp" method="POST">
                        <input type="hidden" value="2001" name="ActionId"/>
                        Name: <input type="text" class="w3-input" name="name">
                        Mobile: <input type="text" class="w3-input" name="mobile">
                        Email: <input type="text" class="w3-input" name="email">
                        Password: <input type="password" class="w3-input" name="password">
                        Re-Password: <input type="text" class="w3-input" name="repassword">
                        Batch : <input type="text" class="w3-input" name="course"><br>
                        <select  class="w3-select w3-input" name="secLevel">
                            <option value=""  disabledselected>Choose your option</option>
                            <option value="Level1">Student</option>
                            <option value="Level2">Admin</option>
                            <option value="Level3">Class</option>
                            <option value="Level4">Developer</option>
                        </select><br><br>
                        <input type="submit" value="Submit" name="submit" class="w3-button"/>
                </div>
            </div>
        </div>
        <% 
//else {
//                RequestDispatcher Rd = request.getRequestDispatcher("login.jsp");
//                request.setAttribute("Error","Please Login to see this Page!!!");
////                request.setAttribute("LastPage", "");
//                Rd.forward(request, response);
//            }
        %>

        <%!
//            String ValidateRegister(HttpServletRequest req) {
//                String name = req.getParameter("name");
//                String temp = "#";
//                if (name != null) {%>
        <%--<jsp:setProperty name="user1" property="*" ></jsp:setProperty>--%>
        <%!
//                   return "Controller.jsp";
//                }
//                return temp;
//            }
%>
    </body>
</html>
