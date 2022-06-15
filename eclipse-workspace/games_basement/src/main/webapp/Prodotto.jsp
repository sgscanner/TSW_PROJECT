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
	
	<%@ include file="Header.jsp" %>
	
	<div class="titpro">
		<p><b>Titolo prodotto</b></p>
	</div>
	
	<div class="prodotto">
		<div class="prodotto1">
			<img class="pitcure" src="img/1.jpg" alt="1" style="max-width:100%">
		
			<img class="pitcure" src="img/2.jpg" alt="2" style="max-width:100%">
		
			<img class="pitcure" src="img/3.jpg" alt="3" style="max-width:100%">
		
			<img class="pitcure" src="img/4.jpg" alt="4" style="max-width:100%">
		
			<img class="pitcure" src="img/5.jpg" alt="5" style="max-width:100%">
			
			<div style="display:inline">
			<button class="buttonleft" onclick="plusDivs(-1)">&#10094;</button>
			<button class="buttonright" onclick="plusDivs(1)">&#10095;</button>	
		</div> 
			
		</div>
		
		<div class="shop">
			<div class="shop1">
					<div class="shop2">
						<p style="display:inline;">prezzo&euro;</p>
						
					</div>
					<div class="shop2">
						<p style="display:inline;">Quantit&agrave;&nbsp;<input class="n" type="number" min="1" max="99"></p>
					</div>
			</div>
			
			<div class="shop1">
				<div class="shop2">
					<p><b>Genere</b>&nbsp;Action
					<p><b>Rilascio</b>&nbsp;12/11/2020
					<p><b>PEGI</b>&nbsp;16+
				</div>
				<div class="shop2">
					<button class="off" type="button">&#127918;&nbsp;Prodotto in offerta</button>
				</div>
			</div>
			
			<div class="shop1">
				<div class="shop2">
					<button form="acquista" class="bao" type="submit">Acquista ora</button>
				</div>
				<div class="shop2">
					<button form="carrello" class="bag" type="submit">Aggiungi al carrello</button>
				</div>
			</div>
		</div>
	</div>
		
		<div class="line"></div>
		
		<div>
			<div>
				<p class="d">DESCRIZIONE</p>
			</div>
			<div style="display:grid;grid-template-columns:1fr;margin-bottom:10px;">
				<p>Nell'ultima avventura dell'universo di Marvel's Spider-Man, 
				l'adolescente Miles Morales affronta il trasloco nella sua nuova 
				casa mentre segue le orme del suo mentore, Peter Parker, 
				per diventare il nuovo Spider-Man. Quando una feroce 
				forza minaccia di distruggere la sua nuova casa, 
				l'aspirante eroe comprende che da grandi poteri, 
				derivano grandi responsabilit&agrave;. Per salvare la New York della Marvel, 
				Miles deve indossare il costume di Spider-Man e guadagnarselo.</p>
			</div>
		</div>
		
		<div style="display:grid;grid-template-columns:1fr 1fr;border:5px solid red;">
			<div style="border:5px solid green;">
			
			</div>
			<div style="border:5px solid blue;">
				
			</div>
		</div>
		
		<div style="margin-top: 25px;">
			<%@include file="Footer.jsp"%>
		</div>
		
		<form action="" method="get" id="carrello">
		
		</form>
		
		<form action="" method="get" id="acquista">
		
		</form>
		
<script type="text/javascript">
	const form = document.getElementById('carrello');
		
	form.addEventListener('submit',(event) => {
			
	});
		
	form.addEventListener('submit'),(event) =>{
			event.preventDefault();
	});
</script>

<script type="text/javascript">
	const form = document.getElementById('acquista');
		
	form.addEventListener('submit',(event) => {
			
	});
		
	form.addEventListener('submit'),(event) =>{
			event.preventDefault();
	});
</script>

<script type="text/javascript">
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