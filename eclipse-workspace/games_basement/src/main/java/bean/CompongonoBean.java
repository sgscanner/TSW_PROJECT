package bean;

public class CompongonoBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8327016825696622708L;
	private String codiceArticoli,numOrdine;
	private int quantità;
	
	public CompongonoBean() {
		// TODO Auto-generated constructor stub
	}

	public CompongonoBean(String codiceArticoli,String numOrdine,int quantità) {
		this.codiceArticoli=codiceArticoli;
		this.numOrdine=numOrdine;
		this.quantità=quantità;
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

	@Override
	public String toString() {
		return "CompongonoBean [codiceArticoli=" + codiceArticoli + ", numOrdine=" + numOrdine + ", quantità="
				+ quantità + "]";
	}

}
