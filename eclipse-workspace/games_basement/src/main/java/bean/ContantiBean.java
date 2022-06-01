package bean;

public class ContantiBean implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2548065902746541671L;
	private int idPagamento;
	
	public ContantiBean() {
		// TODO Auto-generated constructor stub
	}

	public ContantiBean(int idPagamento) {
		this.idPagamento=idPagamento;
	}
	
	public int getIdPagamento() {
		return idPagamento;
	}

	public void setIdPagamento(int idPagamento) {
		this.idPagamento = idPagamento;
	}

	@Override
	public String toString() {
		return "ContantiBean [idPagamento=" + idPagamento + "]";
	}

}
