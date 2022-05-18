package dao;

import java.util.ArrayList;
import bean.UserBean;

public interface UserDAO {
	public ArrayList<UserBean> User=new ArrayList<UserBean>();
	
	public void addUser(UserBean ub);
	public void deleteUser(UserBean ub);
	public void updateUser(UserBean oldUB,UserBean newUB);
	public ArrayList<UserBean> getAllUser();
}
