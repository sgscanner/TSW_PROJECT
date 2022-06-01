package bean;

public class CittàBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4901391385007109896L;
	private String idCittà,nomeCittà,cap;
	
	
	public CittàBean() {
		// TODO Auto-generated constructor stub
	}

	public CittàBean(String idCittà,String nomeCittà) {
		this.idCittà=idCittà;
		this.nomeCittà=nomeCittà;
	}
	
	
	public String getIdCittà() {
		return idCittà;
	}


	public void setIdCittà(String idCittà) {
		this.idCittà = idCittà;
	}


	public String getNomeCittà() {
		return nomeCittà;
	}


	public void setNomeCittà(String nomeCittà) {
		this.nomeCittà = nomeCittà;
	}

	public String getCap() {
		return cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	@Override
	public String toString() {
		return "CittàBean [idCittà=" + idCittà + ", nomeCittà=" + nomeCittà + ", cap=" + cap + "]";
	}

}
