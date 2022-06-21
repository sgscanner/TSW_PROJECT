<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="implementation.Connessione" %>
 <%@page import="implementation.ArticoliImpl" %>
 <%@page import="bean.ArticoliBean" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<style>
	<%@ include file="css/Lista.css"%>
</style>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista Prodotti</title>
</head>
<body>
<%@ include file="Header2.jsp" %>
<% 	ArticoliImpl ac = new ArticoliImpl();
	Connessione connessione = new Connessione();
	Connection c = connessione.setConnection();
	try {
		Statement lista=c.createStatement();
		ResultSet rs = lista.executeQuery("SELECT A.nome, A.prezzo A.codiceA FROM Articoli AS A, Sono_forniti_da AS S, Fornitore AS F WHERE A.codice_articoli=S.codice_articoli AND S.partita_iva=F.partita_iva AND F.nome='"+request.getParameter("name")+"'");
		while(rs.next()){
			ArticoliBean ab = new ArticoliBean();
			ab.setCodiceA(rs.getString("CodiceA"));
			ab.setNome(rs.getString("nome"));
			ab.setPrezzo(rs.getInt("prezzo"));
			ab.setCodiceC(0);
			ab.setDescrizione("");
			ab.setOfferta(false);
			ab.setQuantita(rs.getInt("quantità"));
			ab.setTipologia("");
			ac.addArticolo(ab);
		}
	}catch(SQLException e) {
		
	}
%>

