package bean;

public class RecensioneBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6200178024799958170L;
	private int numeroStelle;
	private String codiceArticolo,idUtente;
	
	public RecensioneBean() {
		// TODO Auto-generated constructor stub
	}

	public RecensioneBean(int numeroStelle,String codiceArticolo,String idUtente) {
		this.numeroStelle=numeroStelle;
		this.codiceArticolo=codiceArticolo;
		this.idUtente=idUtente;
	}
	
	public int getNumeroStelle() {
		return numeroStelle;
	}

	public void setNumeroStelle(int numeroStelle) {
		this.numeroStelle = numeroStelle;
	}

	public String getCodiceArticolo() {
		return codiceArticolo;
	}

	public void setCodiceArticolo(String codiceArticolo) {
		this.codiceArticolo = codiceArticolo;
	}

	public String getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(String idUtente) {
		this.idUtente = idUtente;
	}

	@Override
	public String toString() {
		return "RecensioneBean [numeroStelle=" + numeroStelle + ", codiceArticolo=" + codiceArticolo + ", idUtente="
				+ idUtente + "]";
	}

}
