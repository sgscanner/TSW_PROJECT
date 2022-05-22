package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CapBean;
import bean.FornitoreBean;

public class FornitoreImpl {
	private Connection c;
	private ArrayList<FornitoreBean> al;
	
	public FornitoreImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<FornitoreBean>();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Fornitore");
			
			while(rs.next()) {
				al.add(new FornitoreBean(rs.getString(1),rs.getString(2),rs.getString(3)));
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
