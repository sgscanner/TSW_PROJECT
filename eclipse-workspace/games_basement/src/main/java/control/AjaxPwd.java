package control;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.spec.SecretKeySpec;
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
	@Override
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
			JSONObject json=new JSONObject();
			UserImpl ui=new UserImpl();

			try {
				json.put("passwordInfo",checkPwd(ui, username,request.getParameter("param2")));
			}catch(JSONException e) {

			}

			ui.stopConnection();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(json);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
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
}
