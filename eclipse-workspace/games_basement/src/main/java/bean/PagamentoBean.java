package bean;

public class PagamentoBean {
	private int idPagamento;
	private String numOrdine;
	private float importoPagamento;
	
	
	public PagamentoBean() {
		// TODO Auto-generated constructor stub
	}

	public PagamentoBean(int idPagamento,String numOrdine,float importoPagamento) {
		this.idPagamento=idPagamento;
		this.numOrdine=numOrdine;
		this.importoPagamento=importoPagamento;
	}
	
	public int getIdPagamento() {
		return idPagamento;
	}


	public void setIdPagamento(int idPagamento) {
		this.idPagamento = idPagamento;
	}


	public String getNumOrdine() {
		return numOrdine;
	}


	public void setNumOrdine(String numOrdine) {
		this.numOrdine = numOrdine;
	}


	public float getImportoPagamento() {
		return importoPagamento;
	}


	public void setImportoPagamento(float importoPagamento) {
		this.importoPagamento = importoPagamento;
	}

	
	
}
