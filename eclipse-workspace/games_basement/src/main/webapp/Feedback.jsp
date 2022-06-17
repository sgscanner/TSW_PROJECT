<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	
	<%@include file="Header.jsp" %>
		
	<div class="container">
		<div class="titolo">
			<p><b>Crea Recensione</b></p>
		</div>
		<div class="line"></div>
		<div class="c1">
			<div class="c2">
				<img class="pitcure" alt="img" src="img/rec.jpg">
			</div>
			<div class="c3">
				<p>Titolo prodotto</p>
			</div>
		</div>
		<div class="line"></div>
		<div class="c4">
			<div class="c5">
				<p style="display:grid;justify-content:center;align-content:center;"><b>Valutazione complessiva</b></p>
			</div>
			<div class="c6">
				<%@include file="Star.jsp" %> <!-- Da Fixare -->
			</div>
		</div>
		<div class="line"></div>
		<div class="c7">
			<div class="c8">
				<p><b>Aggiungi un titolo</b></p>
			</div>
			<div class="c9">
				<input id="b" class="t" style="border:2px solid black;border-radius:10px;" type="text" placeholder="inserisci un titolo...">
			</div>
		</div>
		<div class="line"></div>
		<div class="c10">
			<div class="c11">
				<p><b>Aggiungi recensione</b></p>
			</div>
			<div class="c12">
				<textarea id="a" class="area" style="border:2px solid black;border-radius:10px;" rows="8" cols="52" placeholder="Scrivi una recensione..."></textarea>
			</div>
		</div>
		<div class="line"></div>
		<div class="c13">
			<div>
				
			</div>
			<div class="c14">
				<button form="feed" type="submit" class="b">Invia</button>
			</div>
		</div>
	</div>
	
	<div style="margin-top: 25px;">
		<%@include file="Footer.jsp" %>
	</div>
	
	<form method="get" action="Prodotto.jsp" id="feed"></form>
	
	<script>
	window.onload = function() {
		  document.getElementById('a').value = '';
		  document.getElementById('b').value = '';
		  }
	</script>
</body>
</html>