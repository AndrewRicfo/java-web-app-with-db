/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.DatabaseMethods;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "registration", urlPatterns = {"/registration"})
public class registrationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        session.setAttribute("Authorized", "0");
        request.getRequestDispatcher("WEB-INF/registration.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name1").trim() + " " + request.getParameter("name2").trim()
                + " " + request.getParameter("name3").trim();
        String registerUser = DatabaseMethods.registration(name,
                request.getParameter("logn"),
                request.getParameter("pwd"),
                request.getParameter("fac"),
                request.getParameter("group"));
        if (registerUser == null) {
            request.getSession().setAttribute("regError", 1);
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        } else if (registerUser.equals("1")) {
            request.getSession().setAttribute("regError", 1);
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);

        } else {
            request.getSession().setAttribute("regError", 2);
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }
    }
}
