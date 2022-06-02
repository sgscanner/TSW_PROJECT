package dao;

import java.util.ArrayList;

import bean.FatturaBean;

public interface FatturaDAO {
	public void addFattura(FatturaBean cb);
	public void removeFattura(FatturaBean cb);
	public void updateFattura(FatturaBean oldFattura,FatturaBean newFattura);
	public ArrayList<FatturaBean> getAllFatture();
}
