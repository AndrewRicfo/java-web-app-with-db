/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.DatabaseMethods;
import entities.usersDiary;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "mark", urlPatterns = {"/mark"})
public class adMarkServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            request.setCharacterEncoding("UTF-8");
            addAttributes.addFacList(session, DatabaseMethods.groupList(session.getAttribute("tfaculty").toString()));
            session.setAttribute("usersdiary", null);
            ArrayList<usersDiary> usersDiary = new ArrayList<>(DatabaseMethods.userDiary(session.getAttribute("uname").toString()));
            addAttributes.addDiaryList(session, usersDiary);
            request.getRequestDispatcher("WEB-INF/teacher_page_gr_week.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adMarkServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        DatabaseMethods.addMark(request.getSession().getAttribute("uname").toString(),
                request.getParameter("1-week-teacher"),
                request.getParameter("2-week-teacher"),
                request.getParameter("3-week-teacher"));
        response.sendRedirect("mark");

    }
}
