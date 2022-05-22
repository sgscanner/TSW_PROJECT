package implementation;

import java.sql.*;
import java.util.ArrayList;

import javax.print.attribute.PrintJobAttribute;

import bean.CapBean;
import dao.CapDAO;

public class CapImpl implements CapDAO{
	private ArrayList<CapBean> al;
	private Connection c;
	
	public CapImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<CapBean>();
		c=Connessione.setConnection();
		this.fillList();
	}
	
	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Cap");
			
			while(rs.next()) {
				String idCittà=rs.getString("id_città"),idProvincia=rs.getString("id_provincia");
				int idCap=rs.getInt("id_cap");
				
				al.add(new CapBean(idCap, idCittà, idProvincia));
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
	public void addCap(CapBean cb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("insert into Cap values('"+cb.getIdCap()+"','"+cb.getIdCittà()+"','"+cb.getIdProvincia()+"')");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			al.add(cb);	
		}
	}

	@Override
	public void removeCap(CapBean cb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("delete from Cap where Cap.id_cap='"+cb.getIdCap()+"'");
		}catch(SQLException e){
			
		}finally {
			al.remove(cb);
		}
	}

	@Override
	public void updateCap(CapBean oldCap, CapBean newCap) {
		// TODO Auto-generated method stub
		try {
				Statement remove=c.createStatement(),insert=c.createStatement();
				remove.executeUpdate("delete from Cap where Cap.id_cap='"+newCap.getIdCap()+"'");
				insert.executeUpdate("insert into Cap values('"+newCap.getIdCap()+"','"+newCap.getIdCittà()+"','"+newCap.getIdProvincia()+"')");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			al.set(al.indexOf(oldCap), newCap);
		}
	}

	@Override
	public ArrayList<CapBean> getAllCap() {
		// TODO Auto-generated method stub
		return al;
	}

}