<%for(int i=0; i<ai.getAllArticoli().size();){%>										
<div class="prodotti">
	<div class="prodotto">
		<div id="prodotto1">
			<div class="image">
			<a id=<%=ai.getAllArticoli().get(i).getCodiceA()%> onclick="redirectProdotto(this.id)">
				<img src="prodottiImg/<%=ai.getAllArticoli().get(i).getNome()%>/rec.jpg" alt="Immagine non disponibile" width="150px" height="137px">
			</div>
			<div class="txt">
				<h5><%=ai.getAllArticoli().get(i).getNome()%></h5>
				<div class="prezzo">
				<h6><%=ai.getAllArticoli().get(i).getPrezzo()%></h6>
				</div>
			</div>
			</a>
		</div>
		i++;
	</div>
	<div class="prodotto">
		<div id="prodotto2">
			<div class="image">
			<a id=<%=ai.getAllArticoli().get(i).getCodiceA()%> onclick="redirectProdotto(this.id)">
				<img src="prodottiImg/<%=ai.getAllArticoli().get(i).getNome()%>/rec.jpg" alt="Immagine non disponibile" width="150px" height="137px">
			</div>
			<div class="txt">
				<h5><%=ai.getAllArticoli().get(i).getNome()%></h5>
				<div class="prezzo">
				<h6><%=ai.getAllArticoli().get(i).getPrezzo()%></h6>
				</div>
			</div>
			</a>
		</div>
		i++;
	</div>
	<div class="prodotto">
		<div id="prodotto3">
			<div class="image">
			<a id=<%=ai.getAllArticoli().get(i).getCodiceA()%> onclick="redirectProdotto(this.id)">
				<img src="prodottiImg/<%=ai.getAllArticoli().get(i).getNome()%>/rec.jpg" alt="Immagine non disponibile" width="150px" height="137px">
			</div>
			<div class="txt">
				<h5><%=ai.getAllArticoli().get(i).getNome()%></h5>
				<div class="prezzo">
				<h6><%=ai.getAllArticoli().get(i).getPrezzo()%></h6>
				</div>
			</div>
			</a>
		</div>
		i++;
	</div>
	<div class="prodotto">
		<div id="prodotto4">
			<div class="image">
			<a id=<%=ai.getAllArticoli().get(i).getCodiceA()%> onclick="redirectProdotto(this.id)">
				<img src="prodottiImg/<%=ai.getAllArticoli().get(i).getNome()%>/rec.jpg" alt="Immagine non disponibile" width="150px" height="137px">
			</div>
			<div class="txt">
				<h5><%=ai.getAllArticoli().get(i).getNome()%></h5>
				<div class="prezzo">
				<h6><%=ai.getAllArticoli().get(i).getPrezzo()%></h6>
				</div>
			</div>
			</a>
		</div>
		i++;
	</div>
	<div class="prodotto">
		<div id="prodotto5">
			<div class="image">
			<a id=<%=ai.getAllArticoli().get(i).getCodiceA()%> onclick="redirectProdotto(this.id)">
				<img src="prodottiImg/<%=ai.getAllArticoli().get(i).getNome()%>/rec.jpg" alt="Immagine non disponibile" width="150px" height="137px">
			</div>
			<div class="txt">
				<h5><%=ai.getAllArticoli().get(i).getNome()%></h5>
				<div class="prezzo">
				<h6><%=ai.getAllArticoli().get(i).getPrezzo()%></h6>
				</div>
			</div>
			</a>
		</div>
		i++;
	</div>
	<div class="prodotto">
		<div id="prodotto6">
			<div class="image">
			<a id=<%=ai.getAllArticoli().get(i).getCodiceA()%> onclick="redirectProdotto(this.id)">
				<img src="prodottiImg/<%=ai.getAllArticoli().get(i).getNome()%>/rec.jpg" alt="Immagine non disponibile" width="150px" height="137px">
			</div>
			<div class="txt">
				<h5><%=ai.getAllArticoli().get(i).getNome()%></h5>
				<div class="prezzo">
				<h6><%=ai.getAllArticoli().get(i).getPrezzo()%></h6>
				</div>
			</div>
			</a>
		</div>
		i++;
	</div>
	<div class="prodotto">
		<div id="prodotto7">
			<div class="image">
			<a id=<%=ai.getAllArticoli().get(i).getCodiceA()%> onclick="redirectProdotto(this.id)">
				<img src="prodottiImg/<%=ai.getAllArticoli().get(i).getNome()%>/rec.jpg" alt="Immagine non disponibile" width="150px" height="137px">
			</div>
			<div class="txt">
				<h5><%=ai.getAllArticoli().get(i).getNome()%></h5>
				<div class="prezzo">
				<h6><%=ai.getAllArticoli().get(i).getPrezzo()%></h6>
				</div>
			</div>
			</a>
		</div>
		i++;
	</div>
	<div class="prodotto">
		<div id="prodotto8">
			<div class="image">
			<a id=<%=ai.getAllArticoli().get(i).getCodiceA()%> onclick="redirectProdotto(this.id)">
				<img src="prodottiImg/<%=ai.getAllArticoli().get(i).getNome()%>/rec.jpg" alt="Immagine non disponibile" width="150px" height="137px">
			</div>
			<div class="txt">
				<h5><%=ai.getAllArticoli().get(i).getNome()%></h5>
				<div class="prezzo">
				<h6><%=ai.getAllArticoli().get(i).getPrezzo()%></h6>
				</div>
			</div>
			</a>
		</div>
		i++;
	</div>
	<div class="prodotto">
		<div id="prodotto9">
			<div class="image">
			<a id=<%=ai.getAllArticoli().get(i).getCodiceA()%> onclick="redirectProdotto(this.id)">
				<img src="prodottiImg/<%=ai.getAllArticoli().get(i).getNome()%>/rec.jpg" alt="Immagine non disponibile" width="150px" height="137px">
			</div>
			<div class="txt">
				<h5><%=ai.getAllArticoli().get(i).getNome()%></h5>
				<div class="prezzo">
				<h6><%=ai.getAllArticoli().get(i).getPrezzo()%></h6>
				</div>
			</div>
			</a>
		</div>
		i++;
	</div>
</div>
<%}%>
<p class="bottone1"> 
<a href="#" id="loadMore">Load More</a>
</p>
<p class="bottone2"> 
    <a href="#top">Back to top</a> 
</p>
</body>
<script>
$(function () {
    $("prodotto").slice(0, 9).show();
    $("#loadMore").on('click', function (e) {
        e.preventDefault();
        $("prodotto:hidden").slice(0, 9).slideDown();
        if ($("prodotto:hidden").length == 0) {
            $("#load").fadeOut('slow');
        }
        $('html,body').animate({
            scrollTop: $(this).offset().top
        }, 1500);
    });
});

$('a[href=#top]').click(function () {
    $('body,html').animate({
        scrollTop: 0
    }, 600);
    return false;
});

$(window).scroll(function () {
    if ($(this).scrollTop() > 50) {
        $('.totop a').fadeIn();
    } else {
        $('.totop a').fadeOut();
    }
});
</script>
</html>