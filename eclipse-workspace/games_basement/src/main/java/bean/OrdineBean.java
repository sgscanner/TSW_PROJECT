package bean;

public class OrdineBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5447490824210428305L;
	private String numOrdine,idUtente;
	private double totale;
	private int numProdotti;
	
	public OrdineBean() {}	
	
	public OrdineBean(String numOrdine,String idUtente,double totale,int numProdotti) {
		this.numOrdine=numOrdine;
		this.idUtente=idUtente;
		this.totale=totale;
		this.numProdotti=numProdotti;
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
	
	public int getNumProdotti() {
		return numProdotti;
	}
	public void setNumProdotti(int numProdotti) {
		this.numProdotti = numProdotti;
	}
	
	public double getTotale() {
		return totale;
	}
	public void setTotale(double totale) {
		this.totale = totale;
	}

	@Override
	public String toString() {
		return "OrdineBean [numOrdine=" + numOrdine + ", idUtente=" + idUtente + ", totale=" + totale + ", numProdotti="
				+ numProdotti + "]";
	}
	
	
}
