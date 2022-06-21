package bean;

public class RecensioneBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6200178024799958170L;
	private int numeroStelle;
	private String codiceArticolo,idUtente,titolo,descrizione;
	
	public RecensioneBean() {
		// TODO Auto-generated constructor stub
	}

	public RecensioneBean(int numeroStelle,String codiceArticolo,String idUtente,String titolo,String descrizione) {
		this.numeroStelle=numeroStelle;
		this.codiceArticolo=codiceArticolo;
		this.idUtente=idUtente;
		this.titolo=titolo;
		this.descrizione=descrizione;
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

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	@Override
	public String toString() {
		return "RecensioneBean [numeroStelle=" + numeroStelle + ", codiceArticolo=" + codiceArticolo + ", idUtente="
				+ idUtente + "]";
	}

}
