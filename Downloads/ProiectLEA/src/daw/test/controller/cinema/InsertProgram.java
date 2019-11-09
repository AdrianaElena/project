/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daw.test.controller.cinema;

import daw.test.model.CinemaDAO;
import daw.test.model.bean.ProgramBean;
import daw.test.model.ProgramDAO;
import daw.test.model.bean.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author adria
 */
public class InsertProgram extends HttpServlet {

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
            out.println("<title>Servlet InsertProgram</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertProgram at " + request.getContextPath() + "</h1>");
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
        
        String dataS = request.getParameter("data");
        String ora = request.getParameter("ora");
        String pret = request.getParameter("pret");
        String totalLocuri = request.getParameter("totalLocuri");
        String idFilm = request.getParameter("idFilm");
        
        
        ProgramBean pb = new ProgramBean();
        
        System.out.println("data S "+dataS);
        
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date data = null;
        try {
            data = format.parse(dataS);
        } catch (ParseException ex) {
            System.out.println("string to date is NOT ok!!!!!!!!! "+ex.getMessage());
            Logger.getLogger(InsertProgram.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("date = "+data);
        pb.setData(data);
        pb.setDateS(dataS);
        pb.setOra(ora);
        pb.setPret(Float.parseFloat(pret));
        pb.setTotalLocuri(Integer.parseInt(totalLocuri));
        pb.setIdFilm(Integer.parseInt(idFilm));

        UserBean user = new UserBean();
        HttpSession session = request.getSession();
        user = (UserBean) session.getAttribute("currentSessionUser");
        
        int idCinema = CinemaDAO.getByIdUser(Integer.toString(user.getIdUser()));
        pb.setIdCinema(idCinema);   
        
        try {
            ProgramDAO.insert(pb);
        } catch (ParseException ex) {
            Logger.getLogger(InsertProgram.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("Program");
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
