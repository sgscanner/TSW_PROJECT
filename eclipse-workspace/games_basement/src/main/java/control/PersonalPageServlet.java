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

import bean.DatiAnagraficiBean;
import bean.RubricaIndirizziBean;
import implementation.DatiAnagrificiImpl;
import implementation.RubricaIndirizziImpl;
import implementation.UserImpl;

/**
 * Servlet implementation class PersonalPageServlet
 */
@WebServlet("/PersonalPageServlet")
public class PersonalPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalPageServlet() {
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
		String username=request.getParameter("username");
		if(type.equals("dati_anagrafici")) {
			DatiAnagrificiImpl dai=new DatiAnagrificiImpl();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			long l;
			Date date;
			String telefono=request.getParameter("telefono"),bDay=request.getParameter("bday")
				   ,nome=request.getParameter("nome"),cognome=request.getParameter("cognome"),città=request.getParameter("citta"),cap=request.getParameter("cap");
			try {
				l=sdf.parse(bDay).getTime();
				date=new Date(l);

				DatiAnagraficiBean dab=new DatiAnagraficiBean(username,cap,nome,cognome,telefono,date,città);
				dai.updateDatiAnagrafici(dai.searchDatiAnagrafici(username), dab);

				dai.stopConnection();

			}catch(ParseException e) {

			}

		}else if(type.equals("rubrica_indirizzi")) {
			RubricaIndirizziImpl ri=new RubricaIndirizziImpl();
			String idC=request.getParameter("cap"),indirizzo=request.getParameter("indirizzo"),idIndirizzo=request.getParameter("id_indirizzo");
			RubricaIndirizziBean rib=new RubricaIndirizziBean(Integer.parseInt(idIndirizzo),username,idC,indirizzo);
			ri.updateRubricaIndirizzi(ri.searchRubrica(username), rib);
			ri.stopConnection();
		}else if(type.equals("lista_utenti")) {
			UserImpl ui=new UserImpl();
			String azione=request.getParameter("azione");
			String uname=request.getParameter("username");

			if(azione.equals("upgrade")) {
				ui.upgradeUtente(uname);
			}else if(azione.equals("rimuovi")) {
				ui.deleteUser(ui.searchUser(uname));
			}else if(azione.equals("downgrade")) {
				ui.downgradeUtente(uname);
			}

			ui.stopConnection();
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

}
