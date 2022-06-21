package bean;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;

public class FatturaBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6288161538612218929L;
	private int idFattura,idPagamento;
	private LocalDate data;
	
	public FatturaBean() {
		// TODO Auto-generated constructor stub
	}

	public FatturaBean(int idFattura,int idPagamento,LocalDate localDate) {
		this.idFattura=idFattura;
		this.idPagamento=idPagamento;
		this.data=localDate;
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

	public LocalDate getData() {
		return data;
	}

	public void setData(LocalDate data) {
		this.data = data;
	}

}
