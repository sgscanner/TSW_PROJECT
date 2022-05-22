package dao;

import java.util.ArrayList;

import bean.StandardBean;

public interface StandardDAO {

	public void addStandard(StandardBean sb);

	public void removeStandard(StandardBean sb);

	public void updateStandard(StandardBean oldsb, StandardBean newsb);

	public ArrayList<StandardBean> getAllStandard();

}
