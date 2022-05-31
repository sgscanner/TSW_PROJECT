package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CittàBean;
import dao.CittàDAO;

public class CittàImpl implements CittàDAO{
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

	@Override
	public void addCittà(CittàBean cb) {
		// TODO Auto-generated method stub
		try(Statement s=c.createStatement();) {
			s.executeUpdate("insert into Città values('"+cb.getIdCittà()+"','"+cb.getNomeCittà()+"')");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			al.add(cb);
		}
	}

	@Override
	public void removeCittà(CittàBean cb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("delete from Città where Città.id_città='"+cb.getIdCittà()+"'");
			s.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			al.remove(cb);
		}
	}

	@Override
	public void updateCittà(CittàBean oldCittà, CittàBean newCittà) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement(),s1=c.createStatement();
			s.executeUpdate("delete from Città where Città.id_città='"+oldCittà.getIdCittà()+"'");
			s1.executeUpdate("insert into Città values('"+newCittà.getIdCittà()+"','"+newCittà.getNomeCittà()+"')");
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<CittàBean> getAllCittà() {
		// TODO Auto-generated method stub
		return al;
	}
}
