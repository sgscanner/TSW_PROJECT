package control;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bean.ArticoliBean;
import implementation.ArticoliImpl;

/**
 * Servlet implementation class Product
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type=request.getParameter("tipo");
		String name=request.getParameter("nome_articolo"),codiceA=request.getParameter("codice_articolo"),codiceC=request.getParameter("catalogo"),descrizione=request.getParameter("descrizione"),prezzo=request.getParameter("prezzo")
			  ,tipologia=request.getParameter("tipologia"),nome=request.getParameter("nome"),quantità=request.getParameter("quantita");
		ArticoliImpl ai=new ArticoliImpl();
		ArticoliBean ab=new ArticoliBean(codiceA,Long.parseLong(codiceC),descrizione,Double.parseDouble(prezzo),nome,tipologia,false,Integer.parseInt(quantità));

		if(type.equals("add")) {
			String savePath="/games_basement/src/main/webapp/prodottiImg"+File.separator+name;
			File saveDir=new File(savePath);

			if(!saveDir.exists()) {
				saveDir.mkdir();
			}

			ai.addArticolo(ab);

			for(Part p:request.getParts()) {
				String filename=extractFileName(p);
				if(filename!=null && !filename.equals("")) {
					p.write(savePath+File.separator+filename);
					System.out.println(savePath+File.separator+filename);
				}
			}
		}else if(type.equals("update")) {
			ai.updateArticolo(ai.searchByCode(codiceA), ab);
		}else if(type.equals("remove")) {
			ai.removeArticolo(ab);
		}

		ai.stopConnection();
		request.getRequestDispatcher("").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private String extractFileName(Part part) {
		String contentDisp=part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for(String s:items) {
			if(s.startsWith("filename")) {
				return s.substring(s.indexOf("=")+2,s.length()-1);
			}
		}
		return "";
	}

}
