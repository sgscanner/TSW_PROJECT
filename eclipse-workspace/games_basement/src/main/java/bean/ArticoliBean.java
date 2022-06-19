package bean;


public class ArticoliBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String nome,descrizione,codiceA,tipologia;
	private long codiceC;
	private double prezzo;
	private boolean offerta;
	private int quantit�;
	
	public ArticoliBean(){ }

	public ArticoliBean(String codiceA ,long  codiceC,String descrizione,double prezzo,String nome,
			           String tipologia,boolean offerta,int quantit�) {
		this.codiceA=codiceA;
		this.codiceC=codiceC;
		this.descrizione=descrizione;
		this.prezzo=prezzo;
		this.descrizione=descrizione;
		this.nome=nome;
		this.tipologia=tipologia;
		this.offerta=offerta;
		this.quantit�=quantit�;
	}


	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}


	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}


	/**
	 * @return the descrizione
	 */
	public String getDescrizione() {
		return descrizione;
	}


	/**
	 * @param descrizione the descrizione to set
	 */
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	/**
	 * @return the codiceA
	 */
	public String getCodiceA() {
		return codiceA;
	}


	/**
	 * @param codiceA the codiceA to set
	 */
	public void setCodiceA(String codiceA) {
		this.codiceA = codiceA;
	}


	/**
	 * @return the tipologia
	 */
	public String getTipologia() {
		return tipologia;
	}


	/**
	 * @param tipologia the tipologia to set
	 */
	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}


	/**
	 * @return the codiceC
	 */
	public long getCodiceC() {
		return codiceC;
	}


	/**
	 * @param codiceC the codiceC to set
	 */
	public void setCodiceC(long codiceC) {
		this.codiceC = codiceC;
	}


	/**
	 * @return the prezzo
	 */
	public double getPrezzo() {
		return prezzo;
	}


	/**
	 * @param prezzo the prezzo to set
	 */
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}


	/**
	 * @return the offerta
	 */
	public boolean isOfferta() {
		return offerta;
	}


	/**
	 * @param offerta the offerta to set
	 */
	public void setOfferta(boolean offerta) {
		this.offerta = offerta;
	}

	public int getQuantit�() {
		return quantit�;
	}

	public void setQuantit�(int quantit�) {
		this.quantit� = quantit�;
	}

	@Override
	public String toString() {
		return "ArticoliBean [nome=" + nome + ", descrizione=" + descrizione + ", codiceA="
				+ codiceA + ", tipologia=" + tipologia + ", codiceC=" + codiceC + ", prezzo=" + prezzo + ", offerta="
				+ offerta + "]";
	}
}
