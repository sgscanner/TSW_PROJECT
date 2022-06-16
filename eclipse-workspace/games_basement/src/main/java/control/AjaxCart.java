package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import implementation.ArticoliImpl;
import implementation.CompongonoImpl;

/**
 * Servlet implementation class AjaxCart
 */
@WebServlet("/AjaxCart")
public class AjaxCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String codiceA=request.getParameter("param");  
		String quantità=request.getParameter("param2");
		CompongonoImpl ci=new CompongonoImpl();
		JSONObject result=new JSONObject();
		ArticoliImpl ai=new ArticoliImpl();
		
		if(ci.addToCart(ai.searchByCode(codiceA),Integer.parseInt(quantità))>0) {
			try {
				result.put("insertInfo","prodotto aggiunto");
				
				request.getSession().setAttribute("carrello", ci.searchCart());
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				result.put("insertInfo","errore nel database");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		ci.stopConnection();
		ai.stopConnection();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
