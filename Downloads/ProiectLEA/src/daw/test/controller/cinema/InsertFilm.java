/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daw.test.controller.cinema;

import daw.test.model.bean.FilmBean;
import daw.test.model.FilmDAO;
import daw.test.model.bean.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author adria
 */
public class InsertFilm extends HttpServlet {

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
            out.println("<title>Servlet InsertFilm</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertFilm at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String nume = request.getParameter("nume");
        String an = request.getParameter("an");
        String genul = request.getParameter("genul");
        String durata =request.getParameter("durata");
        String descriere = request.getParameter("descriere");
        String actori = request.getParameter("actori");
        String format = request.getParameter("format");
        String traducere = request.getParameter("traducere");
        String video = request.getParameter("video");
        String poza = request.getParameter("poza");
        
        UserBean user = new UserBean();
        HttpSession session = request.getSession();
        user = (UserBean) session.getAttribute("currentSessionUser");
        
        String add ="images/cinemapho/";
        String newpoza = add+poza;
        
        FilmBean film = new FilmBean();
        
        film.setIdUser(user.getIdUser());
        film.setNume(nume);
        film.setAn(an);
        film.setGenul(genul);
        film.setDurata(durata);
        film.setDescriere(descriere);
        film.setActori(actori);
        film.setFormat(format);
        film.setTraducere(traducere);
        film.setPoza(newpoza);
        film.setVideo(video);
        
        FilmDAO.insertFilm(film);
        
        response.sendRedirect("Film");
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
