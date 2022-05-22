package dao;

import java.util.ArrayList;

import bean.SonoFornitiDaBean;

public interface SonoFornitiDaDAO {

	public void addSonoFornitiDa(SonoFornitiDaBean sfdb);

	public void removeSonoFornitiDa(SonoFornitiDaBean sfdb);

	public void updateSonoFornitiDa(SonoFornitiDaBean oldsfdb, SonoFornitiDaBean newsfdb);

	public ArrayList<SonoFornitiDaBean> getAllSonoFornitiDa();
}
