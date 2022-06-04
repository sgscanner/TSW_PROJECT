package control;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

import bean.UserBean;
import implementation.UserImpl;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		String uName=request.getParameter("username"),password=request.getParameter("password"),encrypted=encryptPwd(password);
		UserImpl ui=new UserImpl();
		UserBean ub=ui.searchUser(uName);
		
		if(ub==null) {
			RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}else {
			if(request.getParameter("password").isEmpty() || request.getParameter("username").isEmpty() ) {
				RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
			}
			if(ub.getPassword().equals(encrypted)) {
				// pass the request along the filter chain
				chain.doFilter(request, response);
			}else if(!ub.getPassword().equals(encrypted)) {
				RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	private String encryptPwd(String toEncrypt) {
		String generatedPassword=null;
		String salt="gameshop";
		
		if(toEncrypt.isEmpty()) {
			return "inserire password";
		}
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
