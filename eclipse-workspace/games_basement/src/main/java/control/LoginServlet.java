package control;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean;
import implementation.UserImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uName=request.getParameter("username"),password=request.getParameter("password"),encrypted=encryptPwd(password);
		UserImpl ui=new UserImpl();
		UserBean ub=ui.searchUser(uName);
		
		if(ub==null) {
			RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}else {
			if(ub.getPassword().equals(encrypted)) {
				HttpSession newSession=request.getSession();
				RequestDispatcher rd=request.getRequestDispatcher("HomePage.jsp");
				newSession.setAttribute("user", ub);
				newSession.setMaxInactiveInterval(15*60); //15 minuti di inattività
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

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
