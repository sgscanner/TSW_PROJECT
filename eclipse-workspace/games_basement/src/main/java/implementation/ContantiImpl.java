package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CapBean;
import bean.ContantiBean;

public class ContantiImpl {
	private Connection c;
	private ArrayList<ContantiBean> al;
	
	public ContantiImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<ContantiBean>();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Contanti");
			
			while(rs.next()) {
				
				al.add(new ContantiBean(rs.getInt(1)));
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
