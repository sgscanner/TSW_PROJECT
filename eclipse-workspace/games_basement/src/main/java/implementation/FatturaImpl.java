package implementation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.FatturaBean;
import dao.FatturaDAO;

public class FatturaImpl implements FatturaDAO{
	private Connection c;
	private ArrayList<FatturaBean> al;
	private final String INSERT_QUERY="insert into Fattura values(?,?,?)";
	
	public FatturaImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<FatturaBean>();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try(Statement s=c.createStatement()){
			ResultSet rs=s.executeQuery("select * from Fattura");
			while(rs.next()) {
				int idF=rs.getInt("id_fattura"),idP=rs.getInt("id_pagamento");
				Date date=rs.getDate("data");
				
				al.add(new FatturaBean(idF,idP,date));
			}
		}catch(SQLException e) {
			System.out.println("messagge error: "+e.getMessage());
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
	public void addFattura(FatturaBean cb) {
		// TODO Auto-generated method stub
		try(PreparedStatement ps=c.prepareStatement(INSERT_QUERY)){
			ps.setLong(1,cb.getIdFattura());
			ps.setLong(2, cb.getIdPagamento());
			ps.setDate(3, cb.getData());
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		al.add(cb);
	}

	@Override
	public void removeFattura(FatturaBean cb) {
		// TODO Auto-generated method stub
		try(Statement s=c.createStatement()){
			s.executeUpdate("delete from Fattura where Fattura.id_fattura='"+cb.getIdFattura()+"'");
		}catch(SQLException e) {
			System.out.println("Error message: "+e.getMessage());
		}
		al.remove(cb);
	}

	@Override
	public void updateFattura(FatturaBean oldFattura, FatturaBean newFattura) {
		// TODO Auto-generated method stub
		removeFattura(oldFattura);
		addFattura(newFattura);
	}

	@Override
	public ArrayList<FatturaBean> getAllFatture() {
		// TODO Auto-generated method stub
		return al;
	}

}
