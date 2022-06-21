<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.UserBean"%>
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
<%UserBean ub=(UserBean)request.getSession().getAttribute("user");%>
<h3>Ecco la tua fattura!</h3>
<div id="contenitore">
<table>
				<tr class="intestazioni">
					<td>INTESTAZIONE FATTURA</td>
				</tr>
				<tr class="intestazioni">
					<td>Nome:</td>
				</tr>
				<tr class="intestazioni">
					<td>Cognome:</td>
				</tr>
				<tr class="intestazioni">
					<td>Indirizzo:</td>
				</tr>
				<tr class="intestazioni">
					<td>Città:</td>
				</tr>
				<tr class="intestazioni">
					<td>CAP:</td>
				</tr>
				
			</table>
			<table>
				<tr class="intestazioni">
					<td>LUOGO DI DESTINAZIONE</td>
				</tr>
				<tr class="intestazioni">
					<td>Nome:</td>
				</tr>
				<tr class="intestazioni">
					<td>Cognome:</td>
				</tr>
				<tr class="intestazioni">
					<td>Indirizzo:</td>
				</tr>
				<tr class="intestazioni">
					<td>Città:</td>
				</tr>
				<tr class="intestazioni">
					<td>CAP:</td>
				</tr>
			</table>
</div>
</body>
</html>