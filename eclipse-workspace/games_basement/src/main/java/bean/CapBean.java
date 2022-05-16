package bean;

public class CapBean {
	private int idCap;
	private String idCittà,idProvincia;
	
	public CapBean() {}

	public CapBean(int idCap,String idCittà,String idProvincia) {
		this.idCap=idCap;
		this.idCittà=idCittà;
		this.idProvincia=idProvincia;
	}
	
	public int getIdCap() {
		return idCap;
	}


	public void setIdCap(int idCap) {
		this.idCap = idCap;
	}


	public String getIdCittà() {
		return idCittà;
	}


	public void setIdCittà(String idCittà) {
		this.idCittà = idCittà;
	}


	public String getIdProvincia() {
		return idProvincia;
	}


	public void setIdProvincia(String idProvincia) {
		this.idProvincia = idProvincia;
	}
	
	
}
