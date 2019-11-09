package daw.test.model;

import daw.test.model.bean.UserBean;
import java.sql.*;

public class UserDAO {

    static Connection currentCon = null;
    static ResultSet rs = null;

    public static UserBean login(UserBean bean) {
        // preparing some objects for connection
        Statement stmt = null;
        String username = bean.getUsername();
        String password = bean.getPassword();
        String searchQuery = "select * from users where username='" + username + "' AND password='" + password + "'";
        // "System.out.println" prints in the console; Normally used to trace

        // the process
        //System.out.println("Your user name is " + username);
        //System.out.println("Your password is " + password);
        //System.out.println("Query: " + searchQuery);

        try {
            // connect to DB
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();
            // if user does not exist set the isValid variable to false
            if (!more) {
                System.out.println("Sorry, you are not a registered user! Pleasesign up first");
                bean.setValid(false);
            } // if user exists set the isValid variable to true
            else if (more) {
                int idUser = rs.getInt("idUser");
                String firstName = rs.getString("FirstName");
                String lastName = rs.getString("LastName");
                String role = rs.getString("role");
                System.out.println("Welcome " + firstName);
                
                bean.setIdUser(idUser);
                bean.setFirstName(firstName);
                bean.setLastName(lastName);
                bean.setRole(role);
                bean.setValid(true);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
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
        return bean;
    }

    public static int insert(UserBean us) {
        int ret = 0;
        String searchQuery = "insert into users (username, password, firstname, lastname, email, nrtel, oras) values('" + us.getUsername() + "','" + us.getPassword() + "','" + us.getFirstName() + "','" + us.getLastName() + "','" + us.getEmail() + "','" + us.getNrtel() + "','" + us.getOras() + "');";

        Statement stmt = null;

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            ret = stmt.executeUpdate(searchQuery);
        } catch (Exception ex) {
            System.out.println("user not inserted "+ex.getMessage());
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
    
    public static int update(UserBean us) {
        int ret = 0;
        String searchQuery = "update users set username ='" + us.getUsername() + "', password ='" + us.getPassword() + "', firstName ='" + us.getFirstName() + "', lastName ='" + us.getLastName() + "', email ='" + us.getEmail() + "', nrtel ='" + us.getNrtel() + "', oras ='" + us.getOras() + "' where idUser = "+us.getIdUser()+";";     

        System.out.println(searchQuery);
        Statement stmt = null;

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            ret = stmt.executeUpdate(searchQuery);
        } catch (Exception ex) {
            System.out.println("user info not updated "+ex.getMessage());
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

    
    public static UserBean getInfo(String id){
        Statement stmt = null;
        UserBean ub = new UserBean();;
        
        
        try {
            currentCon = ConnectionManager.getConnection();
            PreparedStatement ps = currentCon.prepareStatement("select *from users where idUser =?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                
                
                int idUser = rs.getInt("idUser");
                String username = rs.getString("username");
                String pass = rs.getString("password");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                String nrtel = rs.getString("nrTel");
                String oras = rs.getString("oras");
                
                ub.setIdUser(idUser);
                ub.setUserName(username);
                ub.setPassword(pass);
                ub.setFirstName(firstName);
                ub.setLastName(lastName);
                ub.setEmail(email);
                ub.setNrtel(nrtel);
                ub.setOras(oras);
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
        return ub;
    }
}
