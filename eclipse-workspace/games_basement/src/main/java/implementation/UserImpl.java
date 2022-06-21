package implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.UserBean;
import dao.UserDAO;

public class UserImpl implements UserDAO{
	private Connection c;
	private ArrayList<UserBean> al;
	private final String INSERT_QUERY="insert into Utente values(?,?,?,?)";
	
	public UserImpl() {
		// TODO Auto-generated constructor stub
		al=new ArrayList<UserBean>();
		c=Connessione.setConnection();
		this.fillList();
	} 

	private void fillList() {
		try {
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from Utente");
			
			while(rs.next()) {	
				al.add(new UserBean(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4)));
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

	public UserBean searchUser(String username) {
		
		try(Statement s=c.createStatement()){
			ResultSet rs=s.executeQuery("select * from Utente where id_utente='"+username+"'");
			UserBean ub=new UserBean() ;
			
			while(rs.next()) {
				ub.setUsername(rs.getString("id_utente"));
				ub.setEmail(rs.getString("email"));
				ub.setRuolo(rs.getString("ruolo"));
				ub.setPassword(rs.getString("password"));
			}
			
			return ub;
		}catch(SQLException e) {
			System.out.println("error:"+e.getMessage());
		}
		return null;
	}
	
	public void upgradeUtente(String uname) {
		try(Statement s=c.createStatement()){
			s.executeUpdate("update Utente set ruolo='admin' where Utente.id_utente='"+uname+"'");
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void downgradeUtente(String uname) {
		try(Statement s=c.createStatement()){
			s.executeUpdate("update Utente set ruolo='normale' where Utente.id_utente='"+uname+"'");
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	@Override
	public void addUser(UserBean ub) {
		// TODO Auto-generated method stub
		try (PreparedStatement ps=c.prepareStatement(INSERT_QUERY)){
			ps.setString(1, ub.getUsername());
			ps.setString(2, ub.getRuolo());
			ps.setString(3, ub.getPassword());
			ps.setString(4, ub.getEmail());
			ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
		al.add(ub);
	}

	@Override
	public void deleteUser(UserBean ub) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("delete from Utente where Utente.id_utente='"+ub.getUsername()+"'");
		}catch(SQLException e) {
			
		}finally {
			al.remove(ub);
		}
	}

	@Override
	public void updateUser(UserBean oldUB, UserBean newUB) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement(),s1=c.createStatement();
			s.executeUpdate("delete from Utente where Utente.id_utente='"+oldUB.getUsername()+"'");
			s1.executeUpdate("insert into Utente values('"+newUB.getUsername()+"','"+newUB.getEmail()+"','"+newUB.getPassword()+"','"+newUB.getRuolo()+"')");
		}catch(SQLException e) {
			
		}finally {
			al.set(al.indexOf(oldUB),newUB);
		}
	}

	@Override
	public ArrayList<UserBean> getAllUser() {
		// TODO Auto-generated method stub
		return al;
	}
}
