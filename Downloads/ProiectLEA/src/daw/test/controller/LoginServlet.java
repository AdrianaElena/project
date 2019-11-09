package daw.test.controller;

import daw.test.model.bean.CinemaBean;
import daw.test.model.CinemaDAO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daw.test.model.bean.UserBean;
import daw.test.model.UserDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

public class LoginServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        try {
            UserBean user = new UserBean();
            user.setUserName(request.getParameter("un"));
            user.setPassword(request.getParameter("pw"));
            user = UserDAO.login(user);
            if (user.isValid()){
                
                HttpSession session = request.getSession(true);
                session.setAttribute("currentSessionUser", user);
                
                System.out.println(user.getRole());
                if(user.getRole().equals("normal") ){
                    response.sendRedirect("HomeServlet"); // logged-in page
                }
                if(user.getRole().equals("cinemaUser")){
                    response.sendRedirect("Film"); // logged-in page
                }
                
                
            } else {
                response.sendRedirect("/Login/invalidLogin.jsp"); // error page
            }

        } catch (Throwable theException) {
            System.out.println(theException);
        }
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
