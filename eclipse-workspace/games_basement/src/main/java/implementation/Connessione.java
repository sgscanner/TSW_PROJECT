package implementation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class Connessione {	
	private static String driver="jdbc:mysql://localhost:3306/gameshop";
	private static String uname="gameshop", pass="password";
	private static List<Connection> freeConnections;
	
	static {
		freeConnections=new LinkedList<Connection>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			System.out.println("driver not found");
		}
	}
	
	public static Connection setConnection() {
			Connection con;
			try {
				con = (Connection) DriverManager.getConnection(driver,uname,pass);
				System.out.println("Connessione ok");
				return con;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Connessione non riuscita");
			}
			return null;
	}
	
	public static synchronized Connection getConnection() {
		Connection c;
		
		if(!freeConnections.isEmpty()) {
			c=(Connection) freeConnections.get(0);
			Connessione.freeConnections.remove(0);
			try {
				if(c.isClosed())
					c=Connessione.getConnection();
			}catch(SQLException e) {
				c=Connessione.getConnection();
			}
		}else {
			c=Connessione.setConnection();
		}
		
		return c;
	}
	
	public static void releaseConnection(Connection c) throws SQLException{
		Connessione.freeConnections.add(c);
	}
}
