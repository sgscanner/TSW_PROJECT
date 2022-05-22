package dao;

import java.util.ArrayList;

import bean.FornitoreBean;

public interface FornitoreDAO {

	public void addFornitore(FornitoreBean fb);

	public void removeFornitore(FornitoreBean fb);

	public void updateFornitore(FornitoreBean oldfb, FornitoreBean newfb);

	public ArrayList<FornitoreBean> getAllFornitore();
}
