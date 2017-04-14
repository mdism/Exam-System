<%-- 
    Document   : logout
    Created on : Apr 1, 2017, 5:27:20 PM
    Author     : mdism
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            HttpSession ss = request.getSession(false);
            ss.invalidate();
            RequestDispatcher Rd = request.getRequestDispatcher("index.jsp");
            request.removeAttribute("UserInfo");
            Rd.forward(request, response);
        %>
    </body>
</html>
