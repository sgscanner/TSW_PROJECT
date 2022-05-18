package dao;

import java.util.ArrayList;

import bean.ContantiBean;

public interface ContantiDAO {
	public ArrayList<ContantiBean> contanti=new ArrayList<ContantiBean>();
	
	public void addContanti(ContantiBean cb);
	public void removeContanti(ContantiBean cb);
	public void updateContanti(ContantiBean oldCb,ContantiBean newCb);
	public ArrayList<ContantiBean> getAllContanti();
}
