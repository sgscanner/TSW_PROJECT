package dao;

import java.util.ArrayList;

import bean.CittàBean;

public interface CittàDAO {
	public ArrayList<CittàBean> città=new ArrayList<CittàBean>();
	
	public void addCittà(CittàBean cb);
	public void removeCittà(CittàBean cb);
	public void updateCittà(CittàBean oldCittà,CittàBean newCittà);
	public ArrayList<CittàBean> getAllCittà();
	
}
