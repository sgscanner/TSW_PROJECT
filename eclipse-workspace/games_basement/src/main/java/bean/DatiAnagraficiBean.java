package bean;

import java.sql.Date;

public class DatiAnagraficiBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2616074607621360633L;
	private String idUtente,cap,nome,cognome,telefono,citta;
	private Date dataNascita;
	
	public DatiAnagraficiBean() {}

	public DatiAnagraficiBean(String idUtente,String cap,String nome,String cognome,
							 String telefono,Date dataNascita,String citta){
		
		this.idUtente=idUtente;
		this.cap=cap;
		this.nome=nome;
		this.cognome=cognome;
		this.telefono=telefono;
		this.dataNascita=dataNascita;
		this.setCitta(citta);
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

	public String getcap() {
		return cap;
	}

	public void setcap(String cap) {
		this.cap = cap;
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

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	@Override
	public String toString() {
		return "DatiAnagraficiBean [idUtente=" + idUtente + ", cap=" + cap + ", nome=" + nome + ", cognome="
				+ cognome + ", telefono=" + telefono + ", dataNascita=" + dataNascita + "]";
	}
}
