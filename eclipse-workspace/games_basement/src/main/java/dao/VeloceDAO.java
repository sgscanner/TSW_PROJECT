package dao;

import java.util.ArrayList;

import bean.VeloceBean;

public interface VeloceDAO {

	public void addVeloce(VeloceBean vb);

	public void removeVeloce(VeloceBean vb);

	public void updateVeloce(VeloceBean oldvb, VeloceBean newvb);

	public ArrayList<VeloceBean> getAllVeloce();

}
