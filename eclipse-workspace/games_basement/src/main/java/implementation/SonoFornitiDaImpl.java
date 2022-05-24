package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.SonoFornitiDaBean;
import dao.SonoFornitiDaDAO;

public class SonoFornitiDaImpl implements SonoFornitiDaDAO{
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

	@Override
	public void addSonoFornitiDa(SonoFornitiDaBean sfdb) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeSonoFornitiDa(SonoFornitiDaBean sfdb) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateSonoFornitiDa(SonoFornitiDaBean oldsfdb, SonoFornitiDaBean newsfdb) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<SonoFornitiDaBean> getAllSonoFornitiDa() {
		// TODO Auto-generated method stub
		return al;
	}
}
