package bean;

import java.sql.Date;

public class DatiAnagraficiBean {
	private String idUtente,idCittà,nome,cognome,telefono;
	private Date dataNascita;
	
	public DatiAnagraficiBean() {}

	public DatiAnagraficiBean(String idUtente,String idCittà,String nome,String cognome,
							 String telefono,Date dataNascita){
		
		this.idUtente=idUtente;
		this.idCittà=idCittà;
		this.nome=nome;
		this.cognome=cognome;
		this.telefono=telefono;
		this.dataNascita=dataNascita;
		
	}
	
	public Date getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
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

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}
