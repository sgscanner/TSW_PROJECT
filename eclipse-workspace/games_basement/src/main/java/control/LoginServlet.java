package control;

import java.io.IOException;
import java.security.GeneralSecurityException;

import javax.crypto.spec.SecretKeySpec;
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
	@SuppressWarnings("unused")
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uName=request.getParameter("username"),password=request.getParameter("password");
		UserImpl ui=new UserImpl();
		UserBean ub=ui.searchUser(uName);
		
		if(ub==null) {
			RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}else {
			if(ub.getUsername().equals(password)) {
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
		ui.stopConnection();
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
