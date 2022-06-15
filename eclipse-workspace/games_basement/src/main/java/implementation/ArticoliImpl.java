package implementation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.ArticoliBean;
import bean.OrdineBean;
import dao.ArticoliDAO;

public class ArticoliImpl implements ArticoliDAO {
	private ArrayList<ArticoliBean> articoli;
	private Connection c;
	private static final String DELETE_QUERY = "delete from Articolo where Articolo.codice_articoli=?";
	private static final String INSERT_QUERY = "insert into Articolo values(?,?,?,?,?,?,?,?,?)";
	private static final String SEARCH_BY_DATE="select o.numero_ordine,o.id_utente,o.importo_totale,o.data_ordine from Ordine as o where o.data_ordine between ? and ?";
	private static final String SEARCH_BY_CODE="select * from Articolo where Articolo.codice_articoli=?";
	
	public ArticoliImpl() {
		articoli = new ArrayList<ArticoliBean>();
		c = Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s = c.createStatement();
			ResultSet rs = s.executeQuery("select * from Articolo");

			while (rs.next()) {
				String codiceA = rs.getString("codice_articoli"), descrizione = rs.getString("descrizione"),
						tipologia = rs.getString("tipologia_articoli"), immagine = rs.getString("immagine"),
						nome = rs.getString("nome");
				long codiceC = rs.getLong("codice_catalogo");
				double prezzo = rs.getDouble("prezzo");
				boolean offerta = rs.getBoolean("offerta");
				int quantità = rs.getInt("quantità");

				articoli.add(new ArticoliBean(codiceA, codiceC, descrizione, prezzo, nome, tipologia, offerta, immagine,
						quantità));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

	public ArticoliBean searchByCode(String codice) {
		ArticoliBean ab=new ArticoliBean();
		
		try (PreparedStatement ps=c.prepareStatement(SEARCH_BY_CODE)){
			ps.setString(1, codice);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				String codiceA = rs.getString("codice_articoli"), descrizione = rs.getString("descrizione"),
						tipologia = rs.getString("tipologia_articoli"), immagine = rs.getString("immagine"),
						nome = rs.getString("nome");
				long codiceC = rs.getLong("codice_catalogo");
				double prezzo = rs.getDouble("prezzo");
				boolean offerta = rs.getBoolean("offerta");
				int quantità = rs.getInt("quantità");
				
				ab.setCodiceA(codiceA);
				ab.setDescrizione(descrizione);
				ab.setTipologia(tipologia);
				ab.setImmagine(immagine);
				ab.setNome(nome);
				ab.setCodiceC(codiceC);
				ab.setPrezzo(prezzo);
				ab.setOfferta(offerta);
				ab.setQuantità(quantità);
			}
			
			return ab;
		}catch(SQLException e) {
			
		}
		
		return ab;
	}
	
	public ArrayList<ArticoliBean> queryGetProduct(int number) {
		ArrayList<ArticoliBean> homepage = new ArrayList<ArticoliBean>();

		try {
			Statement s = c.createStatement();
			ResultSet rs = s.executeQuery("select * from Articolo order by rand() limit +'" + number + "'");
			while (rs.next()) {
				String codiceA = rs.getString("codice_articoli"), descrizione = rs.getString("descrizione"),
						tipologia = rs.getString("tipologia_articoli"), immagine = rs.getString("immagine"),
						nome = rs.getString("nome");
				long codiceC = rs.getLong("codice_catalogo");
				double prezzo = rs.getDouble("prezzo");
				boolean offerta = rs.getBoolean("offerta");
				int quantità = rs.getInt("quantità");

				homepage.add(new ArticoliBean(codiceA, codiceC, descrizione, prezzo, nome, tipologia, offerta, immagine,
						quantità));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return homepage;
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

	/* metodi interface */
	@Override
	public void addArticolo(ArticoliBean ab) {
		// TODO Auto-generated method stub
		try (PreparedStatement ps = c.prepareStatement(INSERT_QUERY)) {
			ps.setString(1, ab.getCodiceA());
			ps.setLong(2, ab.getCodiceC());
			ps.setString(3, ab.getDescrizione());
			ps.setFloat(4, (float) ab.getPrezzo());
			ps.setString(5, ab.getTipologia());
			ps.setBoolean(6, ab.isOfferta());
			ps.setString(7, ab.getImmagine());
			ps.setString(8, ab.getNome());
			ps.setInt(9, ab.getQuantità());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		articoli.add(ab);
	}

	@Override
	public void removeArticolo(ArticoliBean ab) {
		// TODO Auto-generated method stub
		try (PreparedStatement ps = c.prepareStatement(DELETE_QUERY)) {
			ps.setString(1, ab.getCodiceA());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		articoli.remove(ab);
	}

	@Override
	public void updateArticolo(ArticoliBean oldArticolo, ArticoliBean newArticolo) {
		// TODO Auto-generated method stub
		removeArticolo(oldArticolo);
		addArticolo(newArticolo);
	}

	@Override
	public ArrayList<ArticoliBean> getAllArticoli() {
		// TODO Auto-generated method stub
		return articoli;
	}

}