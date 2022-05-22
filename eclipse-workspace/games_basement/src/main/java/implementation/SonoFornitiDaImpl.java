package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CapBean;
import bean.SonoFornitiDaBean;

public class SonoFornitiDaImpl {
	private Connection c;
	private ArrayList<SonoFornitiDaBean> al;
	
	public SonoFornitiDaImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<SonoFornitiDaBean>();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Cap");
			
			while(rs.next()) {
				al.add(new SonoFornitiDaBean(rs.getString(1),rs.getString(1)));
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
