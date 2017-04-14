<%-- 
    Document   : UserInfoLable
    Created on : Apr 1, 2017, 5:36:05 PM
    Author     : mdism
--%>

<%@page import="ExamSyatem.UserInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="w3css.css" type="text/css">
    </head>
    <body>
        <%
            HttpSession ss = request.getSession(false);
            UserInfo user = (UserInfo) ss.getAttribute("UserInfo");
            if (user != null) {%>
        <label class="w3-right-align w3-label">WelCome <%=user.getName()%></label>
        <a href="logout.jsp"  <label class="w3-label  w3-right-align " > Logout</label></a>
        <%}
            String Error = (String) request.getAttribute("Error");
            if (Error != null) {%>
        <label class="w3-right-align w3-label"><%=Error%></label>
            <%}
        %>


    </body>
</html>
