package dao;

import java.util.ArrayList;

import bean.BonificoBean;

public interface BonificoDAO {
	public void addBonifico(BonificoBean cb);
	public void removeBonifico(BonificoBean cb);
	public void updateBonifico(BonificoBean oldBonifico,BonificoBean newBonifico);
	public ArrayList<BonificoBean> getAllBonifici();
}
