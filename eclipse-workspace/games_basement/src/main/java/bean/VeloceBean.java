package bean;

import java.sql.Date;

public class VeloceBean {
	private int idSpedizione;
	private String numOrdine;
	private Date dataOrdine;
	private double totale;

	public VeloceBean() {
		// TODO Auto-generated constructor stub
	}

	public VeloceBean(int idSpedizione,String numOrdine,Date dataOrdine,double totale) {
		this.idSpedizione=idSpedizione;
		this.numOrdine=numOrdine;
		this.dataOrdine=dataOrdine;
		this.totale=totale;
	}
	
	public int getIdSpedizione() {
		return idSpedizione;
	}

	public void setIdSpedizione(int idSpedizione) {
		this.idSpedizione = idSpedizione;
	}

	public String getNumOrdine() {
		return numOrdine;
	}

	public void setNumOrdine(String numOrdine) {
		this.numOrdine = numOrdine;
	}

	public Date getDataOrdine() {
		return dataOrdine;
	}

	public void setDataOrdine(Date dataOrdine) {
		this.dataOrdine = dataOrdine;
	}

	public double getTotale() {
		return totale;
	}

	public void setTotale(float totale) {
		this.totale = totale;
	}
}
