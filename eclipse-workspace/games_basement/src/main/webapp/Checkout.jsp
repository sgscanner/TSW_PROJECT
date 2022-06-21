
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<link rel="stylesheet" type="text/css" href="css/Checkout.css">
<title>Checkout</title>


</head>
<body>
	<%@include file="Header2.jsp"%>
	 <div class="dati">
	  
	  
		    <h3 class="fs-title">Nome </h3>
		    <div class="inputContainer">
		      <form class="form">		</form>
		    	<input class="FO" type="text" id="nome" name="nome" placeholder="Nome" autocomplete="false"/>
		    	
		    	<small id="smallUname"></small>
		    </div>
		    
		    <div class="inputContainer">
		       <h3 class="cognome"> Cognome</h3>
		    	<input class="CO" type="text" id="cognome " name="cognome" placeholder="Cognome" /><br>
		    	<small id="smallU"></small>
		    </div>
		    
		    <div class="inputContainer">
		       <h3 class="email">Email</h3>
		    	<input class="EM" type="text" id="email" name="email" placeholder="Email" /><br>
		    	<small></small>
		    </div>
		    
		     <div class="inputContainer">
		       <h3 class="indirizzo">Indirizzo di Spedizione</h3>
		    	<input class="I" type="text" id="Indirizzo di spedizione" name="indirizzo di spedizione" placeholder="Indirizzo di spedizione" /><br>
		    	<small></small>
		    </div>
		    
		     <div class="inputContainer">
		       <h3 class="numero di carta">Numero di Carta</h3>
		    	<input class="NC" type="text" id="Numero di Carta" name="Numero di Carta" placeholder="Numero di Carta" /><br>
		    	<small></small>
		    </div>
		    
		    
		    <div class="inputContainer">
		       <h3 class="Data di scadenza">Data di Scadenza</h3>
		    	<input class="DS" type="text" id="Data di scadenza" name="Data di Scadenza" placeholder="Data di Scadenza" ><br>
		    	<small></small>
		    	
		    	
		    	<div class="imagecontainer">
		    	  <img src="img/carCredito.jpg" class="image" style="max-width:100%;height:auto;">
		    	  
		    	  
		    	 <a href="Acquisto.jsp"><button class="bottone" onclick="Acquista">Acquista</button></a> 
		    	  
		    	  
		    	
		    	
		    	
		    	</div>
		    </div>
		    


	
	</div>
	
	
	

</body>
</html>
	