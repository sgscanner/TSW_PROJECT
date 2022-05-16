package bean;

public class ProvinciaBean {
	private String idProvincia,nomeProvincia;
	
	public ProvinciaBean() {
		// TODO Auto-generated constructor stub
	}

	public ProvinciaBean(String idProvincia,String nomeProvincia) {
		this.idProvincia=idProvincia;
		this.nomeProvincia=nomeProvincia;
	}
	
	public String getIdProvincia() {
		return idProvincia;
	}

	public void setIdProvincia(String idProvincia) {
		this.idProvincia = idProvincia;
	}

	public String getNomeProvincia() {
		return nomeProvincia;
	}

	public void setNomeProvincia(String nomeProvincia) {
		this.nomeProvincia = nomeProvincia;
	}

}
