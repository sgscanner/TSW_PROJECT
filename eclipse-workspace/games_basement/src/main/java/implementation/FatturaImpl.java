package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CapBean;
import bean.FatturaBean;

public class FatturaImpl {
	private Connection c;
	private ArrayList<FatturaBean> al;
	
	public FatturaImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<FatturaBean>();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Fattura");
			
			while(rs.next()) {
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
