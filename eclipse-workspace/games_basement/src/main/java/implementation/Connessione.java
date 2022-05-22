package implementation;

import java.sql.*;

public class Connessione {	
	private static String driver="jdbc:mysql://localhost:3306/gameshop";
	private static String uname="root",pass="mammaepapa3";
	
	public static Connection setConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=(Connection) DriverManager.getConnection(driver,uname,pass);
			System.out.println("Connessione t'appost");
			return con;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return null;
	}
	
	public static void releaseConnection(Connection c) throws SQLException{
		if(c!=null) {
			c.close();
			c=null;
		}
	}
}
