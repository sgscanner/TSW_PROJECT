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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>La tua fattura</title>
<style>
	<%@ include file="css/Fattura.css"%>
</style>
</head>
<body>
<%UserBean ub=(UserBean)request.getSession().getAttribute("user");
	
%>
<h3>Ecco la tua fattura.</h3>
<table>
	<tr>
		<th>INTESTAZIONE FATTURA</th>
		<th>LUOGO DI DESTINAZIONE</th>
	</tr>
	<tr>
		<td>Nome: dab.getNome()</td>
		<td>Nome: dab.getNome()</td>
	</tr>
	<tr>
		<td>Cognome: dab.getCognome()</td>
		<td>Cognome: dab.getCognome()</td>
	</tr>
	<tr>
		<td>fatturazione.getIndirizzo()</td>
		<td>fatturazione.getIndirizzo()</td>
	</tr>
	<tr>
		<td>CAP: dab.getCap()</td>
		<td>CAP: dab.getCap()</td>
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
		<td>Nome: dab.getNome()</td>
		<td>Nome: dab.getNome()</td>
	</tr>
	<tr>
		<td>Cognome: dab.getCognome()</td>
		<td>Cognome: dab.getCognome()</td>
	</tr>
	<tr>
		<td>fatturazione.getIndirizzo()</td>
		<td>fatturazione.getIndirizzo()</td>
	</tr>
	<tr>
		<td>CAP: dab.getCap()</td>
		<td>CAP: dab.getCap()</td>
	</tr>
</table>
</body>
</html>