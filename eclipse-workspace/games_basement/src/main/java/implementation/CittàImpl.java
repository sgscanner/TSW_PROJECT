package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CittàBean;

public class CittàImpl {
	private Connection c;
	private ArrayList<CittàBean> al;
	
	public CittàImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<CittàBean> ();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Città");
			
			while(rs.next()) {
				String idCittà=rs.getString("id_città"),nomeCittà=rs.getString("nome_città");
				
				al.add(new CittàBean(idCittà, nomeCittà));
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
