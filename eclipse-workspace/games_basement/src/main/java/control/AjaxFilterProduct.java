package control;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.google.gson.Gson;

import bean.OrdineBean;
import implementation.ArticoliImpl;

/**
 * Servlet implementation class AjaxFilterProduct
 */
@WebServlet("/AjaxFilterProduct")
public class AjaxFilterProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFilterProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstDate=request.getParameter("param"),secondDate=request.getParameter("param2");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date from,to;
		
		try {
			from=new Date(sdf.parse(firstDate).getTime());
			to=new Date(sdf.parse(secondDate).getTime());
			ArticoliImpl ai=new ArticoliImpl();
			ArrayList<OrdineBean>list=ai.searchByDate(from, to);
			Gson gson=new Gson();
			JSONArray jArray= new JSONArray();
			
			for(OrdineBean o:list) {
				jArray.put(gson.toJson(o));
			}
			
			ai.stopConnection();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jArray);
			
		}catch(ParseException e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
