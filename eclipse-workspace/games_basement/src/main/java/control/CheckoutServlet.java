package control;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ArticoliBean;
import bean.CompongonoBean;
import bean.FatturaBean;
import bean.OrdineBean;
import bean.PagamentoBean;
import bean.UserBean;
import implementation.ArticoliImpl;
import implementation.CompongonoImpl;
import implementation.OrdineImpl;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<CompongonoBean> cart=(ArrayList<CompongonoBean>)request.getSession().getAttribute("carrello");
		ArrayList<ArticoliBean> articoli=getArticoli(cart);
		OrdineImpl oi=new OrdineImpl();
		Random r=new Random(),r1=new Random();
		UserBean ub=(UserBean)request.getSession().getAttribute("user");
		OrdineBean ob=getOrdine(ub.getUsername());
		CompongonoImpl ci=new CompongonoImpl();
		int numPagamento=r.nextInt(1000),numFattura=r.nextInt(1000);
		double tot=getTotale(articoli);
		ci.completeOrder(ob, articoli, ub.getUsername(), tot);
		PagamentoBean pb=new PagamentoBean(numPagamento,oi.searchByUsername(ub.getUsername()).getNumOrdine(),tot);
		FatturaBean fb=new FatturaBean(numFattura,numPagamento,LocalDate.now());
		request.getRequestDispatcher("OrdineCompletato.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	//utils
	private OrdineBean getOrdine(String username) {
		OrdineImpl oi=new OrdineImpl();
		return oi.searchByUsername(username);
	}

	private double getTotale(ArrayList<ArticoliBean> al) {
		double temp=0.0;
	
		for(ArticoliBean ab: al) {
			temp+=ab.getPrezzo();
		}
		
		return temp;
	}
	
	private ArrayList<ArticoliBean> getArticoli(ArrayList<CompongonoBean> t){
		ArrayList<ArticoliBean> temp=new ArrayList<ArticoliBean>();
		ArticoliImpl ai=new ArticoliImpl();
		
		for(CompongonoBean cb:t) {
			temp.add(ai.searchByCode(cb.getCodiceArticoli()));
		}
		
		return temp;
	}
}
