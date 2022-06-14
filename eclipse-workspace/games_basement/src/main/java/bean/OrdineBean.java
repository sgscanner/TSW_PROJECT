package bean;

import java.sql.Date;

public class OrdineBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5447490824210428305L;
	private String numOrdine,idUtente;
	private double totale;
	private Date data_ordine;
	
	public OrdineBean() {}	
	
	public OrdineBean(String numOrdine,String idUtente,double totale,Date data_ordine) {
		this.numOrdine=numOrdine;
		this.idUtente=idUtente;
		this.totale=totale;
		this.data_ordine=data_ordine;
	}
	
	public String getNumOrdine() {
		return numOrdine;
	}
	public void setNumOrdine(String numOrdine) {
		this.numOrdine = numOrdine;
	}
	
	public String getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(String idUtente) {
		this.idUtente = idUtente;
	}

	public double getTotale() {
		return totale;
	}
	public void setTotale(double totale) {
		this.totale = totale;
	}

	public Date getData_ordine() {
		return data_ordine;
	}

	public void setData_ordine(Date data_ordine) {
		this.data_ordine = data_ordine;
	}

	@Override
	public String toString() {
		return "OrdineBean [numOrdine=" + numOrdine + ", idUtente=" + idUtente + ", totale=" + totale + ", numProdotti="
				+ "]";
	}
	
	
}
