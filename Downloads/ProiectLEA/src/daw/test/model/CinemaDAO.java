/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daw.test.model;


import daw.test.model.bean.CinemaBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author adria
 */
public class CinemaDAO {
    static Connection currentCon = null;
    static ResultSet rs = null;
    
    
    public static ArrayList<CinemaBean> getAll() {
        Statement stmt = null;
        CinemaBean bean;
        ArrayList<CinemaBean> list = new ArrayList<CinemaBean>();

        String searchQuery = "select* from cinema";

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {
                bean = new CinemaBean();
                int idCinema = rs.getInt("idCinema");
                String nume = rs.getString("nume");
                String oras = rs.getString("oras");
                String adresa = rs.getString("adresa");
                
                bean.setIdCinema(idCinema);
                bean.setNume(nume);
                bean.setOras(oras);
                bean.setAdresa(adresa);

                list.add(bean);
            }
        } catch (Exception ex) {
            System.out.println("An Exception has occurred! " + ex);
        } // some exception handling
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
    
    public static CinemaBean getById(String id) {
        CinemaBean bean = new CinemaBean();


        try {
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("SELECT * FROM products WHERE idProdus=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bean.setIdCinema(rs.getInt("idCinema"));

                String nume = rs.getString("nume");
                String oras = rs.getString("oras");
                String adresa = rs.getString("adresa");
               
                bean.setNume(nume);
                bean.setOras(oras);
                bean.setAdresa(adresa);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return bean;
    }
    
    public static int getByIdUser(String id) {
        int idCinema = 0;

        try {
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("SELECT * FROM cinema WHERE idUser=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                
                idCinema = rs.getInt("idCinema");
               
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return idCinema;
    }
    
    public static CinemaBean getByIdCinema(String id) {
        CinemaBean cinema = new CinemaBean();
        try {
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("SELECT * FROM cinema WHERE idCinema=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                
                
                cinema.setNume(rs.getString("nume"));
                cinema.setOras(rs.getString("oras"));
               
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return cinema;
    }
}
