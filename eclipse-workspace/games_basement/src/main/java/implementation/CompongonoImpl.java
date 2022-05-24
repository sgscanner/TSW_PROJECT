package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CompongonoBean;
import dao.CompongonoDAO;

public class CompongonoImpl implements CompongonoDAO{
	private Connection c;
	private ArrayList<CompongonoBean> al;
	
	public CompongonoImpl() {
		// TODO Auto-generated constructor stub
		c=Connessione.setConnection();
		al=new ArrayList<CompongonoBean>();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Compongono");
			
			while(rs.next()) {
				al.add(new CompongonoBean(rs.getString(1),rs.getString(2),rs.getInt(3)));
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
	public void addCompongono(CompongonoBean cb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("insert into Compongono values('"+cb.getCodiceArticoli()+"','"+cb.getNumOrdine()+"','"+cb.getQuantità()+"')");
		}catch(SQLException e) {
			
		}finally {
			al.add(cb);
		}
	}

	@Override
	public void removeCompongono(CompongonoBean cb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("delete from Compongono where Compongono.codice_articoli='"+cb.getCodiceArticoli()+"'");
		}catch(SQLException e) {
			
		}finally {
			al.add(cb);
		}
	}

	@Override
	public void updateCompongono(CompongonoBean oldCb, CompongonoBean newCb) {
		// TODO Auto-generated method stub
		try {
			Statement d=c.createStatement(),i=c.createStatement();
			d.executeUpdate("delete from Compongono where Compongono.codice_articoli='"+oldCb.getCodiceArticoli()+"'");
			i.executeUpdate("insert into Compongono values('"+newCb.getCodiceArticoli()+"','"+newCb.getNumOrdine()+"','"+newCb.getQuantità()+"')");
		}catch(SQLException e){
			
		}finally {
			al.set(al.indexOf(oldCb), newCb);
		}
	}

	@Override
	public ArrayList<CompongonoBean> getAllCompongono() {
		// TODO Auto-generated method stub
		return al;
	}
}
