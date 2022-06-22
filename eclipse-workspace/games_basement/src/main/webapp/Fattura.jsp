<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.UserBean"%>
<%@page import="bean.DatiAnagraficiBean"%>
<%@page import="bean.RubricaIndirizziBean"%>
<%@page import="bean.ArticoliBean" %>
<%@page import="bean.OrdineBean" %>
<%@page import="implementation.CompongonoImpl"%>
<%@page import="implementation.ArticoliImpl" %>
<%@page import="implementation.UserImpl" %>
<%@page import="implementation.DatiAnagrificiImpl" %>
<%@page import="implementation.RubricaIndirizziImpl" %>
<%@page import="implementation.OrdineImpl" %>
<%@page import="javax.crypto.spec.SecretKeySpec" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="ISO-8859-1">
<title>La tua fattura</title>
<script src="ajax/ajaxJSON.js"></script>
<script src="jQuery/jquery.js"></script>
<script src='jQuery/jquery-ui.min.js'></script>
<style>
	<%@ include file="css/Fattura.css"%>
</style>
</head>
<body>
<%UserBean ub=(UserBean)request.getSession().getAttribute("user");
if(ub==null){
	request.getRequestDispatcher("ErrorRole.jsp").forward(request,response);
}
CompongonoImpl ci=new CompongonoImpl();
DatiAnagrificiImpl dai=new DatiAnagrificiImpl();
RubricaIndirizziImpl ri=new RubricaIndirizziImpl();
DatiAnagraficiBean dab=dai.searchDatiAnagrafici(ub.getUsername());
RubricaIndirizziBean fatturazione=ri.getIndirizzoFatturazione(ub.getUsername());
RubricaIndirizziBean spedizione=ri.getIndirizzoSpedizione(ub.getUsername());
String pwd=ub.getPassword();
ArticoliImpl a=new ArticoliImpl();
ArticoliBean p=a.searchByCode(request.getParameter("id"));
%>
<%@include file="Header2.jsp" %>
<h3>Ecco la tua fattura.</h3>
<table>
	<tr>
		<th>INTESTAZIONE FATTURA</th>
		<th>LUOGO DI DESTINAZIONE</th>
	</tr>
	<tr>
		<td>Nome: <%=dab.getNome() %></td>
		<td>Nome: <%=dab.getNome() %></td>
	</tr>
	<tr>
		<td>Cognome: <%=dab.getCognome() %></td>
		<td>Cognome: <%=dab.getCognome() %></td>
	</tr>
	<tr>
		<td><%=fatturazione.getIndirizzo()%></td>
		<td><%= fatturazione.getIndirizzo()%></td>
	</tr>
	<tr>
		<td>CAP: <%=dab.getcap()%></td>
		<td>CAP: <%=dab.getcap()%></td>
	</tr>
</table>
<table>
	<tr>
		<th>CODICE</th>
		<th>NOME</th>
		<th>PREZZO</th>
		<th>QUANTITA'</th>
	</tr>
	<tr>
		<td>Codice: <%= p.getCodiceA()%></td>
		<td>Nome: <%=p.getNome()%></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td><%=p.getQuantita() %></td>
		<td><%=p.getPrezzo() %></td>
	</tr>
	<tr>
		<td></td>
	</tr>
</table>
<div style="margin-top:25px;">
<%@include file="Footer2.jsp" %>
</div>
</body>
</html>