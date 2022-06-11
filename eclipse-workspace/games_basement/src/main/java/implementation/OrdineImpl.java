package implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.OrdineBean;
import dao.OrdineDAO;

public class OrdineImpl implements OrdineDAO{
	private Connection c;
	private ArrayList<OrdineBean> al;
	private final String INSERT_QUERY="insert into Ordine values(?,?,?)";
	
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
				String numOrdine=rs.getString(1),idU=rs.getString(2);
				double importo=rs.getDouble(3);
				
				al.add(new OrdineBean(numOrdine,idU,importo));
				
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
		try (PreparedStatement ps=c.prepareStatement(INSERT_QUERY)){
			ps.setString(1, ob.getNumOrdine());
			ps.setString(2, ob.getIdUtente());
			ps.setFloat(3, (float)ob.getTotale());
		}catch(SQLException e) {
			
		}
	}

	@Override
	public void removeOrdine(OrdineBean ob) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("delete from Ordine where Ordine where Ordine.numero_ordine='"+ob.getNumOrdine()+"'");
		}catch(SQLException e) {
			
		}finally {
			 al.remove(ob);
		}
	}

	@Override
	public void updateOrdine(OrdineBean oldob, OrdineBean newob) {
		// TODO Auto-generated method stub
		removeOrdine(oldob);
		addOrdine(newob);
	}

	@Override
	public ArrayList<OrdineBean> getAllOrdine() {
		// TODO Auto-generated method stub
		return al;
	}
}
