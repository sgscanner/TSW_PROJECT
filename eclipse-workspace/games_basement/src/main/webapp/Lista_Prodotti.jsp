<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="implementation.Connessione" %>
 <%@page import="implementation.ArticoliImpl" %>
 <%@page import="bean.ArticoliBean" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList" %>
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
<%
	ArrayList<ArticoliBean> articoli = new ArrayList<ArticoliBean>();
	ArticoliImpl impl=new ArticoliImpl();
	articoli=impl.listaProdottiJSP(request.getParameter("nome"));
%>

<%for(int i=0; i<articoli.size();i++){%>										
<div class="prodotti">
	<div class="prodotto">
		<div id="prodotto1">
			<div class="image">
				<a id=<%=articoli.get(i).getCodiceA()%> onclick="goTo(this.id)">
					<img src="prodottiImg/<%=articoli.get(i).getNome()%>/rec.jpg" alt="Immagine non disponibile" width="150px" height="137px">
				</a>
			</div>
			<div class="txt">
				<h5><%=articoli.get(i).getNome()%></h5>
				<div class="prezzo">
				<h6><%=articoli.get(i).getPrezzo()%></h6>
				</div>
			</div>
		</div>		
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

function goTo(id){
	var path="Prodotto.jsp?id="+id;
	location.replace(path);
}
</script>
</html>