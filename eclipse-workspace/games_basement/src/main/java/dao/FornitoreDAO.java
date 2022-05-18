package dao;

import java.util.ArrayList;

import bean.FornitoreBean;

public interface FornitoreDAO {
	public ArrayList<FornitoreBean> Fornitore = new ArrayList<FornitoreBean>();

	public void addFornitore(FornitoreBean fb);

	public void removeFornitore(FornitoreBean fb);

	public void updateFornitore(FornitoreBean oldfb, FornitoreBean newfb);

	public ArrayList<FornitoreBean> getAllFornitore();
}
