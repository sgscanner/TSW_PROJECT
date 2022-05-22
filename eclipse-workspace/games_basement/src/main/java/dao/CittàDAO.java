package dao;

import java.util.ArrayList;

import bean.CittàBean;

public interface CittàDAO {
	
	public void addCittà(CittàBean cb);
	public void removeCittà(CittàBean cb);
	public void updateCittà(CittàBean oldCittà,CittàBean newCittà);
	public ArrayList<CittàBean> getAllCittà();
	
}
