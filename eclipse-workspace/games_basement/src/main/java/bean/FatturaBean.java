package bean;

import java.io.Serializable;
import java.sql.Date;

public class FatturaBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6288161538612218929L;
	private int idFattura,idPagamento;
	private Date data;
	
	public FatturaBean() {
		// TODO Auto-generated constructor stub
	}

	public FatturaBean(int idFattura,int idPagamento,Date data) {
		this.idFattura=idFattura;
		this.idPagamento=idPagamento;
		this.data=data;
	}
	
	public int getIdFattura() {
		return idFattura;
	}

	public void setIdFattura(int idFattura) {
		this.idFattura = idFattura;
	}

	public int getIdPagamento() {
		return idPagamento;
	}

	public void setIdPagamento(int idPagamento) {
		this.idPagamento = idPagamento;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

}
