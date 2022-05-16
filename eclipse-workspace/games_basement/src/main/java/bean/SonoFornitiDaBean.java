package bean;

public class SonoFornitiDaBean {
	private String codiceArticoli,iva;
	
	public SonoFornitiDaBean() {
		// TODO Auto-generated constructor stub
	}

	public SonoFornitiDaBean(String codiceArticoli,String iva) {
		this.codiceArticoli=codiceArticoli;
		this.iva=iva;
	}
	
	public String getCodiceArticoli() {
		return codiceArticoli;
	}

	public void setCodiceArticoli(String codiceArticoli) {
		this.codiceArticoli = codiceArticoli;
	}

	public String getIva() {
		return iva;
	}

	public void setIva(String iva) {
		this.iva = iva;
	}

}
