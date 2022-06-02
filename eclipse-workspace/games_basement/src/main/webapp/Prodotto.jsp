<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Prodotto</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style><%@include file="css/Prodotto.css"%></style>
</head>
<body>
	<%@include file="Header.jsp" %>
	
	<p><b>Marvel's Spider-Man</b></p>
	
	<div style="display: grid; grid-template-columns: auto auto; margin-top:10px;">
		<div>
	
			<img class="pitcure" src="img/1.jpg" alt="1" style="max-width:100%">
		
			<img class="pitcure" src="img/2.jpg" alt="2" style="max-width:100%">
		
			<img class="pitcure" src="img/3.jpg" alt="3" style="max-width:100%">
		
			<img class="pitcure" src="img/4.jpg" alt="4" style="max-width:100%">
		
			<img class="pitcure" src="img/5.jpg" alt="5" style="max-width:100%">
		</div>
		
		<div class="cart">
			<div class="prezzo">
				<p>19,99&euro;</p>
			</div>
			<div>
				<p style="display:inline">Quantit&agrave;:</p>
				<input class="n" type="number" min="1" max="99">
			</div>
			<div>
				<form method="post" action="">
					<input class="buttonA" type="submit" value="Acquista ora">
				</form>
			</div>
			<div>
				<form action="">
					<input class="buttonB" type="submit" value="Aggiungi al carrello">
				</form>
			</div>
			<div>
				<p style="display:inline">
				<b>Genere</b>&nbsp;&nbsp;Action<br>
				<b>Rilascio</b>&nbsp;&nbsp;07/09/2018<br>
				<b>PEGI</b>&nbsp;&nbsp;16+	
			</div>
			<div>
				<p class="offerta">Prodotto in offerta</p>
			</div>
		</div>
	</div>
		
		<div style="display:inline">
			<button class="buttonleft" onclick="plusDivs(-1)">&#10094;</button>
			<button class="buttonright" onclick="plusDivs(1)">&#10095;</button>	
		</div> 
		
		<div class="line">
		
		</div>
		
		<div>
			<p class="des">DESCRIZIONE</p>
			<p class="d">Marvel's Spider-Man contiene tutte le acrobazie, le improvvisazioni e le ragnatele che hanno reso celebre 
			l'arrampicamuri, uno dei supereroi pi&ugrave; famosi al mondo, introducendo allo stesso tempo elementi mai visti 
			in un gioco di Spider-Man.</p>
		</div>
		
			<p class="rec">RECENSIONI</p>
			
		<div style="display: grid; grid-template-columns: auto auto">
			
			
				<div>
				
				</div>
				
			
			
			<div style="border: 2px solid black">
				<div style="display: grid; grid-template-columns: auto auto;">
					<p>Nome Cliente</p>
					<div>
						<%@include file="StaticStar.jsp" %>
					</div>
				</div>
				<p>Titolo recensione</p>
				<p>Descrizione</p>
			</div>
			
		</div>
		
		<div>
			<p class="par"><b>Recensisci prodotto</b></p>
			<form method="post" action="Feedback.jsp">
      			<input class="buttonR" type="submit" value="Scrivi una recensione"/>
    		</form>
			
		</div>
		
		<div style="margin-top: 25px;">
			<%@include file="Footer.jsp"%>
		</div>
		
	<script>
	var slideIndex = 1;
	showDivs(slideIndex);

	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}

	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("pitcure");
	  if (n > x.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = x.length}
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}
	</script>
	
</body>
</html>