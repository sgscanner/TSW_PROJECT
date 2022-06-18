package bla;

import java.net.PasswordAuthentication;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	public static void main(String[] args) {
		String mittente = "gamesbasement969@gmail.com";
		String destinatario ="a.brenga@studenti.unisa.it";
		String host = "localhost";
		String password="Fisciano1!";
		String link = "http://localhost:8080/games_basement/";
		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.user",mittente);
        properties.put("mail.password",password);
		Session session = Session.getDefaultInstance(properties);
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(mittente));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
			message.setSubject("Conferma prenotazione");
			message.setContent(
					"<h1>Grazie mille per aver scelto questo gioco,appena sarà disponbile potrai completare l'acquisto</h1>"
							+ "<h2>Puoi continuare i tuoi acquisti <a href=" + link + ">qui</a> </h2>",
					"text/html");

			// Invio Messaggio
			Transport.send(message);
			System.out.println("email inviata");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
