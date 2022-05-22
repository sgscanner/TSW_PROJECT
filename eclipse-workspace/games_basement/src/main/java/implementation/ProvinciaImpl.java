package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CapBean;
import bean.ProvinciaBean;

public class ProvinciaImpl {
	private Connection c;
	private ArrayList<ProvinciaBean> al;
	
	public ProvinciaImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<ProvinciaBean>();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Provincia");
			
			while(rs.next()) {
				al.add(new ProvinciaBean(rs.getString(1),rs.getString(2)));
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
