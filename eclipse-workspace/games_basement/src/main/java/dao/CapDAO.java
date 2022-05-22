package dao;

import java.util.ArrayList;

import bean.CapBean;

public interface CapDAO {

	public void addCap(CapBean cb);
	public void removeCap(CapBean cb);
	public void updateCap(CapBean oldCap,CapBean newCap);                            
	public ArrayList<CapBean> getAllCap();
}
