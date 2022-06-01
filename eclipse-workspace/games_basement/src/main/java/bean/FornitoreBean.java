package bean;

public class FornitoreBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1943829324313237331L;
	private String iva,nome,indirizzo;
	
	public FornitoreBean() {}

	public FornitoreBean(String iva,String nome,String indirizzo) {
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
	}

	@Override
	public String toString() {
		return "FornitoreBean [iva=" + iva + ", nome=" + nome + ", indirizzo=" + indirizzo + "]";
	};
}
