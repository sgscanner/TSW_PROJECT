package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.RecensioneBean;
import implementation.RecensioneImpl;

/**
 * Servlet implementation class RecensioneServlet
 */
@WebServlet("/RecensioneServlet")
public class RecensioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecensioneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String titolo=request.getParameter("titolo"),numStelle=request.getParameter("stelle"),
				uName=request.getParameter("username"),codiceA=request.getParameter("articolo"),descrizione=request.getParameter("descrizione");
		RecensioneImpl ri=new RecensioneImpl();
		System.out.println("stelle "+numStelle);
		System.out.println("titolo "+titolo);
		System.out.println("codice Articolo "+codiceA);
		System.out.println("descrizione "+descrizione);
		ri.addRecensione(new RecensioneBean(Integer.parseInt(numStelle),codiceA,uName,titolo,descrizione));
		
		request.getRequestDispatcher("Prodotto.jsp?id="+codiceA).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
