package bean;

public class CompongonoBean {
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

}
