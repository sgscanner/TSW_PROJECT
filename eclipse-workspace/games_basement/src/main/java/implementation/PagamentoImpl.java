package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.PagamentoBean;
import dao.PagamentoDAO;

public class PagamentoImpl implements PagamentoDAO{
	private Connection c;
	private ArrayList<PagamentoBean> al;

	public PagamentoImpl() {
		// TODO Auto-generated constructor stub
		al = new ArrayList<PagamentoBean>();
		c = Connessione.setConnection();
		this.fillList();
	}

	private void fillList() {
		try {
			Statement s = c.createStatement();
			ResultSet rs = s.executeQuery("select * from Pagamento");

			while (rs.next()) {
				al.add(new PagamentoBean(rs.getInt(1), rs.getString(2),rs.getDouble(3)));
			}
		} catch (SQLException e) {
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
	public void addPagamento(PagamentoBean pb) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removePagamento(PagamentoBean pb) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePagamento(PagamentoBean oldpb, PagamentoBean newpb) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<PagamentoBean> getAllPagamento() {
		// TODO Auto-generated method stub
		return al;
	}
}
