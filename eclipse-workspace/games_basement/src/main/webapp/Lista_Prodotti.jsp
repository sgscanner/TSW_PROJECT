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
				<h5><%=articoli.get(i).getPrezzo()%></h5>
				</div>
			</div>
		</div>		
	</div>
</div>
<%}%>
<input type="button" class="bottone1" onclick="scrollToTop()" value="Vai all'inizio">
<%@include file="Footer2.jsp" %>
</body>
<script>
function goTo(id){
	var path="Prodotto.jsp?id="+id;
	location.replace(path);
}
function scrollToTop() {
    $(window).scrollTop(0);
}
</script>
</html>