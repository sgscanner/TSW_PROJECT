package implementation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.DatiAnagraficiBean;
import dao.DatiAnagraficiDAO;

public class DatiAnagrificiImpl implements DatiAnagraficiDAO{
	private Connection c;
	private ArrayList<DatiAnagraficiBean> al;
	
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
				String idU=rs.getString(1),idC=rs.getString(2),nome=rs.getString(3),cognome=rs.getString(4),
						telefono=rs.getString(5);
				Date bDay=rs.getDate(6);
				
				al.add(new DatiAnagraficiBean(idU,idC,nome,cognome,telefono,bDay));
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
	public void addDatiAnagrafici(DatiAnagraficiBean dab) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("insert into Dati_anagrafici values('"+dab.getIdUtente()+"','"+dab.getIdCittà()+"',"
							+ "'"+dab.getNome()+"','"+dab.getCognome()+"','"+dab.getTelefono()+"','"+dab.getDataNascita()+"')");
		}catch(SQLException e) {
			
		}finally {
			al.add(dab);
		}
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
		try{
			Statement s=c.createStatement(),s1=c.createStatement();
			s.executeUpdate("delete from Dati_anagrafici where Dati_anagrafici.id_utente='"+oldDab.getIdUtente()+"'");
			s1.executeUpdate("insert into Dati_anagrafici values('"+newDab.getIdUtente()+"','"+newDab.getIdCittà()+"',"
					+ "'"+newDab.getNome()+"','"+newDab.getCognome()+"','"+newDab.getTelefono()+"','"+newDab.getDataNascita()+"')");
		}catch(SQLException e) {
			
		}finally {
			al.set(al.indexOf(oldDab), newDab);
		}
	}

	@Override
	public ArrayList<DatiAnagraficiBean> getAllDatiAnagrafici() {
		// TODO Auto-generated method stub
		return al;
	}
}
