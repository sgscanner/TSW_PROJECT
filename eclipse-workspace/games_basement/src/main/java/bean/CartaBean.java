package bean;

import java.io.Serializable;

public class CartaBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String numeroCarta,datiIntestario;
	private int idPagamento;
	
	public CartaBean() {
		// TODO Auto-generated constructor stub
	}

	public CartaBean(String numeroCarta,String datiIntestatario,int idPagamento) {
		this.numeroCarta=numeroCarta;
		this.datiIntestario=datiIntestatario;
		this.idPagamento=idPagamento;
	}
	
	public String getNumeroCarta() {
		return numeroCarta;
	}

	public void setNumeroCarta(String numeroCarta) {
		this.numeroCarta = numeroCarta;
	}

	public String getDatiIntestario() {
		return datiIntestario;
	}

	public void setDatiIntestario(String datiIntestario) {
		this.datiIntestario = datiIntestario;
	}

	public int getIdPagamento() {
		return idPagamento;
	}

	public void setIdPagamento(int idPagamento) {
		this.idPagamento = idPagamento;
	}

}
