package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.VeloceBean;
import dao.VeloceDAO;

public class VeloceImpl implements VeloceDAO{
	private Connection c;
	private ArrayList<VeloceBean> al;
		
	public VeloceImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<VeloceBean>();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Veloce");
			
			while(rs.next()) {
				al.add(new VeloceBean(rs.getInt(1),rs.getString(2),rs.getDate(3),rs.getDouble(4)));
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
	public void addVeloce(VeloceBean vb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("insert into Veloce values('"+vb.getIdSpedizione()+"','"+vb.getNumOrdine()+"','"+vb.getDataOrdine()+"','"+vb.getTotale()+"')");
		}catch(SQLException e) {
			
		}finally {
			al.add(vb);
		}
	}

	@Override
	public void removeVeloce(VeloceBean vb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("delete from Veloce where Veloce.id_spedizione='"+vb.getIdSpedizione()+"'");
		}catch(SQLException e) {
			
		}finally {
			al.remove(vb);
		}
	}

	@Override
	public void updateVeloce(VeloceBean oldvb, VeloceBean newvb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement(),s1=c.createStatement();
			s.executeUpdate("delete from Veloce where Veloce.id_spedizione='"+oldvb.getIdSpedizione()+"'");
			s1.executeUpdate("insert into Veloce values('"+newvb.getIdSpedizione()+"','"+newvb.getNumOrdine()+"','"+newvb.getDataOrdine()+"','"+newvb.getTotale()+"'");
		}catch(SQLException e) {
			
		}finally {
			al.set(al.indexOf(oldvb), newvb);
		}
	}

	@Override
	public ArrayList<VeloceBean> getAllVeloce() {
		// TODO Auto-generated method stub
	 	return al;
	}
}
