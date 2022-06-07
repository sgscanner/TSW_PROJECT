package control;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Base64;

import bean.DatiAnagraficiBean;
import bean.UserBean;
import implementation.DatiAnagrificiImpl;
import implementation.UserImpl;
/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
		String uName=request.getParameter("username"),password=request.getParameter("password"),cap=request.getParameter("cap"),
				date=request.getParameter("bday"),nome=request.getParameter("nome"),cognome=request.getParameter("cognome"),telefono=request.getParameter("phone"),
				email=request.getParameter("email"),città=request.getParameter("citta");	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		long l;
		Date d1;
		try {
			//istanzio il dispatcher per reindirizzare alla homepage e la sessione attuale a cui aggiungo il bean dell'utente
			RequestDispatcher rd=request.getRequestDispatcher("HomePage.jsp");
			HttpSession newSession=request.getSession();
			
			//converto in formato Data la stringa presa dal parametro "bDay"
			l = sdf.parse(date).getTime();
			d1=new Date(l);
			
			//istanzio le implementazioni dei DAO
			DatiAnagrificiImpl dai=new DatiAnagrificiImpl();
			UserImpl ui=new UserImpl();
			
			//istanzio i Bean
			DatiAnagraficiBean dab=new DatiAnagraficiBean(uName,cap,nome,cognome,telefono,d1,città);
			UserBean ub=new UserBean(uName,email,encryptPwd(password),"normale");
			
			//aggiuta al db dei Bean
			ui.addUser(ub);
			ui.stopConnection();
			
			dai.addDatiAnagrafici(dab);
			dai.stopConnection();
			
			
			//aggiunta dell'user bean alla sessione
			newSession.setAttribute("user", ub);
			newSession.setMaxInactiveInterval(15*60);
			
			//redirect alla homepage
			rd.forward(request, response);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//metodi utils
	private String encryptPwd(String toEncrypt) {
		String generatedPassword=null;
		String salt="gameshop";
		
		try {
			MessageDigest md=MessageDigest.getInstance("SHA-1");
			md.update(salt.getBytes(StandardCharsets.UTF_8));
			byte[] bytes=md.digest(toEncrypt.getBytes(StandardCharsets.UTF_8));
			StringBuilder sb=new StringBuilder();
			for(int i=0;i<bytes.length;i++) {
				sb.append(Integer.toString((bytes[i] & 0xff)+0x100,16).substring(1));
			}
			generatedPassword=sb.toString();
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return generatedPassword;
	}
	
}
