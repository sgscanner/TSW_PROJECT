package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Url;

import bean.ArticoliBean;

public class GeneralQuery {
	private Connection c;
	private ArrayList<ArticoliBean> articoli;
	
	public GeneralQuery() {
		c = this.startConnection();
		articoli=new ArrayList<ArticoliBean>();
	}

	private Connection startConnection() {
		return Connessione.setConnection();
	}

	
	public void getProductHomePage() {
		try {
			Statement st=c.createStatement();
			ResultSet rs=st.executeQuery("select * from Articoli order by rand 12");
			while(rs.next()) {
				
			}
			this.stopConnection(c);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void searchProduct(String parameter) {
		try {
			Statement st=c.createStatement();
			ResultSet rs=st.executeQuery("select select nomi,descrizione,prezzo,immagine from Articoli where Articoli.nome='"+parameter+"'");
		}catch (SQLException e) {
			// TODO: handle exception
		}
	}
	
	private void stopConnection(Connection c) {
		try {
			Connessione.releaseConnection(c);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<ArticoliBean> getArticoli() {
		return articoli;
	}

}
