package implementation;

import java.sql.Connection;
import java.sql.Date;
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
	private final String INSERT_QUERY="insert into Ordine values(?,?,?,?)";
	private static final String SEARCH_BY_DATE = "select o.numero_ordine,o.id_utente,o.importo_totale,o.data_ordine from Ordine as o where o.data_ordine between ? and ?";
	
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
				String numOrdine=rs.getString("numero_ordine"),idU=rs.getString("id_utente");
				double importo=rs.getDouble("importo_totale");
				Date date=rs.getDate("data_ordine");
				
				al.add(new OrdineBean(numOrdine,idU,importo,date));
				
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

	public ArrayList<OrdineBean> getAllUserOrdine(String uname){
		ArrayList<OrdineBean> temp=new ArrayList<OrdineBean>();
		
		try(Statement s=c.createStatement()) {
			ResultSet rs=s.executeQuery("select * from Ordine where Ordine.id_utente='"+uname+"'");
			
			while(rs.next()) {
				String numOrdine=rs.getString("numero_ordine"),idU=rs.getString("id_utente");
				double importo=rs.getDouble("importo_totale");
				Date date=rs.getDate("data_ordine");
				
				temp.add(new OrdineBean(numOrdine,idU,importo,date));
			}
			
		}catch(SQLException e) {
			
		}
		
		return temp;
	}
	
	public ArrayList<OrdineBean> searchByDate(Date from, Date to) {
		ArrayList<OrdineBean> ob=new ArrayList<OrdineBean>();
		try(PreparedStatement ps=c.prepareStatement(SEARCH_BY_DATE)){
			ps.setDate(1, from);
			ps.setDate(2, to);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				String numOrdine=rs.getString("numero_ordine"),idU=rs.getString("id_utente");
				double importo=rs.getDouble("importo_totale");
				Date date=rs.getDate("data_ordine");
				
				ob.add(new OrdineBean(numOrdine,idU,importo,date));
			}
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		return ob;
	}
	
	@Override
	public void addOrdine(OrdineBean ob) {
		// TODO Auto-generated method stub
		try (PreparedStatement ps=c.prepareStatement(INSERT_QUERY)){
			ps.setString(1, ob.getNumOrdine());
			ps.setString(2, ob.getIdUtente());
			ps.setFloat(3, (float)ob.getTotale());
			ps.setDate(4, ob.getData_ordine());
			ps.executeUpdate();
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
