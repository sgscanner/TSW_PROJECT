package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CatalogoBean;
import dao.CatalogoDAO;

public class CatalogoImpl implements CatalogoDAO{
	private Connection c;
	private ArrayList<CatalogoBean> al;
	
	public CatalogoImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<CatalogoBean>();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Catalogo");
			
			while(rs.next()) {
				al.add(new CatalogoBean(rs.getInt("codice_catalogo")));
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
	public void addCatalogo(CatalogoBean cb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("insert into Catalogo values('"+cb.getCodiceCatalogo()+"')");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			al.add(cb);
		}
	}

	@Override
	public void removeCatalogo(CatalogoBean cb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("delete from Catalogo where Catalogo.codice_catalogo='"+cb.getCodiceCatalogo()+"'");
		}catch(SQLException e) {
			
		}finally {
			al.add(cb);
		}
	}

	@Override
	public void updateCatalogo(CatalogoBean oldCatalogo, CatalogoBean newCatalogo) {
		// TODO Auto-generated method stub
		try {
			Statement d=c.createStatement(),i=c.createStatement();
			d.executeUpdate("delete from Catalogo where Catalogo.codice_catalogo='"+oldCatalogo.getCodiceCatalogo()+"'");
			i.executeUpdate("insert into Catalogo values('"+newCatalogo.getCodiceCatalogo()+"')");
		}catch(SQLException e) {
			
		}finally {
			al.set(al.indexOf(oldCatalogo), newCatalogo);
		}
	}

	@Override
	public ArrayList<CatalogoBean> getAllCatalogo() {
		// TODO Auto-generated method stub
		return al;
	}

}
