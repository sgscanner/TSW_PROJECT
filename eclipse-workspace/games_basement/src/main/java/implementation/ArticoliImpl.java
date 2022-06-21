package implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.ArticoliBean;
import bean.RecensioneBean;
import dao.ArticoliDAO;

public class ArticoliImpl implements ArticoliDAO {
	private ArrayList<ArticoliBean> articoli;
	private Connection c;
	private static final String DELETE_QUERY = "update Articolo set quantita=-1 where Articolo.codice_articoli=?";
	private static final String INSERT_QUERY = "insert into Articolo values(?,?,?,?,?,?,?,?)";
	private static final String SEARCH_BY_CODE = "select * from Articolo where Articolo.codice_articoli=?";
	
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
						tipologia = rs.getString("tipologia_articoli"),nome = rs.getString("nome");
				long codiceC = rs.getLong("codice_catalogo");
				double prezzo = rs.getDouble("prezzo");
				boolean offerta = rs.getBoolean("offerta");
				int quantita= rs.getInt("quantita");

				articoli.add(new ArticoliBean(codiceA, codiceC, descrizione, prezzo, nome, tipologia, offerta,quantita));
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

	public ArrayList<ArticoliBean> listaProdottiJSP(String nome){
		ArrayList<ArticoliBean> temp=new ArrayList<ArticoliBean>();
		try {
			Statement lista=c.createStatement();
			ResultSet rs = lista.executeQuery("SELECT A.nome, A.prezzo, A.codice_articoli, A.quantita "
					   						+ "FROM Articolo AS A,Sono_forniti_da AS S,Fornitore AS F "
											+ "WHERE A.codice_articoli=S.codice_articoli AND S.partita_iva=F.partita_iva AND F.nome='"+nome+"'");
			while(rs.next()){
				ArticoliBean ab = new ArticoliBean();
				ab.setCodiceA(rs.getString("codice_articoli"));
				ab.setNome(rs.getString("nome"));
				ab.setPrezzo(rs.getInt("prezzo"));
				ab.setCodiceC(0);
				ab.setDescrizione("");
				ab.setOfferta(false);
				ab.setQuantita(rs.getInt("quantita"));
				ab.setTipologia("");
				temp.add(ab);
			}
			return temp;
		}catch(SQLException e) {
			
		}
		return temp;
	}
	
	
	public ArticoliBean searchByCode(String codice) {
		ArticoliBean ab=new ArticoliBean();
		
		try (PreparedStatement ps=c.prepareStatement(SEARCH_BY_CODE)){
			ps.setString(1, codice);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				String codiceA = rs.getString("codice_articoli"), descrizione = rs.getString("descrizione"),
						tipologia = rs.getString("tipologia_articoli"),
						nome = rs.getString("nome");
				long codiceC = rs.getLong("codice_catalogo");
				double prezzo = rs.getDouble("prezzo");
				boolean offerta = rs.getBoolean("offerta");
				int quantita= rs.getInt("quantita");
				
				ab.setCodiceA(codiceA);
				ab.setDescrizione(descrizione);
				ab.setTipologia(tipologia);
				ab.setNome(nome);
				ab.setCodiceC(codiceC);
				ab.setPrezzo(prezzo);
				ab.setOfferta(offerta);
				ab.setQuantita(quantita);
			}
			
			return ab;
		}catch(SQLException e) {
			System.out.println(e.getMessage());
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
						tipologia = rs.getString("tipologia_articoli"),
						nome = rs.getString("nome");
				long codiceC = rs.getLong("codice_catalogo");
				double prezzo = rs.getDouble("prezzo");
				boolean offerta = rs.getBoolean("offerta");
				int quantita = rs.getInt("quantita");

				homepage.add(new ArticoliBean(codiceA, codiceC, descrizione, prezzo, nome, tipologia, offerta,
						quantita));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return homepage;
	}

	public ArrayList<RecensioneBean> getRecensioni(ArticoliBean ab) {
		ArrayList<RecensioneBean> temp=new ArrayList<RecensioneBean>();
		
		try(Statement s=c.createStatement()){
			ResultSet rs=s.executeQuery("select r.titolo,r.numeroStelle,r.descrizione,r.id_utente"
					                  + "from Recensione as r"
					                  + "where r.codice_articoli='"+ab.getCodiceA()+"'");
			while(rs.next()) {
				RecensioneBean rb=new RecensioneBean();
				rb.setIdUtente(rs.getString("id_utente"));
				rb.setDescrizione(rs.getString("descrizione"));
				rb.setNumeroStelle(rs.getInt("numeroStelle"));
				rb.setTitolo(rs.getString("titolo"));
				rb.setCodiceArticolo(ab.getCodiceA());
				temp.add(rb);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return temp;
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
			ps.setString(8, ab.getNome());
			ps.setInt(9, ab.getQuantita());
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