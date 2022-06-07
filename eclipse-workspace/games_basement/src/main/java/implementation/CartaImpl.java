package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CartaBean;
import dao.CartaDAO;

public class CartaImpl implements CartaDAO{
	private ArrayList<CartaBean> al;
	private Connection c;
	
	public CartaImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<CartaBean>();
		c=Connessione.setConnection();
		this.fillList();
	
	}

	private void fillList() {
		try(Statement s=c.createStatement()){
			ResultSet rs=s.executeQuery("select * from Carta");
			
			while(rs.next()) {
				String numeroCarta=rs.getString("numero_di_carta"),datiIntestatario=rs.getString("dati_intestatario");
				int idPagamento=rs.getInt("id_pagamento");
				CartaBean cb=new CartaBean(numeroCarta,datiIntestatario,idPagamento);
				
				al.add(cb); 
			}
			
		}catch(SQLException e) {
			System.out.println("Statement non riuscito");
		}
	}
	
	@Override
	public void addCarta(CartaBean cb) {
		// TODO Auto-generated method stub
		try(Statement s=c.createStatement()){
			s.executeUpdate("insert into Carta values('"+cb.getNumeroCarta()+"','"+cb.getIdPagamento()+"','"+cb.getDatiIntestario()+"')");
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void removeCarta(CartaBean cb) {
		// TODO Auto-generated method stub
		try(Statement s=c.createStatement()){
			s.executeUpdate("delete from Carta AS c where c.numero_di_carta='"+cb.getNumeroCarta()+"' and c.id_pagamento='"+cb.getIdPagamento()+"' and c.dati_intestatario='"+cb.getDatiIntestario()+"' ");
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateCarta(CartaBean oldCarta, CartaBean newCarta) {
		// TODO Auto-generated method stub
		try {
			Statement d=c.createStatement(),i=c.createStatement();
			d.executeUpdate("delete from Carta AS c where c.numero_di_carta='"+oldCarta.getNumeroCarta()+"' and c.id_pagamento='"+oldCarta.getIdPagamento()+"' and c.dati_intestatario='"+oldCarta.getDatiIntestario()+"' ");
			i.executeUpdate("insert into Carta values('"+newCarta.getNumeroCarta()+"','"+newCarta.getIdPagamento()+"','"+newCarta.getDatiIntestario()+"')");
		}catch(SQLException e) {
			
		}
	}

	@Override
	public ArrayList<CartaBean> getAllBonificiCarte() {
		// TODO Auto-generated method stub
		return al;
	}

}
