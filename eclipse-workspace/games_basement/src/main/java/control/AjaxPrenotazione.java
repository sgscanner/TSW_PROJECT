package control;

import java.io.IOException;
import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import bean.ArticoliBean;
import implementation.ArticoliImpl;
import implementation.Connessione;

/**
 * Servlet implementation class AjaxPrenotazione
 */
@WebServlet("/AjaxPrenotazione")
public class AjaxPrenotazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPrenotazione() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String codiceA=request.getParameter("param");
		String username=request.getParameter("param2");
		String result="";
		JSONObject jObject=new JSONObject();
		Connessione connessione=new Connessione();
		Connection c=connessione.setConnection();
		ArticoliImpl ai=new ArticoliImpl();
		Date d=new Date();
		java.sql.Date dateSql=new java.sql.Date(d.getTime());
		
		try {
			Statement compongono=c.createStatement(),ordine=c.createStatement();
			ArticoliBean ab=ai.searchByCode(codiceA);
			String codice=getRandomString(15)+"prenotato";
			ordine.executeUpdate("insert into Ordine values('"+codice+"','"+username+"','"+ab.getPrezzo()+"','"+dateSql+"')");
			compongono.executeUpdate("insert into Compongono values('"+codiceA+"','0','"+ab.getPrezzo()+"','"+codice+"')");
			result="prenotazione effettuata.";
			connessione.releaseConnection(c);
		}catch(SQLException e) {
			result="prenotazione non effettuata,riprovare.";
		}

		jObject.put("prenotazioneInfo",result);
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
	
	private String getRandomString(int i) {
		 byte[] bytearray;
	        String mystring;
	        StringBuffer thebuffer;
	        
	        bytearray = new byte[256]; 
	        new Random().nextBytes(bytearray); 

	        mystring 
	            = new String(bytearray, Charset.forName("UTF-8")); 

	        // Create the StringBuffer
	        thebuffer = new StringBuffer(); 

	        for (int m = 0; m < mystring.length(); m++) { 

	            char n = mystring.charAt(m); 

	            if (((n >= 'A' && n <= 'Z') 
	                || (n >= '0' && n <= '9')) 
	                && (i > 0)) { 

	                thebuffer.append(n); 
	                i--; 
	            } 
	        } 

	        // resulting string 
	        return thebuffer.toString(); 
	}
}
