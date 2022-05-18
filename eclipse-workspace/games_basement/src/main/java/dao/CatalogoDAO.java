package dao;

import java.util.ArrayList;

import bean.CatalogoBean;

public interface CatalogoDAO {
	public ArrayList<CatalogoBean> catalogo=new ArrayList<CatalogoBean>();
	
	public void addCatalogo(CatalogoBean cb);
	public void removeCatalogo(CatalogoBean cb);
	public void updateCatalogo(CatalogoBean oldCatalogo,CatalogoBean newCatalogo);
	public ArrayList<CatalogoBean> getAllCatalogo();
}
