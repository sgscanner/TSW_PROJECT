package bean;

public class CompongonoBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8327016825696622708L;
	private String codiceArticoli,numOrdine;
	private int quantità;
	private double prezzo_storico;
	
	public CompongonoBean() {
		// TODO Auto-generated constructor stub
	}

	public CompongonoBean(String codiceArticoli,String numOrdine,int quantità,double prezzo_storico) {
		this.codiceArticoli=codiceArticoli;
		this.numOrdine=numOrdine;
		this.quantità=quantità;
		this.prezzo_storico=prezzo_storico;
	}

	public String getCodiceArticoli() {
		return codiceArticoli;
	}


	public void setCodiceArticoli(String codiceArticoli) {
		this.codiceArticoli = codiceArticoli;
	}


	public String getNumOrdine() {
		return numOrdine;
	}


	public void setNumOrdine(String numOrdine) {
		this.numOrdine = numOrdine;
	}


	public int getQuantità() {
		return quantità;
	}


	public void setQuantità(int quantità) {
		this.quantità = quantità;
	}

	public double getPrezzo_storico() {
		return prezzo_storico;
	}

	public void setPrezzo_storico(double prezzo_storico) {
		this.prezzo_storico = prezzo_storico;
	}

	@Override
	public String toString() {
		return "CompongonoBean [codiceArticoli=" + codiceArticoli + ", numOrdine=" + numOrdine + ", quantità="
				+ quantità + "]";
	}

}
