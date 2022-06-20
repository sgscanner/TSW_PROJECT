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

	public CompongonoBean searchCart() {
		CompongonoBean cb = new CompongonoBean();
		try (Statement s = c.createStatement()) {
			s.execute("select * from Compongono where Compongono.numero_ordine='not completed'");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return cb;
	}

	public void completeOrder(OrdineBean ob, ArrayList<ArticoliBean> articoli) {
		for (ArticoliBean ab : articoli) {

			try (Statement s = c.createStatement()) {
				s.execute("update Compongono set numero_ordine='" + ob.getNumOrdine()
						+ "' where Compongono.codice_articoli='" + ab.getCodiceA() + "'");
			} catch (SQLException e1) {
				System.out.println(e1.getMessage());
			}

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
			ResultSet rs = ordine.executeQuery("select * " + "from Articolo " + "where Ordine.id_utente='" + username
					+ "'and Ordine.id_utente='prenotato' and Compongono.numero_ordine=Ordine.id_utente and Compongono.codice_articoli='"
					+ codiceA + "'");
			while (rs.next()) {
				ab.setCodiceA(rs.getString("codice_articoloìi"));
				ab.setCodiceC(rs.getLong("codice_catalogo"));
				ab.setDescrizione(rs.getString("descrizione"));
				ab.setTipologia(rs.getString("tipologia_articoli"));
				ab.setOfferta(rs.getBoolean("offerta"));
				ab.setNome(rs.getString("nome"));
				ab.setQuantita(rs.getInt("quantità"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ab;
	}

	public ArticoliBean getAllPrenotazioni(String codiceA,String username) {
		ArticoliBean ab=new ArticoliBean();
		try (Statement ordine = c.createStatement()) {
			ResultSet rs = ordine.executeQuery("select * " + "from Articolo " + "where Ordine.id_utente='" + username
					+ "'and Ordine.id_utente='prenotato' and Compongono.numero_ordine=Ordine.id_utente and Compongono.codice_articoli='"
					+ codiceA + "'");
			while (rs.next()) {
				ab.setCodiceA(rs.getString("codice_articoloìi"));
				ab.setCodiceC(rs.getLong("codice_catalogo"));
				ab.setDescrizione(rs.getString("descrizione"));
				ab.setTipologia(rs.getString("tipologia_articoli"));
				ab.setOfferta(rs.getBoolean("offerta"));
				ab.setNome(rs.getString("nome"));
				ab.setQuantita(rs.getInt("quantità"));
			}
		} catch (SQLException e) {

		}
		
		return ab;
	}

	public void removeFromCart(String codiceA) {
		try(Statement s=c.createStatement()){
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public int countPrenotazioni(String username) {
		int numPrenotazioni = 0;

		try (Statement s = c.createStatement()) {
			ResultSet rs = s.executeQuery("select * from Compongono where Compongono.numero_ordine='prenotato' and Ordine.numero_ordine=Compongono.numero_ordine and Ordine.id_utente='"+username+"'");
			rs.last();
			numPrenotazioni = rs.getRow();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return numPrenotazioni;
	}

	public int addToCart(ArticoliBean ab, int quantita) {
		int result = 0;
		try (PreparedStatement ps = c.prepareStatement(INSERT_COMPONGONO)) {
			ps.setString(1, ab.getCodiceA());
			ps.setInt(2, quantita);
			ps.setFloat(3, (float) ab.getPrezzo());
			ps.setString(4, "not completed");
			result = ps.executeUpdate();
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
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
