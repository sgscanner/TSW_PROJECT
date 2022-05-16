package bean;

public class OrdineBean {
	private String numOrdine,idUtente;
	private float totale;
	private int numProdotti;
	
	public OrdineBean() {}	
	
	public OrdineBean(String numOrdine,String idUtente,float totale,int numProdotti) {
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
	
	public float getTotale() {
		return totale;
	}
	public void setTotale(float totale) {
		this.totale = totale;
	}
	
	
}
