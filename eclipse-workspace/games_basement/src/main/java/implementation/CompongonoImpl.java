package implementation;

import java.sql.Connection;
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
	private ArrayList<CompongonoBean> al;
	
	public CompongonoImpl() {
		// TODO Auto-generated constructor stub
		c=Connessione.setConnection();
		al=new ArrayList<CompongonoBean>();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Compongono");
			
			while(rs.next()) {
				al.add(new CompongonoBean(rs.getString(1),rs.getString(2),rs.getInt(3)));
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
	public void addArticleToCart(ArticoliBean ab, int quantity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeArticleFromCart(ArticoliBean ab, int quantity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<ArticoliBean> getAllArticleOrder(OrdineBean ob) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<CompongonoBean> getAllCompongono() {
		// TODO Auto-generated method stub
		return null;
	}


}
