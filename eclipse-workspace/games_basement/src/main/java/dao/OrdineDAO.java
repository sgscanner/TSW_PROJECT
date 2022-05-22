package dao;

import java.util.ArrayList;

import bean.OrdineBean;

public interface OrdineDAO {

	public void addOrdine(OrdineBean ob);

	public void removeOrdine(OrdineBean ob);

	public void updateOrdine(OrdineBean oldob, OrdineBean newob);

	public ArrayList<OrdineBean> getAllOrdine();

}
