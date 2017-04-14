<%-- 
    Document   : AddQuetions
    Created on : Mar 28, 2017, 7:09:58 PM
    Author     : mdism
--%>

<%@page import="ExamSyatem.UserInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam System| Add Questions</title>
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
                    <a class="w3-button w3-white  w3-bar-item" href="AllUser.jsp" style="font-family: "serif" color: #ccccff" >All Student</a>
                    <a class="w3-button w3-white  w3-bar-item" href="#" style="font-family: "serif" color: #ccccff" >All Question</a>
                    <%}
                        if (user != null &&  user.getSecLevel().equalsIgnoreCase("Level1")) {%>
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
        <h1>Please Add All the informations</h1>
        <jsp:useBean id="q1" class="ExamSyatem.Questions" scope="application"></jsp:useBean>
            <%}
                String Error = (String) request.getAttribute("Error");
                if (Error != null) {%>
            <label class="w3-right-align w3-label"><%=Error%></label>
            <%}%>
    <!--</body><form method="Get" action="<%= QValidation(request)%>" >-->
        <form method="POST" action="Controller.jsp" class="w3-container">
            <!--this Information for controller to acsess the servlet-->
            <input type="hidden" value="1001" name="ActionId"/>
            <p>Please Enter A Question</p> 
            <div class="w3-container"> 
            <div class="w3-container"> 
            <div class="w3-container"> 
            <div class="w3-container"> 
           <% 
//                try {
//                int QNum = Integer.parseInt(request.getAttribute("Qnumber").toString());
//                if(QNum > 0){
//                    out.println("<p>" + QNum + "</p>");
//                }
//                } catch (Exception e) {
//                    out.println(e);
//                }
            %>
            Qusetion:<input class="w3-input" type="text" name="qus"/><br><br>
            Select Course : <input class="w3-input" `type=" text" name="course"><br>
            <br><br>

            <p>Please Input The Options </p>
            Option A : <input class="w3-input" type="text" name="option1"><br>
            Option B : <input class="w3-input" type="text" name="option2"><br>
            Option C : <input class="w3-input" type="text" name="option3"><br>
            Option D : <input class="w3-input" type="text" name="option4"><br>
            <br><br>
            Please Select an Answer:<Br>
            <input class="w3-radio" type="radio" name="answer" value="1" />Option A<br>
            <input class="w3-radio" type="radio" name="answer" value="2" />Option B<br>
            <input class="w3-radio" type="radio" name="answer" value="3" />Option C<br>
            <input class="w3-radio" type="radio" name="answer" value="4" />Option D<br>
            <br><br>

            <input name="Submit" type="submit" value="Submit" class="w3-button w3-gray">
            <br>
            <br>
            <br>
            <br>
            </div>
            </div>
            </div>
            </div>
         </form>

        <%!
            String QValidation(HttpServletRequest req) {
                String temp = "#";
                String Course, Qus, Option1, Option2, Option3, Option4, Answer;

                Course = req.getParameter("course");
                Qus = req.getParameter("qus");

                Option1 = req.getParameter("option1");
                Option2 = req.getParameter("option2");
                Option3 = req.getParameter("option3");
                Option4 = req.getParameter("option4");

                Answer = req.getParameter("answer");

                if (Course != null && Qus != null && Option1 != null && Option2 != null
                        && Option3 != null && Option4 != null && Answer != null) {
        %>
        <%--<jsp:setProperty name="q1" property="*" ></jsp:setProperty>--%>
        <%!
                    return "Controller.jsp";
                }
                return temp;
            }
                %>
    </body>
</html>
