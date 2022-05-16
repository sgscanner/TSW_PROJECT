package bean;

public class RubricaIndirizziBean {
	private int idIndirizzo;
	private String idUtente,idCittà,indirizzo;
	
	
	public RubricaIndirizziBean() {
		// TODO Auto-generated constructor stub
	}

	public RubricaIndirizziBean(int idIndirizzo,String idUtente,String idCittà,String indirizzo) {
		this.idIndirizzo=idIndirizzo;
		this.idUtente=idUtente;
		this.idCittà=idCittà;
		this.indirizzo=indirizzo;
	}
	
	public int getIdIndirizzo() {
		return idIndirizzo;
	}


	public void setIdIndirizzo(int idIndirizzo) {
		this.idIndirizzo = idIndirizzo;
	}


	public String getIdUtente() {
		return idUtente;
	}


	public void setIdUtente(String idUtente) {
		this.idUtente = idUtente;
	}


	public String getIdCittà() {
		return idCittà;
	}


	public void setIdCittà(String idCittà) {
		this.idCittà = idCittà;
	}


	public String getIndirizzo() {
		return indirizzo;
	}


	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	
	
}
