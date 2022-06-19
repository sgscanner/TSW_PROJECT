package implementation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.DatiAnagraficiBean;
import dao.DatiAnagraficiDAO;

public class DatiAnagrificiImpl implements DatiAnagraficiDAO{
	private Connection c;
	private ArrayList<DatiAnagraficiBean> al;
	private final String INSERT_QUERY="insert into Dati_anagrafici values(?,?,?,?,?,?,?)";
	
	public DatiAnagrificiImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<DatiAnagraficiBean>();
		c=Connessione.setConnection();
		this.fillList();
	}
	
	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Dati_anagrafici");
			
			while(rs.next()) {
				String idU=rs.getString("id_utente"),idC=rs.getString("cap"),nome=rs.getString("nome"),cognome=rs.getString("cognome"),
						telefono=rs.getString("telefono"),citta=rs.getString("citta");
				
				Date bDay=rs.getDate(3);
				
				al.add(new DatiAnagraficiBean(idU,idC,nome,cognome,telefono,bDay,citta));
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

	public DatiAnagraficiBean searchDatiAnagrafici(String uname) {
		DatiAnagraficiBean dab=new DatiAnagraficiBean();
		
		try(Statement s=c.createStatement()) {
			ResultSet rs=s.executeQuery("select * from Dati_anagrafici where Dati_anagrafici.id_utente='"+uname+"'");
			
			while(rs.next()) {
				String idU=rs.getString("id_utente"),idC=rs.getString("cap"),nome=rs.getString("nome"),cognome=rs.getString("cognome"),
						telefono=rs.getString("telefono"),citta=rs.getString("citta");
				Date bDay=rs.getDate(3);
				
				dab.setIdUtente(idU);
				dab.setcap(idC);
				dab.setNome(nome);
				dab.setCognome(cognome);
				dab.setTelefono(telefono);
				dab.setCitta(citta);
				dab.setDataNascita(bDay);
			}
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return dab;
	}
	
	@Override
	public void addDatiAnagrafici(DatiAnagraficiBean dab) {
		// TODO Auto-generated method stub
		try(PreparedStatement ps=c.prepareStatement(INSERT_QUERY)){
			ps.setString(1, dab.getIdUtente()); ps.setString(2, dab.getTelefono());
			ps.setDate(3, dab.getDataNascita()); ps.setString(4, dab.getNome());
			ps.setString(5, dab.getCognome()); ps.setString(6, dab.getCitta());
			ps.setString(7, dab.getcap());
			ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		al.add(dab);
	}

	@Override
	public void removeDatiAnagrafici(DatiAnagraficiBean dab) {
		// TODO Auto-generated method stub
		try{
			Statement s=c.createStatement();
			s.executeUpdate("delete from Dati_anagrafici where Dati_anagrafici.id_utente='"+dab.getIdUtente()+"'");
			
		}catch(SQLException e) {
			
		}finally {
			al.remove(dab);
		}
	}

	@Override
	public void updateDatiAnagrafici(DatiAnagraficiBean oldDab, DatiAnagraficiBean newDab) {
		// TODO Auto-generated method stub
		removeDatiAnagrafici(oldDab);
		addDatiAnagrafici(newDab);
	}

	@Override
	public ArrayList<DatiAnagraficiBean> getAllDatiAnagrafici() {
		// TODO Auto-generated method stub
		return al;
	}
}
