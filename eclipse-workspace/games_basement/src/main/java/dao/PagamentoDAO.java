package dao;

import java.util.ArrayList;

import bean.PagamentoBean;

public interface PagamentoDAO {

	public void addPagamento(PagamentoBean pb);

	public void removePagamento(PagamentoBean pb);

	public void updatePagamento(PagamentoBean oldpb, PagamentoBean newpb);

	public ArrayList<PagamentoBean> getAllPagamento();

}
