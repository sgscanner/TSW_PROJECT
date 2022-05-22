package implementation;

import java.sql.*;
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

			System.out.println("prima dell'if"+rs.next());
			if(!rs.next()) {
				articoli.add(new ArticoliBean("",0,"",(float) 0.0,"","",false,""));
			}
			System.out.println("dopo l'if:"+rs.next());
			while(rs.next()) {
				String codiceA=rs.getString("codice_articoli"),descrizione=rs.getString("descrizione"),
						tipologia=rs.getString("tipologia_articoli"),immagine=rs.getString("immagine"),nome=rs.getString("nome");
				long codiceC=rs.getLong("codice_catalogo");
				double prezzo=rs.getDouble("prezzo");
				boolean offerta=rs.getBoolean("offerta");
				System.out.println("codiceA: "+codiceA+"codiceC: "+codiceC+"descrizione: "+descrizione+
								   "prezzo: "+prezzo+"tipologia: "+
								   "offerta: "+offerta+"immagine: "+immagine+"nome:"+nome);
				articoli.add(new ArticoliBean(codiceA,codiceC,descrizione,prezzo,nome,tipologia,offerta,immagine));
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
	
	public ArrayList<ArticoliBean> queryGetProduct(int i) {
		ArrayList<ArticoliBean> homepage=new ArrayList<ArticoliBean>();
		
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Articolo order by rand() limit "+i);
			while(rs.next()) {
				String codiceA=rs.getString(1),descrizione=rs.getString(3),tipologia=rs.getString(5),immagine=rs.getString(7),nome=rs.getString(8);
				int codiceC=rs.getInt(2);
				float prezzo=rs.getFloat(4);
				boolean offerta=rs.getBoolean(6);
				
				homepage.add(new ArticoliBean(codiceA,codiceC,descrizione,prezzo,nome,tipologia,offerta,immagine));
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
							+ "'"+ab.isOfferta()+"','"+ab.getImmagine()+"','"+ab.getNome()+"')");
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
			s.executeUpdate("delete from Articolo where Articolo.nome='"+ab.getNome()+"'");
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
			s.executeUpdate("delete from Articolo where Articolo.nome='"+oldArticolo.getNome()+"'");
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