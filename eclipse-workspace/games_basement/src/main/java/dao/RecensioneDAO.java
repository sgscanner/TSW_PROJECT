package dao;

import java.util.ArrayList;

import bean.RecensioneBean;

public interface RecensioneDAO {
	public void addRecensione(RecensioneBean rb);
	public void removeRecensione(RecensioneBean rb);
	public void updateRecensione(RecensioneBean oldRecensione,RecensioneBean newRecensione);
	public ArrayList<RecensioneBean> getAllRecensione();		
}
