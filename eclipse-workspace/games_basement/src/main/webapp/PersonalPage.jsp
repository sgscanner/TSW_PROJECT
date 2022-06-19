<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="bean.UserBean"%>
 <%@page import="bean.DatiAnagraficiBean"%>
 <%@page import="bean.RubricaIndirizziBean"%>
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
	    						<label for="username">Username:</label>
	    						<input class="testo2" type="text" id="username" name="username" value="ub.getUsername()" placeholder="Username" readonly/><br><br>
	    					<small id="smallUname"></small>
	    					</div>
	    					<div class="inputContainer">
	    						<label for="email">Email:</label>
	    						<input class="testo2" type="text" id="email" name="email" value="ub.getEmail()" placeholder="Email" readonly/><br><br>
	    					<small></small>
	    					</div>
	    					<div class="inputContainer">
	    						<label for="password">Password:</label>
	  	 						<input class="testo2" type="password" id="password" name="password" value="ub.getPassword()" placeholder="Password" readonly/><br><br>
	  	 						<small></small>	
	   						</div>
	    					<div class="inputContainer">
	    						<label for="checkPassword">Conferma password:</label>
	    						<input class="testo2" type="password" id="checkPassword" name="checkPassword" value="ub.getPassword()" placeholder="Confirm password" readonly />
	    						<br><br>
	    						<small></small>
	    					</div>
	    					<input type="button" class="bottone" id="editClick1" value="modifica">
							<input type="button" class="bottone" id="salvaInfo1" value="salva">
						</div>
					</div>
					<div class="testo">
						<div id="Anagrafici" hidden="hidden">
							<h2 class="titolo">Dati Anagrafici</h2><br>
							<div class="inputContainer">
								<label for="nome">Nome:</label>
		    					<input class="testo3" type="text" id="nome" name="nome" value="dab.getNome()" placeholder="nome" autocomplete="false"/><br><br>
		    					<small></small>
		    				</div>
			    			<div class="inputContainer">
			    				<label for="cognome">Cognome:</label>
			    				<input class="testo3" type="text" class="testo3" id="cognome" name="cognome" value="dab.getCognome()" placeholder="cognome" autocomplete="false"/><br><br>
			    				<small></small>
			   				</div>
			    		<div class="inputContainer">
			    			<label for="phone">Numero di telefono:</label>
			    			<input class="testo3" type="text" id="phone" name="phone" value="dab.getTelefono()" placeholder="Numero di Telefono" /><br><br>
			    			<small></small>
			    		</div>
			    			<div class="inputContainer">
			    				<label for="città">Città:</label>
			    				<input class="testo3" id="città" type="text" name="citta" value="dab.getCitta()" placeholder="Città" readonly/><br><br>
			    				<small></small>
			    		</div>
			    			<div class="inputContainer"> 
			    				<label for="cap">CAP:</label>
			    				<input class="testo3" id="cap" type="text" name="cap" value="dab.getcap()" placeholder="Cap" readonly/><br><br>
			    				<small></small>
			   	 			</div>
			    			<div class="inputContainer">
			    				<label for="data">Data di nascita:</label>
			    				<input class="testo3" id="data" type="date" value="dab.getDataNascita()" name="bday" readonly/><br><br>
			    				<small></small>
			    			</div>
			   				<input type="button" class="bottone" id="editClick3" value="modifica">
			   				<input type="button" class="bottone" id="salvaInfo3" value="salva">
		 	 			</div>  
					</div>
					<div class="testo">
						<div id="Spedizione"  hidden="hidden">
		  					<h2 class="titolo">Dati spedizione</h2><br>
			    				<div class="inputContainer">
			    				<label for="indirizzo">Indirizzo di spedizione:</label>
			    				<input class="testo4" id="indirizzo1" type="text" name="indirizzo" value="rib.getIndirizzo()" placeholder="Indirizzo" readonly/><br><br>
			    				<small></small>
			    				<div class="inputContainer">
			    				<label for="indirizzo">Indirizzo di fatturazione:</label>
			    				<input class="testo4" id="indirizzo2" type="text" name="indirizzo" value="rib.getIndirizzo()" placeholder="Indirizzo" readonly/><br><br>
			    				<small></small>
			    		</div>
			   			<input type="button" class="bottone" id="editClick4" value="modifica">
			   			<input type="button" class="bottone" id="salvaInfo4" value="salva">
		 	 			</div>
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
<script>
$(document).ready(function(){
	  $("#editClick1").click(function(){
		   $(".testo2").removeAttr("readonly");
		});
});

$(document).ready(function(){
	  $("#salvaInfo1").click(function(){
		   $(".testo2").attr("readonly", true);
		   $("#sezione").attr("name", "dati_account");
		});
});

$(document).ready(function(){
	  $("#editClick3").click(function(){
		   $(".testo3").removeAttr("readonly");
		});
});

$(document).ready(function(){
	  $("#salvaInfo3").click(function(){
		   $(".testo3").attr("readonly", true);
		   $("#sezione").attr("name", "dati_anagrafici");
		});
});

$(document).ready(function(){
	  $("#editClick4").click(function(){
		   $(".testo4").removeAttr("readonly");
		});
});

$(document).ready(function(){
	  $("#salvaInfo4").click(function(){
		   $(".testo4").attr("readonly", true);
		   $("#sezione").attr("name", "dati_shipment");
		});
});
</script>
</body>
</html>