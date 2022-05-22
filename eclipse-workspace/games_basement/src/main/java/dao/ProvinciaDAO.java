package dao;

import java.util.ArrayList;

import bean.ProvinciaBean;

public interface ProvinciaDAO {

	public void addProvincia(ProvinciaBean pb);

	public void removeProvincia(ProvinciaBean pb);

	public void updateProvincia(ProvinciaBean oldpb, ProvinciaBean newpb);

	public ArrayList<ProvinciaBean> getAllProvincia();

}
