<%-- 
    Document   : Controller
    Created on : Mar 28, 2017, 2:38:17 PM
    Author     : mdism
--%>

<%@page import="javax.websocket.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ExamSyatem.Questions" %>
<%@page import="ExamSyatem.UserInfo" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="q1" class="ExamSyatem.Questions" scope="application"></jsp:useBean>
        <jsp:useBean id="newUser" class="ExamSyatem.UserInfo" scope="application"></jsp:useBean>
        <%!
            String ProcessType = "ProcessType";
            String DBInterfacePageName = "DB_Interface";
            String AuthINterfacePageName = "auth.jsp";

            String AddQutionsId = "1001";      // this will use when we nee to add questions
            String AddUserId = "2001";      // this will be used when we need to add / Register the user
            String LoginProcessId = "3001";      // this will be used when login / for authencation of the user
        %>
        
        <%
            String pageid = request.getParameter("ActionId");
            RequestDispatcher rd;
            try {
                if (pageid.equals(AddQutionsId)) {%>
        <jsp:setProperty name="q1" property="*" ></jsp:setProperty>
        <%
                rd = request.getRequestDispatcher(DBInterfacePageName);
                request.setAttribute(ProcessType, AddQutionsId);
                request.setAttribute("LastPage", "AddQuetions.jsp");
                request.setAttribute("Qobject", q1);
                rd.forward(request, response);
            }
            if (pageid.equals(AddUserId)) {%>
            <jsp:setProperty name="newUser" property="*" ></jsp:setProperty>
        <%
                rd = request.getRequestDispatcher(DBInterfacePageName);
                request.setAttribute(ProcessType, AddUserId);
                request.setAttribute("LoadUseObject", newUser);
                rd.forward(request, response);
            }
        } catch (Exception e) {
        %>
        <%@include file="ErrorPage.jsp" %>
        <%            }
        %>
    </body>
</html>
