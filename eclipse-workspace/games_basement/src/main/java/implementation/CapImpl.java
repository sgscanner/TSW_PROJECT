package implementation;

import java.util.ArrayList;

import bean.CapBean;
import dao.CapDAO;

public class CapImpl implements CapDAO{
	private ArrayList<CapBean> al;
	
	public CapImpl(ArrayList<CapBean> al) {
		// TODO Auto-generated constructor stub
		this.al=al;
	}

	@Override
	public void addCap(CapBean cb) {
		// TODO Auto-generated method stub
		al.add(cb);
	}

	@Override
	public void removeCap(CapBean cb) {
		// TODO Auto-generated method stub
		al.remove(cb);
	}

	@Override
	public void updateCap(CapBean oldCap, CapBean newCap) {
		// TODO Auto-generated method stub
		al.set(al.indexOf(oldCap), newCap);
	}

	@Override
	public ArrayList<CapBean> getAllCap() {
		// TODO Auto-generated method stub
		return al;
	}

}
