package implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.FornitoreBean;
import dao.FornitoreDAO;

public class FornitoreImpl implements FornitoreDAO{
	private Connection c;
	private ArrayList<FornitoreBean> al;
	private final String INSERT_QUERY="insert into Fornitore values(?,?,?)";
	
	public FornitoreImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<FornitoreBean>();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Fornitore");
			
			while(rs.next()) {
				al.add(new FornitoreBean(rs.getString(1),rs.getString(2),rs.getString(3)));
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
	public void addFornitore(FornitoreBean fb) {
		// TODO Auto-generated method stub
		try (PreparedStatement ps=c.prepareStatement(INSERT_QUERY)){
			ps.setString(1, fb.getIva());
			ps.setString(2, fb.getNome());
			ps.setString(3, fb.getIndirizzo());
		}catch(SQLException e) {
			System.out.println("error:"+e.getMessage());
		}
		al.add(fb);
	}

	@Override
	public void removeFornitore(FornitoreBean fb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("delete from Fornitore where Fornitore.partita_iva='"+fb.getIva()+"'");
		}catch(SQLException e) {
			
		}finally {
			al.remove(fb);
		}
		
	}

	@Override
	public void updateFornitore(FornitoreBean oldfb, FornitoreBean newfb) {
		// TODO Auto-generated method stub
		removeFornitore(oldfb);
		addFornitore(newfb);
	}

	@Override
	public ArrayList<FornitoreBean> getAllFornitore() {
		// TODO Auto-generated method stub
		return al;
	}
}
