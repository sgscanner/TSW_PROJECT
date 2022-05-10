package dao;
import java.util.ArrayList;

import bean.User;

public class UserDAO {
	ArrayList<User> users;
	
	public UserDAO() {
		users=new ArrayList<User>();
		fillList();
	}
	
	public ArrayList<User> getList(){
		return users;
	}
	
	private void fillList() {
		
	}
	
}
