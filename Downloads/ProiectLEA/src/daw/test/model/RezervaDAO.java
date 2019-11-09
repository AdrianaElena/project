/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daw.test.model;

import daw.test.model.bean.UserBean;
import daw.test.model.bean.RezervaBean;
import daw.test.model.bean.ProgramBean;
import daw.test.model.bean.CinemaBean;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import static daw.test.model.FilmDAO.currentCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpSession;

/**
 *
 * @author adria
 */
public class RezervaDAO {
    static Connection currentCon = null;
    static ResultSet rs = null;
    
    public static ArrayList<RezervaBean> getAll() {
        Statement stmt = null;
        RezervaBean rb;
        ArrayList<RezervaBean> list = new ArrayList<RezervaBean>();

        String searchQuery = "select* from rezervari";

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {
                rb = new RezervaBean();
                
                int idRezervare = rs.getInt("idRezervare");
                int idUser = rs.getInt("idUser");
                int idProgram = rs.getInt("idProgram");
                int nrBilete  =rs.getInt("nrBilete");
                
                rb.setIdRezervare(idRezervare);
                rb.setIdUser(idUser);
                rb.setIdProgram(idProgram);
                rb.setNrBilete(nrBilete);

                list.add(rb);
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }
            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }
                currentCon = null;
            }
        }
        return list;
    }
    
    public static ArrayList<RezervaBean> getByIdUser(String id){
        ArrayList<RezervaBean> list = new ArrayList<RezervaBean>();
        RezervaBean rb;
        
        try{
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("select *from rezervari where idUser =?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                rb = new RezervaBean();
                
                int idRezervare = rs.getInt("idRezervare");
                int idUser = rs.getInt("idUser");
                int idProgram = rs.getInt("idProgram");
                int nrBilete  =rs.getInt("nrBilete");
                
                rb.setIdRezervare(idRezervare);
                rb.setIdUser(idUser);
                rb.setIdProgram(idProgram);
                rb.setNrBilete(nrBilete);

                list.add(rb);
            }
        } catch (Exception ex) {
            System.out.println("nu s-a adaugat " + ex.getMessage());
        }
        
         return list;   
    } 
    
    public static int insert(RezervaBean rb){
        int ret =0;
        Statement stmt = null;
        System.out.println("INSERT RESERVATION");
        
        String searchQuery = "insert into rezervari (idUser, idProgram, nrBilete) values ('"+ rb.getIdUser()+"','"+rb.getIdProgram()+"','"+rb.getNrBilete()+"');";
        
        System.out.println("INS REZE "+searchQuery);
              
        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            ret = stmt.executeUpdate(searchQuery);
        } catch (Exception ex) {
            System.out.println("nu s-a adaugat " + ex.getMessage());
        } finally {

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }
            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }
                currentCon = null;
            }
        }
        return ret;
    }
    
    public static ArrayList<Rezervare> getRezervari(String idUser, String nume, String prenume){
        ArrayList<Rezervare> rezList = new ArrayList<Rezervare>();
        
        
        ArrayList<RezervaBean> list = RezervaDAO.getByIdUser(idUser);
        
        for(int i=0; i<list.size(); i++){
            Rezervare rez = new Rezervare();
            
            rez.setNumeUser(nume);
            rez.setPrenumeUser(prenume);
            rez.setNrBilete(list.get(i).getNrBilete());
            
            ProgramBean program = ProgramDAO.getByIdP( Integer.toString(list.get(i).getIdProgram()) );
            
            rez.setData(program.getData());
            rez.setOra(program.getOra());
            rez.setPret(program.getPret());
            
            CinemaBean cinema = CinemaDAO.getByIdCinema( Integer.toString(program.getIdCinema()) );
            rez.setCinema(cinema.getNume());
            rez.setOras(cinema.getOras());
            
            String film = FilmDAO.getnumeFilm( Integer.toString(program.getIdFilm()) );
            rez.setFilm(film);
            
            rezList.add(rez);
        }
        
        return rezList;
    }
    
     public static ArrayList<Rezervare> getRezervariByCinema(String idCinema){
         ArrayList<Rezervare> rezList = new ArrayList<Rezervare>();
         
          
         try{
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("SELECT rezervari.idUser, rezervari.nrBilete, program.idFilm, program.data, program.ora, program.pret from `rezervari`, `program` \n" +
"WHERE rezervari.idProgram = program.idProgram AND program.idCinema = " + idCinema+";");
            //ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Rezervare rez = new Rezervare();
                int idUser = rs.getInt("idUser");
                int nrBilete = rs.getInt("nrBilete");
                int idFilm = rs.getInt("idFilm");
                Date data = rs.getDate("data");
                String ora = rs.getString("ora");
                float pret = rs.getFloat("pret");
                
                System.out.println("idUser "+ idUser+" nrBilete "+nrBilete+" idFilm "+idFilm);
                rez.setNrBilete(nrBilete);
                rez.setData(data);
                rez.setOra(ora);
                rez.setPret(pret);
                
                String numeF = FilmDAO.getnumeFilm(Integer.toString(idFilm));
                rez.setFilm(numeF);
                
                UserBean user = UserDAO.getInfo(Integer.toString(idUser));
                rez.setNumeUser(user.getFirstName());
                rez.setPrenumeUser(user.getLastName());
                System.out.println("nume film "+rez.getFilm()+ " numeU "+rez.getNumeUser());
                
                rezList.add(rez);
            }
         }catch(Exception ex){
                    System.out.println("nu s-au obtinut rezervarile: "+ex.getMessage());
          }
         
         return rezList;
     }
    
     public static int nrBileteRez(String id){
       
        int nrbilRez = 0;
        
        try{
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("select *from rezervari where idProgram =?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
               
                int nrBilete  =rs.getInt("nrBilete");
                
                nrbilRez += nrBilete;
                
            }
        } catch (Exception ex) {
            System.out.println("nu s-a gasit bilete rezervate " + ex.getMessage());
        }
        
         return nrbilRez;   
    } 
}
