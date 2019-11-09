/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daw.test.model;

import daw.test.model.bean.ProgramBean;
import static daw.test.model.FilmDAO.currentCon;
import static daw.test.model.FilmDAO.rs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author adria
 */
public class ProgramDAO {
    static Connection currentCon = null;
    static ResultSet rs = null;
    static String selectedIDCinema;

    public static String getSelectedIDCinema() {
        return selectedIDCinema;
    }

    public static void setSelectedIDCinema(String selectedIDCinema) {
        ProgramDAO.selectedIDCinema = selectedIDCinema;
    }
    
    public static ArrayList<ProgramBean> getAll(){
        Statement stmt = null;
        ProgramBean pb;

        ArrayList<ProgramBean> list = new ArrayList<ProgramBean>();
        
         String searchQuery = "select* from program";
         
         try{
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery); 
            
            while(rs.next()){
                pb = new ProgramBean();
                int idProgram = rs.getInt("idProgram");
                int idFilm = rs.getInt("idFilm");
                int idCinema = rs.getInt("idCinema");
                Date data = rs.getDate("data");
                String ora = rs.getString("ora");
                
                pb.setIdProgram(idProgram);
                pb.setIdFilm(idFilm);
                pb.setIdCinema(idCinema);
                pb.setData(data);
                pb.setOra(ora);
                
                list.add(pb);
            }
            
         }catch(Exception e){
            System.out.println(e); 
         }
          finally {
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
    
    
    
    public static ArrayList<ProgramBean> getByIdCinema(String id){
        ProgramBean pb;
        ArrayList<ProgramBean> list = new ArrayList<ProgramBean>();
        
        
        try{
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("select *from program where idCinema =?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                pb = new ProgramBean();
                
                int idProgram  = rs.getInt("idProgram");
                int idFilm = rs.getInt("idFilm");
                int idCinema = rs.getInt("idCinema");
                Date data = rs.getDate("data");
                String ora = rs.getString("ora");
                int pret = rs.getInt("pret");
                int totalLocuri = rs.getInt("totalLocuri");
                
                pb.setIdProgram(idProgram);
                pb.setIdFilm(idFilm);
                pb.setIdCinema(idCinema);
                pb.setData(data);
                pb.setOra(ora);
                pb.setPret(pret);
                pb.setTotalLocuri(totalLocuri);
                
                list.add(pb);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    
    public static ArrayList<ProgramBean> getProgram(int idCinema, int idFilm){
        ArrayList<ProgramBean> list = new ArrayList<ProgramBean>();
        String id = Integer.toString(idCinema);
        list = getByIdCinema(id);
        ArrayList<ProgramBean> program = new ArrayList<ProgramBean>();
        
        for(int i=0; i<list.size(); i++){
            if(list.get(i).getIdFilm() == idFilm){
                program.add(list.get(i));
            }
        }
        
        for(int i=0; i<program.size(); i++){
            System.out.println("idCinema "+program.get(i).getIdCinema());
            System.out.println("idCinema "+program.get(i).getIdFilm());
            System.out.println("idCinema "+program.get(i).getOra());
            System.out.println("idCinema "+program.get(i).getData());
        }
        return program;
    }
    
    public static ArrayList<ProgramBean> getByIdProgram(String id){
        ProgramBean pb;
        ArrayList<ProgramBean> list = new ArrayList<ProgramBean>();

        
        try{
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("select *from program where idProgram =?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                pb = new ProgramBean();
                
                int idProgram  = rs.getInt("idProgram");
                int idFilm = rs.getInt("idFilm");
                int idCinema = rs.getInt("idCinema");
                Date data = rs.getDate("data");
                String ora = rs.getString("ora");
                float pret = rs.getFloat("pret");
                int totalLocuri = rs.getInt("totalLocuri");
                
                pb.setIdProgram(idProgram);
                pb.setIdFilm(idFilm);
                pb.setIdCinema(idCinema);
                pb.setData(data);
                pb.setOra(ora);
                pb.setPret(pret);
                pb.setTotalLocuri(totalLocuri);
                
                list.add(pb);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    
    public static ProgramBean getByIdP(String id){
        ProgramBean pb = new ProgramBean();

        
        try{
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("select *from program where idProgram =?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
               
                int idProgram  = rs.getInt("idProgram");
                int idFilm = rs.getInt("idFilm");
                int idCinema = rs.getInt("idCinema");
                Date data = rs.getDate("data");
                String ora = rs.getString("ora");
                float pret = rs.getFloat("pret");
                int totalLocuri = rs.getInt("totalLocuri");
                
                pb.setIdProgram(idProgram);
                pb.setIdFilm(idFilm);
                pb.setIdCinema(idCinema);
                pb.setData(data);
                pb.setOra(ora);
                pb.setPret(pret);
                pb.setTotalLocuri(totalLocuri);
            
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return pb;
    }
    
    public static void insert(ProgramBean pb) throws ParseException{
         
        String searchQuery = "insert into program (idFilm, idCinema, data, ora, pret, totalLocuri) " + "values ("+pb.getIdFilm()+", "+pb.getIdCinema()+", '"+pb.getDateS()+"', '"+pb.getOra()+"', "+pb.getPret()+", "+pb.getTotalLocuri()+");";
        Statement stmt = null;
        
        
        try{
            
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(searchQuery);
        } catch (Exception ex) {
            System.out.println("Nu s-a adugat un nou program " + ex);
        } // some exception handling
        finally {

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
    }
   
}
