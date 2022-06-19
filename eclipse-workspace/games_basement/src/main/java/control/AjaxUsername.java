package control;

import java.io.IOException;

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
 * Servlet implementation class AjaxUsername
 */
@WebServlet("/AjaxUsername")
public class AjaxUsername extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUsername() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname=request.getParameter("param");
		UserImpl ui=new UserImpl();
		JSONObject json=new JSONObject();

		try {
			json.put("usernameInfo",checkUname(ui, uname));
		}catch(JSONException e) {
			System.out.println(e.getMessage());
		}
		ui.stopConnection();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private String checkUname(UserImpl ui,String username) {
		if(username.equals("")) {
			return "Inserisci username";
		}


		if(ui.getAllUser().size()==0) {
			return "Non ci sono utenti registrati";
		}

		UserBean ub=ui.searchUser(username);

		if(ub==null) {
			return "Username disponibile";
		}else {
			return "Username già preso";
		}
	}

}
