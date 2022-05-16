package dao;
import java.util.ArrayList;
import db.*;
import bean.UserBean;

public class UserDAO {
	ArrayList<UserBean> users;
	
	public UserDAO() {
		users=new ArrayList<UserBean>();
		fillList();
	}
	
	public ArrayList<UserBean> getList(){
		return users;
	}
	
	private void fillList() {
		
	}
	
}
