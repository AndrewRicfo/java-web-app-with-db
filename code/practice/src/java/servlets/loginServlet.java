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


@WebServlet(name = "login", urlPatterns = {"/login"})
public class loginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            ArrayList<String> userPlace = new ArrayList<>(DatabaseMethods.userPlace(session.getAttribute("name").toString()));
            addAttributes.addUserPlace(session, userPlace);
            ArrayList<usersDiary> diarylist = new ArrayList<>(DatabaseMethods.userDiary(session.getAttribute("name").toString()));
            addAttributes.addDiaryList(session, diarylist);
            response.sendRedirect("diary");
        } catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String res = DatabaseMethods.login(login, password);
        if (res.equals("1")) {
            
                session.setAttribute("Authorized", "1");
                if (request.getParameter("lrole").equals("1")) {
                    try {
                        ArrayList<String> teacherlist = new ArrayList<>(DatabaseMethods.teacherInfo(login));
                        addAttributes.addTeacherInfo(session, teacherlist);
                        response.sendRedirect("group");
                    } catch (SQLException ex) {
                        Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
                        session.setAttribute("roleError", 0);
                        response.sendRedirect("index");
                    }
                } else {
                    try {
                        ArrayList<String> userlist = new ArrayList<>(DatabaseMethods.userInfo(login));
                        addAttributes.addUserInfo(session, userlist);
                        ArrayList<usersDiary> diarylist = new ArrayList<>(DatabaseMethods.userDiary(request.getSession().getAttribute("name").toString()));
                        addAttributes.addDiaryList(session, diarylist);
                        addAttributes.addPlaceList(session, DatabaseMethods.placeInfo());
                        ArrayList<String> userPlace = new ArrayList<>(DatabaseMethods.userPlace(request.getSession().getAttribute("name").toString()));
                        addAttributes.addUserPlace(session, userPlace);
                        response.sendRedirect("diary");
                    } catch (SQLException ex) {
                        Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
                        session.setAttribute("roleError", 1);
                        response.sendRedirect("index");
                    }
                }

        } else if (res.equals("0")) {
            session.setAttribute("authError", 1);
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        } else {
            session.setAttribute("authError", 2);
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }
    }
}
