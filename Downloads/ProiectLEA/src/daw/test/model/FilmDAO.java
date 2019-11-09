/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daw.test.model;

import daw.test.model.bean.FilmBean;
import static daw.test.model.UserDAO.currentCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author adria
 */
public class FilmDAO {

    static Connection currentCon = null;
    static ResultSet rs = null;
    static int idFIlm;

    public static int getIdFIlm() {
        return idFIlm;
    }

    public static void setIdFIlm(int idFIlm) {
        FilmDAO.idFIlm = idFIlm;
    }

    public static ArrayList<FilmBean> getAll() {
        Statement stmt = null;
        FilmBean fb;
        ArrayList<FilmBean> list = new ArrayList<FilmBean>();

        String searchQuery = "select* from filme";

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {
                fb = new FilmBean();
                int id = rs.getInt("idFilm");
                String nume = rs.getString("nume");
                String an = rs.getString("an");
                String genul = rs.getString("genul");
                String durata = rs.getString("durata");
                String descriere = rs.getString("descriere");
                String actori = rs.getString("actori");
                String format = rs.getString("format");
                String traducere = rs.getString("traducere");
                String poza = rs.getString("poza");

                fb.setIdFilm(id);
                fb.setNume(nume);
                fb.setAn(an);
                fb.setGenul(genul);
                fb.setDurata(durata);
                fb.setDescriere(descriere);
                fb.setActori(actori);
                fb.setFormat(format);
                fb.setTraducere(traducere);
                fb.setPoza(poza);

                list.add(fb);
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
    
    public static FilmBean getById(String id){
        FilmBean fb = new FilmBean();
        int idFilm = Integer.parseInt(id);
        FilmDAO.setIdFIlm(idFilm);
        
        
        try{
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("select *from filme where idFilm =?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                int idF = rs.getInt("idFilm");
                String nume = rs.getString("nume");
                String genul = rs.getString("genul");
                String an = rs.getString("an");
                String durata = rs.getString("durata");
                String descriere = rs.getString("descriere");
                String actori = rs.getString("actori");
                String format = rs.getString("format");
                String traducere = rs.getString("traducere");
                String poza = rs.getString("poza");
                String video = rs.getString("video");

                fb.setIdFilm(idF);
                fb.setNume(nume);
                fb.setGenul(genul);
                fb.setAn(an);
                fb.setDurata(durata);
                fb.setDescriere(descriere);
                fb.setActori(actori);
                fb.setFormat(format);
                fb.setTraducere(traducere);
                fb.setPoza(poza);
                fb.setVideo(video);
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        return fb;
    }
    
    public static ArrayList<FilmBean> getByIdUser(String id){
        ArrayList<FilmBean> list = new ArrayList<FilmBean>();
        FilmBean fb;
        try{
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("select *from filme where idUser =?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                fb = new FilmBean();
                int idF = rs.getInt("idFilm");
                int idUser = rs.getInt("idUser");
                String nume = rs.getString("nume");
                String an = rs.getString("an");
                String genul = rs.getString("genul");
                String durata = rs.getString("durata");
                String descriere = rs.getString("descriere");
                String actori = rs.getString("actori");
                String format = rs.getString("format");
                String traducere = rs.getString("traducere");
                String poza = rs.getString("poza");
                String video = rs.getString("video");

                fb.setIdFilm(idF);
                fb.setIdUser(idUser);
                fb.setNume(nume);
                fb.setAn(an);
                fb.setGenul(genul);
                fb.setDurata(durata);
                fb.setDescriere(descriere);
                fb.setActori(actori);
                fb.setFormat(format);
                fb.setTraducere(traducere);
                fb.setPoza(poza);
                fb.setVideo(video);
                
                list.add(fb);
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    
    public static void insertFilm(FilmBean f){
        Statement stmt = null;
        
        
        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate("insert into filme (idUser, nume, an, genul, durata, descriere, actori, format, traducere, poza, video) "+ 
                    " values("+f.getIdUser()+", '"+f.getNume()+"', '"+f.getAn()+"', '"+f.getGenul()+"', '"+f.getDurata()+"', '"+
                    f.getDescriere()+"', '"+f.getActori()+"', '"+f.getFormat()+"', '"+f.getTraducere()+"', '"+f.getPoza()+"', '"+f.getVideo()+"');");
        } catch (Exception ex) {
            System.out.println("film not inserted "+ex.getMessage());
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
    }
    
    public static String getnumeFilm(String id) {
        String numeFilm = null;
        try {
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("SELECT * FROM filme WHERE idFilm=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                
                numeFilm = rs.getString("nume");
               
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return numeFilm;
    }
}
