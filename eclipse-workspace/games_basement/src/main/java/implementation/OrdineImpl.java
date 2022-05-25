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
				String numOrdine=rs.getString(1),idU=rs.getString(2);
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
			s.executeUpdate("insert into Ordine values('"+ob.getNumOrdine()+"','"+ob.getIdUtente()+"','"+ob.getTotale()+"','"+ob.getNumProdotti()+"')");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			al.add(ob);
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
		try {
			Statement d=c.createStatement(),i=c.createStatement();
			d.executeUpdate("delete from Ordine where Ordine where Ordine.numero_ordine='"+oldob.getNumOrdine()+"'");
			i.execute("insert into Ordine values('"+newob.getNumOrdine()+"','"+newob.getIdUtente()+"','"+newob.getTotale()+"','"+newob.getNumProdotti()+"')");
		}catch(SQLException e) {
			
		}finally {
			al.set(al.indexOf(oldob),newob);
		}
	}

	@Override
	public ArrayList<OrdineBean> getAllOrdine() {
		// TODO Auto-generated method stub
		return al;
	}
}
