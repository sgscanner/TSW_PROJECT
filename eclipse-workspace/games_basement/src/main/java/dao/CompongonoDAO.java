package dao;

import java.util.ArrayList;

import bean.ArticoliBean;
import bean.CompongonoBean;
import bean.OrdineBean;

public interface CompongonoDAO {
	
	public void addArticleToCart(ArticoliBean ab,int quantity);
	public void removeArticleFromCart(ArticoliBean ab,int quantity);
	public ArrayList<ArticoliBean> getAllArticleOrder(OrdineBean ob);
	public ArrayList<CompongonoBean> getAllCompongono();
}
