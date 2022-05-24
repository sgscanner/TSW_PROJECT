package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.OrdineBean;
import dao.OrdineDAO;

public class OrdineImpl implements OrdineDAO{
	private Connection c;
	private ArrayList<OrdineBean> al;
	
	public OrdineImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<OrdineBean>();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Ordine");
			
			while(rs.next()) {
				String numOrdine=rs.getString(1),idU=rs.getString(1);
				double importo=rs.getDouble(3);
				int numArt=rs.getInt(4);
				
				al.add(new OrdineBean(numOrdine,idU,importo,numArt));
				
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

	@Override
	public void addOrdine(OrdineBean ob) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
		}catch(SQLException e) {
			
		}finally {
			al.add(ob);
		}
	}

	@Override
	public void removeOrdine(OrdineBean ob) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateOrdine(OrdineBean oldob, OrdineBean newob) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<OrdineBean> getAllOrdine() {
		// TODO Auto-generated method stub
		return al;
	}
}
