package dao;

import java.util.ArrayList;
import bean.ArticoliBean;

public interface ArticoliDAO {
	
	public void addArticolo(ArticoliBean ab);
	public void removeArticolo(ArticoliBean ab);
	public void updateArticolo(ArticoliBean oldArticolo,ArticoliBean newArticolo);
	public ArrayList<ArticoliBean> getAllArticoli();
}
