<%-- 
    Document   : AllUser
    Created on : Apr 2, 2017, 6:05:57 PM
    Author     : mdism
--%>

<%@page import="ExamSyatem.UserInfo"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam System| All User</title>
          <link rel="stylesheet" href="w3css.css" type="text/css">
    </head>
      <body>
        <%--<%@include  file="header.jsp" %>--%>
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
                    <a class="w3-button w3-white  w3-bar-item" href="#" style="font-family: "serif" color: #ccccff" >All Student</a>
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
        <%
            if (user != null) {
        %>
        <div class="w3-container w3-right-align">
            <p><label class="w3-right-align w3-label">Welcome <%=user.getName()%></label></p>
            <a href="logout.jsp"  <label class="w3-label  w3-right-align " > Logout</label></a>
        </div>
        <h3>Please Add All the informations</h3>
        <jsp:useBean id="q1" class="ExamSyatem.Questions" scope="application"></jsp:useBean>
        <%}
            String Error = (String) request.getAttribute("Error");
            if (Error != null) {%>
        <label class="w3-right-align w3-label"><%=Error%></label>
        <%}%>

        <h3>All Users</h3>
        <!--        <div class="w3-container">
                    <div class="w3-container">
                        <div class="w3-container">
                            <form class="w3-form">
                                Input Batch: <input class="w3-input" name="batch"/>
                                
                            </form>
                        </div>
                    </div>
                </div>-->
        <%
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/examdb?zeroDateTimeBehavior=convertToNull", "root", "");
                Statement statement = conn.createStatement();
                ResultSet resultset = statement.executeQuery("Select * from userinfo");%>
  <div class="w3-container">
            <TABLE BORDER="2" class="w3-table">
                <TR>
                    <TH>User ID</TH>
                    <TH>Name</TH>
                    <TH>email</TH>
                    <TH>Password</TH>
                    <TH>Batch/TH>
                    <TH>LastLogin</TH>
                    <TH>mobile</TH>
                    <TH>SecLevel</TH>
                </TR>
                <% while (resultset.next()) {%>
                <TR>
                    <TD> <%= resultset.getString(1)%></td>
                    <TD> <%= resultset.getString(2)%></TD>
                    <TD> <%= resultset.getString(3)%></TD>
                    <TD> <%= resultset.getString(4)%></TD>
                    <TD> <%= resultset.getString(5)%></TD>
                    <TD> <%= resultset.getString(6)%></TD>
                    <TD> <%= resultset.getString(7)%></TD>
                    <TD> <%= resultset.getString(8)%></TD>
                </TR>
                <% }%>
            </table>
        </div>
                
        <%

            } catch (Exception e) {
            }
        %>
    </body>
</html>
