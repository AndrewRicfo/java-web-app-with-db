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


@WebServlet(name = "diary", urlPatterns = {"/diary"})
public class diaryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/user_page.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            request.setCharacterEncoding("UTF-8");
            DatabaseMethods.weekUpdate(request.getSession().getAttribute("name").toString(),
                    request.getParameter("1-week-results"),
                    request.getParameter("2-week-results"),
                    request.getParameter("3-week-results"));
            ArrayList<usersDiary> diarylist = new ArrayList<>(DatabaseMethods.userDiary(request.getSession().getAttribute("name").toString()));
            addAttributes.addDiaryList(session, diarylist);
            request.setAttribute("dataRefresh", 1);
            response.sendRedirect("diary");
        } catch (SQLException ex) {
            Logger.getLogger(diaryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
