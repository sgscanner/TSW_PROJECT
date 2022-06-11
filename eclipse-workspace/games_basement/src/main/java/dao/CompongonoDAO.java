package dao;

import java.util.ArrayList;

import bean.ArticoliBean;
import bean.CompongonoBean;
import bean.OrdineBean;

public interface CompongonoDAO {
	
	public void addCompongono(CompongonoBean cb);
	public void removeOrder(OrdineBean ob);
	public ArrayList<ArticoliBean> getCarrello(OrdineBean ob);
	public ArrayList<CompongonoBean> getAllCompongono();
}
