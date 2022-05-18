package dao;

import java.util.ArrayList;

import bean.CompongonoBean;

public interface CompongonoDAO {
	public ArrayList<CompongonoBean> compongono=new ArrayList<CompongonoBean>();
	
	public void addCompongono(CompongonoBean cb);
	public void removeCompongono(CompongonoBean cb);
	public void updateCompongono(CompongonoBean oldCb,CompongonoBean newCb);
	public ArrayList<CompongonoBean> getAllCompongono();
	
}
