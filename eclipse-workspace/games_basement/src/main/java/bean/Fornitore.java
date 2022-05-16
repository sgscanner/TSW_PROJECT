package bean;

public class Fornitore {
	private String iva,nome,indirizzo;
	
	public Fornitore() {}

	public Fornitore(String iva,String nome,String indirizzo) {
		this.iva=iva;
		this.nome=nome;
		this.indirizzo=indirizzo;
	}
	
	public String getIva() {
		return iva;
	}

	public void setIva(String iva) {
		this.iva = iva;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	};
}
