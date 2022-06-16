package implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.ArticoliBean;
import bean.CompongonoBean;
import bean.OrdineBean;
import dao.CompongonoDAO;

public class CompongonoImpl implements CompongonoDAO{
	private Connection c;
	private ArrayList<CompongonoBean> compongonoList;
	private final String REMOVE_PRODOTTO = "update Articolo set Articolo.quantità=quantità-? where Articolo.codice_articoli=?";
	private final String INSERT_COMPONGONO = "insert into Compongono values(?,?,?,?)";
	private final String REMOVE_ORDINE = "delete from Compongono where Compongono.numero_ordine=? ";
	
	public CompongonoImpl() {
		// TODO Auto-generated constructor stub
		c=Connessione.setConnection();
		compongonoList=new ArrayList<CompongonoBean>();
		this.fillListCompongono();
	}

	private void fillListCompongono() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Compongono");
			
			while(rs.next()) {
				compongonoList.add(new CompongonoBean(rs.getString("codice_articoli"),rs.getString("numero_ordine"),rs.getInt("quantità"),rs.getFloat("prezzo_storico")));
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

	public CompongonoBean searchCart() {
		CompongonoBean cb=new CompongonoBean();
		try(Statement s=c.createStatement()){
			s.execute("select * from Compongono where Compongono.numero_ordine='not completed'");
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return cb;
	}
	
	public void completeOrder(OrdineBean ob,ArrayList<ArticoliBean> articoli,String num_ordine){
		for(ArticoliBean ab:articoli) {
			try(PreparedStatement ps=c.prepareStatement(REMOVE_PRODOTTO)){
				Statement s=c.createStatement();
				ResultSet rs=s.executeQuery("select Compongono.quantità "
										  + "from Compongono "
										  + "where Compongono.codice_articoli='"+ab.getCodiceA()+"' and Compongono.numero_ordine='"+ob.getNumOrdine()+"'");
				while(rs.next()) {
					ps.setInt(1, rs.getInt(1));
					ps.setString(2, ab.getCodiceA());
					ps.execute();
				}
				
			}catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		OrdineImpl oi=new OrdineImpl();
		oi.addOrdine(ob);
	}
	
	public int addToCart(ArticoliBean ab,int quantità) {
		int result=0;
		try(PreparedStatement ps=c.prepareStatement(INSERT_COMPONGONO)){
			ps.setString(1, ab.getCodiceA());
			ps.setInt(2, quantità);
			ps.setFloat(3, (float)ab.getPrezzo());
			ps.setString(4, "not completed");
			result=ps.executeUpdate();
			return result;
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	@Override
	public void addCompongono(CompongonoBean cb) {
		// TODO Auto-generated method stub
		try(PreparedStatement ps=c.prepareStatement(INSERT_COMPONGONO)){
			ps.setString(1, cb.getCodiceArticoli());
			ps.setInt(2, cb.getQuantità());
			ps.setFloat(3,(float) cb.getPrezzo_storico());
			ps.setString(4, cb.getNumOrdine());
			ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		compongonoList.add(cb);
	}

	@Override
	public void removeOrder(OrdineBean ob) {
		// TODO Auto-generated method stub
		try(PreparedStatement ps=c.prepareStatement(REMOVE_ORDINE)){
			ps.setString(1, ob.getNumOrdine());
			ps.executeUpdate();
		}catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
	}

	@Override
	public ArrayList<ArticoliBean> getCarrello(OrdineBean ob) {
		// TODO Auto-generated method stub
		ArrayList<ArticoliBean> carrello=new ArrayList<ArticoliBean>();
		try(Statement s=c.createStatement()){
			ResultSet rs=s.executeQuery("select a.codice_articoli,a.codice_catalogo,a.descrizione,a.prezzo,a.tipologia_articoli,a.offerta,a.immagine,a.nome,a.quantità"
						  +"from Articolo as a,Compongono as c,Ordine as o"
						  +"where a.codice_articoli=c.codice_articoli and c.numero_ordine='"+ob.getNumOrdine()+"'");
			
			while(rs.next()) {
				String codiceA=rs.getString("codice_articoli"),descrizione=rs.getString("descrizione"),
						tipologia=rs.getString("tipologia_articoli"),immagine=rs.getString("immagine"),nome=rs.getString("nome");
				long codiceC=rs.getLong("codice_catalogo");
				double prezzo=rs.getDouble("prezzo");
				boolean offerta=rs.getBoolean("offerta");
				int quantità=rs.getInt("quantità");
				
				carrello.add(new ArticoliBean(codiceA,codiceC,descrizione,prezzo,nome,tipologia,offerta,immagine,quantità));
			}
			
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return carrello;
	}

	@Override
	public ArrayList<CompongonoBean> getAllCompongono() {
		// TODO Auto-generated method stub
		return compongonoList;
	}
}
