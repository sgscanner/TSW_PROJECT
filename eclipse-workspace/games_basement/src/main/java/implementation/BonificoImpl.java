package implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.BonificoBean;
import dao.BonificoDAO;

public class BonificoImpl implements BonificoDAO{
	private ArrayList<BonificoBean> al;
	private Connection c;
	private final String INSERT_QUERY="insert into Bonifico values(?,?,?,?)";
	
	public BonificoImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<BonificoBean>();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try(Statement s=c.createStatement()) {
			ResultSet rs=s.executeQuery("select * from Bonifico");
			
			while(rs.next()) {
				String iban=rs.getString("iban"),dati=rs.getString("dati_intestatario"),causale=rs.getString("causale");
				int idPagamento=rs.getInt("id_pagamento");
				
				BonificoBean bb=new BonificoBean(iban,dati,causale,idPagamento);
				al.add(bb);
			}
		}catch(SQLException e) {
			
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
	public void addBonifico(BonificoBean cb) {
		// TODO Auto-generated method stub
		try (PreparedStatement ps=c.prepareStatement(INSERT_QUERY)){
			ps.setString(1, cb.getIban()); ps.setInt(2, cb.getIdPagamento());
			ps.setString(3, cb.getCausale()); ps.setString(4, cb.getDatiIntestario());
			ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		al.add(cb);
	}

	@Override
	public void removeBonifico(BonificoBean cb) {
		// TODO Auto-generated method stub
		try(Statement s=c.createStatement()){
			s.executeUpdate("delete from Bonifico as b where b.iban='"+cb.getIban()+"' and b.id_pagamento='"+cb.getIdPagamento()+"' "
						  + "and b.causale='"+cb.getCausale()+"' and b.dati_intestatario='"+cb.getDatiIntestario()+"'");
		}catch(SQLException e) {
			
		}
	}

	@Override
	public void updateBonifico(BonificoBean oldBonifico, BonificoBean newBonifico) {
		// TODO Auto-generated method stub
		removeBonifico(oldBonifico);
		addBonifico(newBonifico);
	}

	@Override
	public ArrayList<BonificoBean> getAllBonifici() {
		// TODO Auto-generated method stub
		return al;
	}

}
