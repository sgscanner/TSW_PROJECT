package implementation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CapBean;
import bean.DatiAnagraficiBean;

public class DatiAnagrificiImpl {
	private Connection c;
	private ArrayList<DatiAnagraficiBean> al;
	
	public DatiAnagrificiImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<DatiAnagraficiBean>();
		c=Connessione.setConnection();
		this.fillList();
	}
	
	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Dati_anagrafici");
			
			while(rs.next()) {
				String idU=rs.getString(1),idC=rs.getString(2),nome=rs.getString(3),cognome=rs.getString(4),
						telefono=rs.getString(5);
				Date bDay=rs.getDate(6);
				
				al.add(new DatiAnagraficiBean(idU,idC,nome,cognome,telefono,bDay));
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
