package daw.test.model;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionManager {
	static Connection con;
	static String url;

	public static Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost/test";
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				con = DriverManager.getConnection(url, "root", "");
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
		return con;
	}

}
