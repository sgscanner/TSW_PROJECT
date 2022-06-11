package implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.ContantiBean;
import dao.ContantiDAO;

public class ContantiImpl implements ContantiDAO {
	private Connection c;
	private ArrayList<ContantiBean> al;
	private final String INSERT_QUERY="insert into Contanti values(?)";
	
	public ContantiImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<ContantiBean>();
		c=Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Contanti");
			
			while(rs.next()) {
				
				al.add(new ContantiBean(rs.getInt(1)));
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
	public void addContanti(ContantiBean cb) {
		// TODO Auto-generated method stub
		try(PreparedStatement ps=c.prepareStatement(INSERT_QUERY)){
			ps.setInt(1, cb.getIdPagamento());
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		al.add(cb);
	}

	@Override
	public void removeContanti(ContantiBean cb) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("delete from Contanti where Contanti.id_pagamento='"+cb.getIdPagamento()+"'");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			al.remove(cb);
		}
	}

	@Override
	public void updateContanti(ContantiBean oldCb, ContantiBean newCb) {
		// TODO Auto-generated method stub
		removeContanti(oldCb);
		addContanti(newCb);
	}

	@Override
	public ArrayList<ContantiBean> getAllContanti() {
		// TODO Auto-generated method stub
		return al;
	}

}
