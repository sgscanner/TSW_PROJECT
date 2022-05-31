package control;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CittàBean;
import bean.DatiAnagraficiBean;
import implementation.CittàImpl;
import implementation.DatiAnagrificiImpl;
/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String driver="jdbc:mysql://localhost:3306/gameshop";
	private static String uname="gameshop",pass="password";
	 
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uName=request.getParameter("username"),password=request.getParameter("password"),cap=request.getParameter("cap"),indirizzo=request.getParameter("indirizzo"),
				date=request.getParameter("bday"),nome=request.getParameter("nome"),cognome=request.getParameter("surname"),telefono=request.getParameter("phoneNumber"),
				email=request.getParameter("email"),città=request.getParameter("città");	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		long l;
		Date d1;
		try {
			//converto in formato Data la stringa presa dal parametro "bDay"
			l = sdf.parse(date).getTime();
			d1=new Date(l);
			
			//istanzio le implementazioni dei DAO
			DatiAnagrificiImpl dai=new DatiAnagrificiImpl();
			CittàImpl ci=new CittàImpl();
			
			//istanzio i Bean
			DatiAnagraficiBean dab=new DatiAnagraficiBean(uName,cap,nome,cognome,telefono,d1);
			CittàBean cb=new CittàBean(cap,città);
			
			//aggiuta al db dei Bean
			ci.addCittà(cb);
			dai.addDatiAnagrafici(dab);
			
			//rilascio connessioni
			ci.stopConnection();
			dai.stopConnection();
			
			//redirect alla homepage
			response.sendRedirect("HomePage.jsp");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
