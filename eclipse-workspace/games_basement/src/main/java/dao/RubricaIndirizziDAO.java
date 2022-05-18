package dao;

import java.util.ArrayList;

import bean.RubricaIndirizziBean;

public interface RubricaIndirizziDAO {
	public ArrayList<RubricaIndirizziBean> RubricaIndirizzi = new ArrayList<RubricaIndirizziBean>();

	public void addRubricaIndirizzi(RubricaIndirizziBean rib);

	public void removeRubricaIndirizzi(RubricaIndirizziBean rib);

	public void updateRubricaIndirizzi(RubricaIndirizziBean oldrib, RubricaIndirizziBean newrib);

	public ArrayList<RubricaIndirizziBean> getAllRubricaIndirizzi();

}
