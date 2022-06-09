package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.ArticoliBean;
import dao.ArticoliDAO;

public class ArticoliImpl implements ArticoliDAO{
	private ArrayList<ArticoliBean> articoli;
	private Connection c;
	
	public ArticoliImpl() {
		articoli=new ArrayList<ArticoliBean>();
		c=Connessione.setConnection();
		this.fillList();
	}
	
	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Articolo");

			while(rs.next()) {
				String codiceA=rs.getString("codice_articoli"),descrizione=rs.getString("descrizione"),
						tipologia=rs.getString("tipologia_articoli"),immagine=rs.getString("immagine"),nome=rs.getString("nome");
				long codiceC=rs.getLong("codice_catalogo");
				double prezzo=rs.getDouble("prezzo");
				boolean offerta=rs.getBoolean("offerta");
				int quantità=rs.getInt("quantità");
				
				articoli.add(new ArticoliBean(codiceA,codiceC,descrizione,prezzo,nome,tipologia,offerta,immagine,quantità));
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
	
	public ArrayList<ArticoliBean> queryGetProduct(int number) {
		ArrayList<ArticoliBean> homepage=new ArrayList<ArticoliBean>();
		
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Articolo order by rand() limit +'"+number+"'");
			while(rs.next()) {
				String codiceA=rs.getString("codice_articoli"),descrizione=rs.getString("descrizione"),
						tipologia=rs.getString("tipologia_articoli"),immagine=rs.getString("immagine"),nome=rs.getString("nome");
				long codiceC=rs.getLong("codice_catalogo");
				double prezzo=rs.getDouble("prezzo");
				boolean offerta=rs.getBoolean("offerta");
				int quantità=rs.getInt("quantità");
				
				homepage.add(new ArticoliBean(codiceA,codiceC,descrizione,prezzo,nome,tipologia,offerta,immagine,quantità));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return homepage;
	}
	
	/*metodi interface*/
	@Override
	public void addArticolo(ArticoliBean ab) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("insert into Articolo values('"+ab.getCodiceA()+"','"+ab.getCodiceC()+"',"
							+ "'"+ab.getDescrizione()+"','"+ab.getPrezzo()+"','"+ab.getTipologia()+"',"
							+ "'"+ab.isOfferta()+"','"+ab.getImmagine()+"','"+ab.getNome()+"','"+ab.getQuantità()+"')");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		articoli.add(ab);
	}

	@Override
	public void removeArticolo(ArticoliBean ab) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("delete from Articolo where Articolo.codice_articoli='"+ab.getCodiceA()+"'");
		}catch(SQLException e) {
			e.printStackTrace();
		}
		articoli.remove(ab);
	}

	@Override
	public void updateArticolo(ArticoliBean oldArticolo, ArticoliBean newArticolo) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement(),s1=c.createStatement();
			s.executeUpdate("delete from Articolo where Articolo.codice_articoli='"+oldArticolo.getCodiceA()+"'");
			s1.executeUpdate("insert into Articolo values('"+newArticolo.getCodiceA()+"','"+newArticolo.getCodiceC()+"',"
					+ "'"+newArticolo.getDescrizione()+"','"+newArticolo.getPrezzo()+"','"+newArticolo.getTipologia()+"',"
					+ "'"+newArticolo.isOfferta()+"','"+newArticolo.getImmagine()+"','"+newArticolo.getNome()+"')");
		}catch(SQLException e) {
			
		}
		articoli.set(articoli.indexOf(oldArticolo), newArticolo);
	}

	@Override
	public ArrayList<ArticoliBean> getAllArticoli() {
		// TODO Auto-generated method stub
		return articoli;
	}

}