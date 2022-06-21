<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="bean.ArticoliBean"%>
    <%@ page import="dao.ArticoliDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recensione prodotto</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<style><%@include file="css/Feedback.css"%></style>
</head>
<body>
	
	<%@include file="Header2.jsp" %>
	<% 
		UserBean user=(UserBean)request.getSession().getAttribute("user");
		ArticoliImpl a=new ArticoliImpl();
		ArticoliBean p = a.searchByCode(request.getParameter("id")); %>
		<input type="hidden" id="username" value=<%=user.getUsername() %>>
		<input type="hidden" id="codice_articolo" value=<%=request.getParameter("id") %>>
	<div class="container">
		<div class="titolo">
			<p><b>Crea Recensione</b></p>
		</div>
		<div class="line"></div>
		<div class="c1">
			<div class="c2">
				<img class="pitcure" alt="img" src="prodottiImg/<%=p.getNome() %>/rec.jpg">
			</div>
			<div class="c3">
				<p><%=p.getNome() %></p>
			</div>
		</div>
		<div class="line"></div>
		<div class="c4">
			<div class="c5">
				<p ><b>Valutazione complessiva</b></p>
			</div>
			<div class="c6">
				<input type="text" id="stelle" placeholder="numero stelle">
			</div>
		</div>
		<div class="line"></div>
		<div class="c7">
			<div class="c8">
				<p><b>Aggiungi un titolo</b></p>
			</div>
			<div class="c9">
				<input id="titolo" class="t" type="text" placeholder="inserisci un titolo...">
			</div>
		</div>
		<div class="line"></div>
		<div class="c10">
			<div class="c11">
				<p><b>Aggiungi recensione</b></p>
			</div>
			<div class="c12">
				<textarea id="descrizione" class="area"  rows="8" cols="52" placeholder="Scrivi una recensione..."></textarea>
			</div>
		</div>
		<div class="line"></div>
		<div class="c13">
			<div>
				
			</div>
			<div class="c14">
				
				<button id="button" class="b" onclick="myFunc()">Recensisci</button>
			</div>
		</div>
	</div>
<script type="text/javascript">
	const titolo=document.getElementById("titolo").value;
	const stelle=document.getElementById("stelle").value;
	const username=document.getElementById("username").value;
	const articolo=document.getElementById("codice_articolo").value;
	const descrizione=document.getElementById("descrizione").value;
	
	function myFunc(){
		console.log("button clicked");
		let path="RecensioneServlet?titolo="+titolo+"&stelle="+stelle+"&username="+username+"&articolo="+articolo+"&descrizione="+descrizione;
		location.href=path;
	}
</script>
</body>
</html>