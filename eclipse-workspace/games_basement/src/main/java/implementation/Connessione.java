package implementation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connessione {	
	private static String driver="jdbc:mysql://localhost:3306/gameshop";
	private static String uname="gameshop",pass="password";
	
	public static Connection setConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=(Connection) DriverManager.getConnection(driver,uname,pass);
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
