<%@page import="com.sun.corba.se.spi.protocol.RequestDispatcherDefault"%>
<%@page import="java.sql.*"%>
<%--<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>--%>
<%-- 
    Document   : auth
    Created on : Mar 28, 2017, 8:27:02 PM
    Author     : mdism
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authorizing</title>
    </head>
    <body>
        <jsp:useBean id="user1" class="ExamSyatem.UserInfo" scope="session"></jsp:useBean>
        <jsp:setProperty name="user1"  property="email"></jsp:setProperty>
        <jsp:setProperty name="user1"  property="password"></jsp:setProperty>

        <%
            HttpSession ss = request.getSession(false);
            RequestDispatcher Rd;
            if (!ss.isNew()) {
                try {

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/examdb?zeroDateTimeBehavior=convertToNull", "root", "");
                    String qStr = "SELECT * from  userinfo WHERE email='" + user1.getEmail() + "' AND password='"
                            + user1.getPassword() + "';";
                    Statement statment = conn.createStatement();
                    ResultSet Rs = statment.executeQuery(qStr);
                     if (Rs.next()) {
                        user1.setId((Rs.getInt(1)));
                        user1.setName(Rs.getString(2));
                        user1.setEmail(Rs.getString(3));
                        user1.setCourse(Rs.getString(5));
                        user1.setLasttime(Rs.getString(6));
                        user1.setMobile(Rs.getString(7));
                        user1.setSecLevel(Rs.getString(8));
                        ss.setAttribute("UserInfo", user1);
                        Rd = request.getRequestDispatcher("index.jsp");

                    } else {
                        out.println("error in login");
                        Rd = request.getRequestDispatcher("index.jsp");
                        request.setAttribute("Error", "Invalid Loggin info.");
                    }

                } catch (Exception e) {
                    out.println("Error: Unable to Connect to Database");
                    out.println("<p>" + e + "</p>");
                    Rd = request.getRequestDispatcher("login.jsp");
                    request.setAttribute("Error", "Please TryAgain");
                }
            } else {
                Rd = request.getRequestDispatcher("login.jsp");
                request.setAttribute("Error", "Please Login");
            }
            Rd.forward(request, response);

        %>

        <!--        <sql:setDataSource dataSource="examdb" driver="com.mysql.jdbc.Driver" scope="reqeust" 
                           url="jdbc:mysql://localhost:3306/examdb?zeroDateTimeBehavior=convertToNull"
                           user="root" password="" var="auth1"></sql:setDataSource>
        <sql:query var="auth1" scope="session" dataSource="userinfo">
            SELECT * FROM table_name where email=email AND password=password;
        </sql:query>
            
            <sql-->


    </body>
</html>
