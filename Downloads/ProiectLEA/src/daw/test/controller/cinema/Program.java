/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daw.test.controller.cinema;

import daw.test.model.CinemaDAO;
import daw.test.model.FilmDAO;
import daw.test.model.bean.ProgramBean;
import daw.test.model.ProgramDAO;
import daw.test.model.bean.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author adria
 */
public class Program extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Program</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Program at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
       ArrayList<ProgramBean> pb = new ArrayList<ProgramBean>();

        UserBean user = new UserBean();
        HttpSession session = request.getSession();
        user = (UserBean) session.getAttribute("currentSessionUser");
        
        int idCinema = CinemaDAO.getByIdUser(Integer.toString(user.getIdUser()));
        
        
        pb = ProgramDAO.getByIdCinema(Integer.toString(idCinema));
        
        ArrayList<String> filme = new ArrayList<String> ();
        String film;
        for(int i=0; i<pb.size(); i++){
            film = FilmDAO.getnumeFilm(Integer.toString(pb.get(i).getIdFilm()) );
            filme.add(film);
        }
        
        request.setAttribute("program", pb);
        request.setAttribute("filme", filme);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/cinemaUser/program.jsp");
        dispatcher.forward(request, response);
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

}
