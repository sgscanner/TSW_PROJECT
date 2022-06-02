package dao;

import java.util.ArrayList;

import bean.CartaBean;

public interface CartaDAO {
	public void addCarta(CartaBean cb);
	public void removeCarta(CartaBean cb);
	public void updateCarta(CartaBean oldCarta,CartaBean newCarta);
	public ArrayList<CartaBean> getAllBonificiCarte();
}
