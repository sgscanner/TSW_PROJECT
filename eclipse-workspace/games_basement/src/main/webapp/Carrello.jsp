<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrello</title>
<%@ page import="implementation.CompongonoImpl" %>
<%@ page import="implementation.ArticoliImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.CompongonoBean" %>
<%@ page import="bean.ArticoliBean" %>
<%@include file="Header2.jsp"%>
<style><%@include file="css/Carrello.css"%></style>
</head>
<body>
	<%CompongonoImpl ci=new CompongonoImpl();
	  ArticoliImpl ai1=new ArticoliImpl();	
	  ArrayList<CompongonoBean> al=ci.searchCart();%>
	<div>
		<div>
			<table style="border:1px solid black;" class=tabella>
				<tr style="border:1px solid black;" class="prodotto">
					<th style="border:1px solid black;"class=nome><br>Nome prodotto</th>
					<th style="border:1px solid black;"class=q><b> Quantita</b></th>
					<th style="border:1px solid black;"class=prezzo><b>Prezzo</b></th>
				</tr>
				<%for(CompongonoBean cb:al){ %>
					<%ArticoliBean ab=ai1.searchByCode(cb.getCodiceArticoli()); %>
					<tr>
						<td><%=ab.getNome() %></td>
						<td><%=cb.getQuantita() %></td>
						<td><%=cb.getPrezzo_storico() %></td>
					</tr>
				<%} %>
			</table>
				<a href="Checkout.jsp"><button onclick="procedi">Procedi</button> </a>
				<a href=""><button onclick="Svuota"> Svuota Carrello</button></a>
		</div>
	</div>
</body>
</html>