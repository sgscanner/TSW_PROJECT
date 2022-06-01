package bean;

public class SonoFornitiDaBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3461369057012305821L;
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

	@Override
	public String toString() {
		return "SonoFornitiDaBean [codiceArticoli=" + codiceArticoli + ", iva=" + iva + "]";
	}

}
