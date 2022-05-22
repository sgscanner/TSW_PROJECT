package bean;

public class PagamentoBean {
	private int idPagamento;
	private String numOrdine;
	private double importoPagamento;
	
	
	public PagamentoBean() {
		// TODO Auto-generated constructor stub
	}

	public PagamentoBean(int idPagamento,String numOrdine,double importoPagamento) {
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


	public double getImportoPagamento() {
		return importoPagamento;
	}


	public void setImportoPagamento(double importoPagamento) {
		this.importoPagamento = importoPagamento;
	}

	
	
}
