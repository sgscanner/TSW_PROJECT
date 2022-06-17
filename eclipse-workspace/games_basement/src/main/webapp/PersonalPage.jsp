<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bean.RubricaIndirizziBean"%>
<%@page import="bean.DatiAnagraficiBean"%>
<%@page import="bean.UserBean"%>

<!DOCTYPE html>
<html>
<head>
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
		<%@ include file="css/AccountUtente.css" %>
	</style>
<meta charset="UTF-8">
<title>Area Personale</title>
<script src="ajax/ajaxJSON.js"></script>
<script src="jQuery/jquery.js"></script>
<script src='jQuery/jquery-ui.min.js'></script>
</head>
<body>
<form id="form" action="RegisterServlet" method="POST">
	<div class="contenitore">
		<div class="container">
			<div class="content">
				<input type="radio" name="slider" id="Panoramica">
      			<input type="radio" name="slider" id="Dati_Account">
      			<input type="radio" name="slider" id="Dati_personali">
      			<input type="radio" name="slider" id="Dati_spedizione">
      			<input type="radio" name="slider" id="Logout">
				<div class="list">
					<label for="Panoramica" class="Panoramica">
						<span class="Topic">Panoramica</span>
					</label>
					<label for="Dati_Account" class="Dati_Account">
						<span class="Topic">Dati Account</span>
					</label>
					<label for="Dati_personali" class="Dati_personali">
						<span class="Topic">Dati personali</span>
					</label>
					<label for="Dati_spedizione" class="Dati_spedizione">
						<span class="Topic">Dati spedizione</span>
					</label>
					<label for="Logout" class="Logout">
						<span class="Topic"><a href="LogoutServlet">Logout</a></span>
					</label>
					<div class="slider"></div>
				</div>
			</div>
		</div>
		<div class="container_testo">
					<div class="testo">
						<div id="Panorama">
							<h3>Ciao ub.getUsername()!<br> Qui puoi modificare le informazioni del tuo profilo.</h3><br>
						</div>
					</div>
					<div class="testo">
						<div id="Account" hidden="hidden">
							<h2 class="titolo">Dati Account</h2><br>
	    					<div class="inputContainer">
	    						<input class="testo2" type="text" id="username" name="username" value="ub.getUsername()" placeholder="Username" readonly/>
	    					<small id="smallUname"></small>
	    					</div>
	    					<div class="inputContainer">
	    						<input class="testo2" type="text" id="email" name="email" value="ub.getEmail()" placeholder="Email" readonly/><br>
	    					<small></small>
	    					</div>
	    					<div class="inputContainer">
	  	 						<input class="testo2" type="password" id="password" name="password" value="ub.getPassword()" placeholder="Password" readonly/>
	  	 						<small></small>	
	   						</div>
	    					<div class="inputContainer">
	    						<input class="testo2" type="password" id="checkPassword" name="checkPassword" value="ub.getPassword()" placeholder="Confirm password" readonly />
	    						<small></small>
	    					</div>
	    					<input type="button" id="editClick1" value="modifica">
							<input type="button" id="salvaInfo1" value="salva">
						</div>
					</div>
					<div class="testo">
						<div id="Anagrafici" hidden="hidden">
							<h2 class="titolo">Dati Anagrafici</h2><br>
							<div class="inputContainer">
		    					<input class="testo3" type="text" id="nome" name="nome" placeholder="nome" autocomplete="false"/>
		    					<small></small>
		    				</div>
			    			<div class="inputContainer">
			    				<input class="testo3" type="text" class="testo3" id="cognome" name="cognome" placeholder="cognome" autocomplete="false"/>
			    				<small></small>
			   				</div>
			    		<div class="inputContainer">
			    			<input class="testo3" type="text" id="phone" name="phone" placeholder="Numero di Telefono"  />
			    			<small></small>
			    		</div>
			    			<div class="inputContainer">
			    				<input class="testo3" id="citta" type="text" name="citta" value="dab.getCitta()" placeholder="Città" readonly/>
			    				<small></small>
			    		</div>
			    			<div class="inputContainer"> 
			    				<input class="testo3" id="cap" type="text" name="cap" value="dab.getcap()" placeholder="Cap" readonly/>
			    				<small></small>
			   	 			</div>
			    			<div class="inputContainer">
			    				<input class="testo3" id="data" type="date" value="dab.getDataNascita()" name="bday" readonly/>
			    				<small></small>
			    			</div>
			   				<input type="button" id="editClick3" value="modifica">
			   				<input type="button" id="salvaInfo3" value="salva">
		 	 			</div>  
					</div>
					<div class="testo">
						<div id="Spedizione"  hidden="hidden">
		  					<h2 class="titolo">Indirizzi</h2><br>
			    				<div class="inputContainer">
			    				<input class="testo4" id="indirizzo" type="text" name="indirizzo" value="rib.getIndirizzo()" placeholder="Indirizzo" readonly/>
			    				<small></small>
			    		</div>
			   			<input type="button" id="editClick4" value="modifica">
			   			<input type="button" id="salvaInfo4" value="salva">
		 	 			</div>
		 		 </div>  
          	</div>
		</div>
	</form>
<script>
$(document).ready(function(){
	  $("#Panoramica").click(function(){
		   $("#Panorama").show();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		});
});

$(document).ready(function(){
	  $("#Dati_Account").click(function(){
		   $("#Panorama").hide();
		   $("#Account").show();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		});
});

$(document).ready(function(){
	  $("#Dati_personali").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").show();
		   $("#Spedizione").hide();
		});
});

$(document).ready(function(){
	  $("#Dati_spedizione").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").show();
		});
});
</script>
</body>
</html>