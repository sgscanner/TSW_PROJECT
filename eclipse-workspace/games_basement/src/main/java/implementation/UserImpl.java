package implementation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.UserBean;
import dao.UserDAO;

public class UserImpl implements UserDAO{
	private Connection c;
	private ArrayList<UserBean> al;

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

	@Override
	public void addUser(UserBean ub) {
		// TODO Auto-generated method stub
		try {
			Statement s=c.createStatement();
			s.executeUpdate("insert into Utente values('"+ub.getUsername()+"','"+ub.getEmail()+"','"+ub.getPassword()+"','"+ub.getRuolo()+"')");
		}catch(SQLException e) {
			
		}finally {
		}
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
