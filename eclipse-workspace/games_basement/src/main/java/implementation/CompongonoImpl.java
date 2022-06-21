package implementation;

import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Random;

import bean.ArticoliBean;
import bean.CompongonoBean;
import bean.OrdineBean;
import dao.CompongonoDAO;

public class CompongonoImpl implements CompongonoDAO {
	private Connection c;
	private ArrayList<CompongonoBean> compongonoList;
	private final String REMOVE_PRODOTTO = "update Articolo set Articolo.quantita=quantita-? where Articolo.codice_articoli=?";
	private final String INSERT_COMPONGONO = "insert into Compongono values(?,?,?,?)";
	private final String REMOVE_ORDINE = "delete from Compongono where Compongono.numero_ordine=? ";

	public CompongonoImpl() {
		// TODO Auto-generated constructor stub
		c = Connessione.setConnection();
		compongonoList = new ArrayList<CompongonoBean>();
		this.fillListCompongono();
	}

	private void fillListCompongono() {
		try {
			Statement s = c.createStatement();
			ResultSet rs = s.executeQuery("select * from Compongono");

			while (rs.next()) {
				compongonoList.add(new CompongonoBean(rs.getString("codice_articoli"), rs.getString("numero_ordine"),
						rs.getInt("quantita"), rs.getFloat("prezzo_storico")));
			}
		} catch (SQLException e) {
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

	public ArrayList<CompongonoBean> searchCart() {
		
		ArrayList<CompongonoBean> cb = new ArrayList<CompongonoBean>();
		try (Statement s = c.createStatement()) {
			ResultSet rs=s.executeQuery("select * from Compongono where Compongono.numero_ordine LIKE '%not completed'");
			
			while(rs.next()) {
				cb.add(new CompongonoBean(rs.getString("codice_articoli"), rs.getString("numero_ordine"),
						rs.getInt("quantita"), rs.getFloat("prezzo_storico")));
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return cb;
	}

	public void completeOrder(OrdineBean ob, ArrayList<ArticoliBean> articoli,String username,double prezzo) {
		String temp=getRandomString(15);
		try (Statement s=c.createStatement()){
			s.executeUpdate("update Ordine set numero_ordine='"+temp+"' where numero_ordine like '%not completed'");
			ob.setNumOrdine(temp);
		}catch(SQLException e) {
			System.out.println("errore update order in completeOrder");
		}

		for (ArticoliBean ab : articoli) {
			try (PreparedStatement ps = c.prepareStatement(REMOVE_PRODOTTO)) {
				Statement s = c.createStatement();
				ResultSet rs = s.executeQuery(
						"select Compongono.quantita " + "from Compongono " + "where Compongono.codice_articoli='"
								+ ab.getCodiceA() + "' and Compongono.numero_ordine='" + ob.getNumOrdine() + "'");
				while (rs.next()) {
					ps.setInt(1, rs.getInt(1));
					ps.setString(2, ab.getCodiceA());
					ps.execute();
				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}

		OrdineImpl oi = new OrdineImpl();
		oi.addOrdine(ob);
	}

	public ArticoliBean searchPrenotazione(String username, String codiceA) {
		ArticoliBean ab = new ArticoliBean();
		try (Statement ordine = c.createStatement()) {
			ResultSet rs = ordine.executeQuery("select a.nome,a.codice_articoli,a.codice_catalogo,"
											+ "a.descrizione,a.tipologia_articoli,a.offerta,a.quantita " 
											+ "from Articolo as a,Ordine,Compongono" 
											+ "where Ordine.id_utente='" + username+ "'"
											+ "and Ordine.id_utente LIKE '%prenotato' "
											+ "and Compongono.numero_ordine=Ordine.id_utente "
											+ "and Compongono.codice_articoli='"+ codiceA + "'");
			while (rs.next()) {
				ab.setCodiceA(rs.getString("codice_articoli"));
				ab.setCodiceC(rs.getLong("codice_catalogo"));
				ab.setDescrizione(rs.getString("descrizione"));
				ab.setTipologia(rs.getString("tipologia_articoli"));
				ab.setOfferta(rs.getBoolean("offerta"));
				ab.setNome(rs.getString("nome"));
				ab.setQuantita(rs.getInt("quantita"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ab;
	}

	public double getPrezzoStorico(OrdineBean ob,ArticoliBean ab){
		double temp=0.0;
		
		try (Statement s=c.createStatement()){
			ResultSet rs=s.executeQuery("select Compongono.prezzo_storico "
									  + "from Compongono "
									  + "where Compongono.numero_ordine='"+ob.getNumOrdine()+"' and Compongono.codice_articoli='"+ab.getCodiceA()+"'");
			while(rs.next()) {
				temp=(double)rs.getFloat(1);
			}
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
		
		return temp;
	}
	
	public ArrayList<ArticoliBean> getAllPrenotazioni(String username) {
		ArrayList<ArticoliBean> temp=new ArrayList<ArticoliBean>();
		
		try (Statement ordine = c.createStatement()) {
			ResultSet rs = ordine.executeQuery("select a.nome,a.codice_articoli,a.codice_catalogo,"
											  +"a.descrizione,a.tipologia_articoli,a.offerta,a.quantita"
											  +"from Articolo as a,Ordine,Compongono " 
											  +"where Ordine.id_utente='" + username+"'"
											  +"and Ordine.numero_ordine LIKE '%prenotato' "
											  +"and Compongono.numero_ordine=Ordine.numero_ordine");
			while (rs.next()) {
				ArticoliBean ab=new ArticoliBean();
				ab.setCodiceA(rs.getString("codice_articoli"));
				ab.setCodiceC(rs.getLong("codice_catalogo"));
				ab.setDescrizione(rs.getString("descrizione"));
				ab.setTipologia(rs.getString("tipologia_articoli"));
				ab.setOfferta(rs.getBoolean("offerta"));
				ab.setNome(rs.getString("nome"));
				ab.setQuantita(rs.getInt("quantita"));
				temp.add(ab);
			}
		} catch (SQLException e) {

		}
		
		return temp;
	}

	public void removeFromCart(String codiceA) {
		try(Statement s=c.createStatement()){
			s.executeUpdate("delete from Compongono where Compongono.codice_articoli='"+codiceA+"'");
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public int countPrenotazioni(String username) {
		int numPrenotazioni = 0;

		try (Statement s = c.createStatement()) {
			ResultSet rs = s.executeQuery("select Compongono.codice_articoli,Compongono.numero_ordine "
										+ "from Compongono "
										+ "where Compongono.numero_ordine LIKE '%prenotato' "
										+ "and Ordine.numero_ordine=Compongono.numero_ordine "
										+ "and Ordine.id_utente='"+username+"'");
			rs.last();
			numPrenotazioni = rs.getRow();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return numPrenotazioni;
	}

	public int addToCart(ArticoliBean ab, int quantita,String uname) {
		int result = 0;
		String generated=getRandomString(15)+"not completed";
		OrdineImpl oi=new OrdineImpl();
		
		if(oi.searchByUsername(uname).getNumOrdine()==null){
			try (Statement s=c.createStatement()){
				s.executeUpdate("insert into Ordine values('"+generated+"','"+uname+"','"+ab.getPrezzo()+"','"+LocalDate.now()+"')");
			}catch(SQLException e) {
				
			}
		}
		
		try (PreparedStatement ps = c.prepareStatement(INSERT_COMPONGONO)) {
			ps.setString(1, ab.getCodiceA());
			ps.setString(2, generated);
			ps.setInt(3, quantita);
			ps.setFloat(4, (float) ab.getPrezzo());
			result = ps.executeUpdate();
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	private String getRandomString(int i) {
		 byte[] bytearray;
	        String mystring;
	        StringBuffer thebuffer;
	        
	        bytearray = new byte[256]; 
	        new Random().nextBytes(bytearray); 

	        mystring 
	            = new String(bytearray, Charset.forName("UTF-8")); 

	        // Create the StringBuffer
	        thebuffer = new StringBuffer(); 

	        for (int m = 0; m < mystring.length(); m++) { 

	            char n = mystring.charAt(m); 

	            if (((n >= 'A' && n <= 'Z') 
	                || (n >= '0' && n <= '9')) 
	                && (i > 0)) { 

	                thebuffer.append(n); 
	                i--; 
	            } 
	        } 

	        // resulting string 
	        return thebuffer.toString(); 
	}

	
	@Override
	public void addCompongono(CompongonoBean cb) {
		// TODO Auto-generated method stub
		try (PreparedStatement ps = c.prepareStatement(INSERT_COMPONGONO)) {
			ps.setString(1, cb.getCodiceArticoli());
			ps.setInt(2, cb.getQuantita());
			ps.setFloat(3, (float) cb.getPrezzo_storico());
			ps.setString(4, cb.getNumOrdine());
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		compongonoList.add(cb);
	}

	@Override
	public void removeOrder(OrdineBean ob) {
		// TODO Auto-generated method stub
		try (PreparedStatement ps = c.prepareStatement(REMOVE_ORDINE)) {
			ps.setString(1, ob.getNumOrdine());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

	}

	@Override
	public ArrayList<ArticoliBean> getCarrello(OrdineBean ob) {
		// TODO Auto-generated method stub
		ArrayList<ArticoliBean> carrello = new ArrayList<ArticoliBean>();
		try (Statement s = c.createStatement()) {
			ResultSet rs = s.executeQuery(
					"select a.codice_articoli,a.codice_catalogo,a.descrizione,a.prezzo,a.tipologia_articoli,a.offerta,a.nome,a.quantita"
							+ "from Articolo as a,Compongono as c,Ordine as o"
							+ "where a.codice_articoli=c.codice_articoli and c.numero_ordine='" + ob.getNumOrdine()
							+ "'");

			while (rs.next()) {
				String codiceA = rs.getString("codice_articoli"), descrizione = rs.getString("descrizione"),
						tipologia = rs.getString("tipologia_articoli"), nome = rs.getString("nome");
				long codiceC = rs.getLong("codice_catalogo");
				double prezzo = rs.getDouble("prezzo");
				boolean offerta = rs.getBoolean("offerta");
				int quantita = rs.getInt("quantita");

				carrello.add(
						new ArticoliBean(codiceA, codiceC, descrizione, prezzo, nome, tipologia, offerta, quantita));
			}

		} catch (SQLException e) {
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
