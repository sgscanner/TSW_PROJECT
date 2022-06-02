package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.BonificoBean;
import dao.BonificoDAO;

public class BonificoImpl implements BonificoDAO{
	private ArrayList<BonificoBean> al;
	private Connection c;
	
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
		try (Statement s=c.createStatement()){
			s.executeUpdate("insert into Bonifico values('"+cb.getIban()+"','"+cb.getIdPagamento()+"','"+cb.getCausale()+"','"+cb.getDatiIntestario()+"')");
		}catch(SQLException e) {
			
		}
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
		try {
			Statement s=c.createStatement(),s1=c.createStatement();
			s.executeUpdate("delete from Bonifico as b where b.iban='"+oldBonifico.getIban()+"' and b.id_pagamento='"+oldBonifico.getIdPagamento()+"' "
					  + "and b.causale='"+oldBonifico.getCausale()+"' and b.dati_intestatario='"+oldBonifico.getDatiIntestario()+"'");
			s1.executeUpdate("insert into Bonifico values('"+newBonifico.getIban()+"','"+newBonifico.getIdPagamento()+"','"+newBonifico.getCausale()+"','"+newBonifico.getDatiIntestario()+"')");
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<BonificoBean> getAllBonifici() {
		// TODO Auto-generated method stub
		return al;
	}

}
