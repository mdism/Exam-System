/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamSyatem;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebInitParam;

/**
 *
 * @author mdism
 */
@WebServlet(name = "DB_Interface", urlPatterns = {"/DB_Interface"}, initParams
        = {
            @WebInitParam(name = "QTableName", value = "qdata")
            ,
        @WebInitParam(name = "QuestionTableName", value = "qdata")
            ,
        @WebInitParam(name = "UserTableName", value = "userinfo")
            ,
        @WebInitParam(name = "MassageFromQues", value = "")
        }
)
public class DB_Interface extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.InterruptedException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InterruptedException {
        response.setContentType("text/html;charset=UTF-8");
        String ProcessType = "ProcessType";

        String AddQutionsId = "1001";      // 9
        String AddUserId = "2001";      // 9
//        int Qnum = 0;
        RequestDispatcher Rd;
        try (PrintWriter out = response.getWriter()) {
            String LastPage = (String) request.getAttribute("LastPage");
            String Process = (String) request.getAttribute(ProcessType);
            if (Process.equals(AddQutionsId)) {
                Questions q1 = (Questions) request.getAttribute("Qobject");
                Error e1 = new Error();
                try {
                    if (LoadQuestion(q1, e1)) {
//                        out.println("<p>DataAdded Sucsessfull</p>");
//                        out.println("<a href=AddQuetions.jsp> <p><h3>add more Question</H3></p>");
//                        out.println("<a href=index.jsp> <p><h3>Home</H3></p>");
                        request.setAttribute("Error", "Question Loaded Sucsessfull.");
                        q1.flush();
                        if (LastPage != null) {
                            Rd = request.getRequestDispatcher(LastPage);
                        }else{
                            Rd = request.getRequestDispatcher("index.jsp");
                        }
                        Rd.forward(request, response);
                    } else {
                        out.println(e1);
                        request.setAttribute("Error", e1);
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    out.println(e);
                    request.setAttribute("Error", (String) getInitParameter("MassageFromQues"));
                }
            }
            if (Process.equals(AddUserId)) {
                UserInfo User = (UserInfo) request.getAttribute("LoadUseObject");
                Error e1 = new Error();
                try {
                    if (LoadUser(User, e1)) {
                        if (LastPage != null) {
                            Rd = request.getRequestDispatcher(LastPage);
                        } else {
                            Rd = request.getRequestDispatcher("index.jsp");
                        }
                        Rd.forward(request, response);
                    } else {
                        out.println(e1.getIQ_Massege());
                        request.setAttribute("Error", e1.getIQ_Massege());

                    }
                } catch (ClassNotFoundException | SQLException e) {
                    out.println(e);
                    out.println(e1.getIQ_Massege());
                    request.setAttribute("Error", e1.getIQ_Massege());

                }
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(DB_Interface.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(DB_Interface.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Boolean LoadQuestion(Questions q, Error e1) throws SQLException, ClassNotFoundException {

        try {

            String Course = q.getCourse();
            String Qus = q.getQus();
            String Option1 = q.getOption1();
            String Option2 = q.getOption2();
            String Option3 = q.getOption3();
            String Option4 = q.getOption4();
            String Answer = q.getAnswer();
            String QTableName = getInitParameter("QTableName");
            if (QTableName != null) {
                if (Qus != null && Option1 != null && Option2 != null
                        && Option3 != null && Option4 != null && Answer != null) {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/examdb?zeroDateTimeBehavior=convertToNull", "root", "");

                    PreparedStatement ps = conn.prepareStatement("INSERT INTO " + QTableName + " VALUES (?,?,?,?,?,?,?,?)");
                    ps.setString(1, null);
                    ps.setString(2, Course);
                    ps.setString(3, Qus);
                    ps.setString(4, Option1);
                    ps.setString(5, Option2);
                    ps.setString(6, Option3);
                    ps.setString(7, Option4);
                    ps.setString(8, Answer);
                    int i = ps.executeUpdate();
                    if (i > 0) {

                        return true;
                    } else {
                        e1.setErrorInInsertingData(true);
                        return false;
                    }

                }
                e1.setIncompliteQuestion(true);
                return false;
            } else {
                e1.setDBNameNotFound(true);
                return false;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e1.setIQ_Massege(e.toString());
            return false;
        }

    }

    private Boolean LoadUser(UserInfo User, Error e1) throws SQLException, ClassNotFoundException {

        try {
            if (ChkUser(User)) {
                String Name = User.getName();
                String Mobile = User.getMobile();
                String Email = User.getEmail();
                String Password = User.getPassword();
                String SecLevel = User.getSecLevel();
                String course = User.getCourse();

                String UserTableName = getInitParameter("UserTableName");

                if (UserTableName != null) {
                    if (Name != null && Mobile != null && Email != null
                            && Password != null && SecLevel != null && course != null) {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/examdb?zeroDateTimeBehavior=convertToNull", "root", "");
                        PreparedStatement ps = conn.prepareStatement("INSERT INTO "
                                + UserTableName + " VALUES (?,?,?,?,?,?,?,?)");
                        ps.setString(1, null);
                        ps.setString(2, Name);
                        ps.setString(3, Email);
                        ps.setString(4, Password);
                        ps.setString(5, course);
                        ps.setString(6, null);
                        ps.setString(7, Mobile);
                        ps.setString(8, SecLevel);
                        int i = ps.executeUpdate();
                        if (i > 0) {
                            return true;
                        } else {
                            e1.setIQ_Massege("Error: Error In inserting Data to Database.");
                            e1.setErrorInInsertingData(true);
                            return false;
                        }

                    }
                    e1.setIQ_Massege("Incomplite User Information:");
                    e1.setIncompliteQuestion(true);
                    return false;
                } else {
                    e1.setIQ_Massege("DataBase name not found");
                    return false;
                }
            } else {
                e1.setIQ_Massege("User Alredy Registered");
                return false;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e1.setIQ_Massege(e.toString());
            return false;
        }

    }

    private Boolean ChkUser(UserInfo u) throws ClassNotFoundException, SQLException {
        String UserTableName = getInitParameter("UserTableName");

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/examdb?zeroDateTimeBehavior=convertToNull", "root", "");
        Statement statement = conn.createStatement();
        String str = "SELECT * FROM "
                + UserTableName + " WHERE email='" + u.getEmail() + "' OR mobile='" + u.getMobile() + "';";
        ResultSet rs = statement.executeQuery(str);
        if (!rs.next()) {
            return true;
        } else {
            return false;
        }

    }

}
