package control;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import bean.UserBean;
import implementation.UserImpl;

/**
 * Servlet implementation class AjaxPwd
 */
@WebServlet("/AjaxPwd")
public class AjaxPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("param");
		
		if(request.getParameter("param2").equals("")) {
			JSONObject json=new JSONObject();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			try {
				json.put("passwordInfo","Inserisci password");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.getWriter().print(json);
		}else {
			String pwd=encryptPwd(request.getParameter("param2"));
			JSONObject json=new JSONObject();
			UserImpl ui=new UserImpl();
			
			try {
				json.put("passwordInfo",checkPwd(ui, username,pwd));
			}catch(JSONException e) {
				
			}
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(json);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private String checkPwd(UserImpl ui,String username,String pwd) {
		UserBean ub=ui.searchUser(username);
		
		if(!ub.getPassword().equals(pwd)) {
			return "Password errata";
		}else {
			return null;
		}
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
