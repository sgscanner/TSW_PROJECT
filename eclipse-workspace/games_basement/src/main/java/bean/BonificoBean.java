package bean;

import java.io.Serializable;

public class BonificoBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String iban,causale,datiIntestario;
	private int idPagamento;
	
	public BonificoBean() {
		// TODO Auto-generated constructor stub
	}

	public BonificoBean(String iban,String causale,String datiIntestario,int idPagamento) {
		this.iban=iban;
		this.causale=causale;
		this.datiIntestario=datiIntestario;
		this.idPagamento=idPagamento;
	}
	
	public String getIban() {
		return iban;
	}

	public void setIban(String iban) {
		this.iban = iban;
	}

	public String getCausale() {
		return causale;
	}

	public void setCausale(String causale) {
		this.causale = causale;
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
