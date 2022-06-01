package bean;

public class CatalogoBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5760035616062834670L;
	private int codiceCatalogo;
	
	public CatalogoBean() {}

	public CatalogoBean(int codiceCatalogo) {
		this.codiceCatalogo=codiceCatalogo;
	}
	
	public int getCodiceCatalogo() {
		return codiceCatalogo;
	}

	public void setCodiceCatalogo(int codiceCatalogo) {
		this.codiceCatalogo = codiceCatalogo;
	}

	@Override
	public String toString() {
		return "CatalogoBean [codiceCatalogo=" + codiceCatalogo + "]";
	}

	
	
}
