package implementation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.StandardBean;
import dao.StandardDAO;

public class StandardImpl implements StandardDAO{
	private Connection c;
	private ArrayList<StandardBean> al;
	
	public StandardImpl() {
		al=new ArrayList<StandardBean>();
		c=Connessione.setConnection();	
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Cap");
			
			while(rs.next()) {
				int idSpedizione=rs.getInt(1);
				String numOrdine=rs.getString(2);
				Date dataSpedizione=rs.getDate(3);
				double costo=rs.getDouble(4);
				
				al.add(new StandardBean(idSpedizione,numOrdine,dataSpedizione,costo));
				
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
	public void addStandard(StandardBean sb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("insert into Standard values('"+sb.getIdSpedizione()+"','"+sb.getNumOrdine()+"','"+sb.getDataOrdine()+"','"+sb.getTotale()+"')");
		}catch(SQLException e) {
			
		}finally {
			al.add(sb);
		}
	}

	@Override
	public void removeStandard(StandardBean sb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("delete from Standard where Standard.id_spedizione='"+sb.getIdSpedizione()+"'");
		}catch(SQLException e) {
			
		}finally {
			al.remove(sb);
		}
	}

	@Override
	public void updateStandard(StandardBean oldsb, StandardBean newsb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement(),s1=c.createStatement();
			s.executeUpdate("delete from Standard where Standard.id_spedizione='"+oldsb.getIdSpedizione()+"'");
			s1.executeUpdate("insert into Standard values('"+newsb.getIdSpedizione()+"','"+newsb.getNumOrdine()+"','"+newsb.getDataOrdine()+"','"+newsb.getTotale()+"')");
		}catch(SQLException e) {
			
		}finally {
			al.set(al.indexOf(oldsb), newsb);
		}
	}

	@Override
	public ArrayList<StandardBean> getAllStandard() {
		// TODO Auto-generated method stub
		return al;
	}
}
