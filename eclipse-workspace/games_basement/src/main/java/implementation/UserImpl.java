package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CapBean;
import bean.UserBean;

public class UserImpl {
	private Connection c;
	private ArrayList<UserBean> al;

	public UserImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<UserBean>();
		c=Connessione.setConnection();
		this.fillList();
	} 

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Utente");
			
			while(rs.next()) {	
				al.add(new UserBean(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4)));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void stopConnection() {
		try {
			Connessione.releaseConnection(c);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
