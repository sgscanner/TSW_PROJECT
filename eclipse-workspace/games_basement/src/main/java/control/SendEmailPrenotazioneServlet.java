package control;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean;

/**
 * Servlet implementation class SendEmailServlet
 */
@WebServlet("/SendEmailPrenotazioneServlet")
public class SendEmailPrenotazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmailPrenotazioneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mittente="gamesbasement969@gmail.com";
		String destinatario=((UserBean) request.getSession().getAttribute("user")).getEmail();
		String host="localhost";
		String link="http://localhost:8080/games_basement/";
		Properties properties=System.getProperties();
		properties.setProperty("mail.smtp.host", host);
		Session session = Session.getDefaultInstance(properties);
		
		try {
	         MimeMessage message = new MimeMessage(session);
	         message.setFrom(new InternetAddress(mittente));
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
	         message.setSubject("Conferma prenotazione");
	         message.setContent("<h1>Grazie mille per aver scelto questo gioco,appena sarà disponbile potrai completare l'acquisto</h1>"
	         				  + "<h2>Puoi continuare i tuoi acquisti <a href="+link+">qui</a> </h2>", "text/html" );
	         
	         // Invio Messaggio
	         Transport.send(message);
	         String title = "Send Email";
	         String res = "Sent message successfully....";

		}catch(MessagingException e) {
			System.out.println(e.getMessage());
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
