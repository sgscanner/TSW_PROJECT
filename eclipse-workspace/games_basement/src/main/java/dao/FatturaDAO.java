package dao;

import java.util.ArrayList;

import bean.FatturaBean;

public interface FatturaDAO {

	public void addFattura(FatturaBean fb);

	public void removeFattura(FatturaBean fb);

	public void updateFattura(FatturaBean oldfb, FatturaBean newfb);

	public ArrayList<FatturaBean> getAllFattura();
}
