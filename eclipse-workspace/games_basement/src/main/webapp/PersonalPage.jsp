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
<%@ include file="Header2.jsp" %>
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
	System.out.println("dab citta"+dab.getCitta());
%>
	<div class="contenitore">
		<div class="container">
			<div class="content">
				<input type="radio" name="slider" id="Panoramica">
      			<input type="radio" name="slider" id="Dati_Account">
      			<input type="radio" name="slider" id="Dati_personali">
      			<input type="radio" name="slider" id="Dati_spedizione">
      			<input type="radio" name="slider" id="Ordini_effettuati">
      			<input type="radio" name="slider" id="Prenotazioni">
      			<input type="radio" name="slider" id="Lista_Utenti">
      			<input type="radio" name="slider" id="Lista_Prodotti">
      			<input type="radio" name="slider" id="Lista_Ordini">
      			<input type="radio" name="slider" id="Lista_Prenotazioni">
      			<input type="radio" name="slider" id="Logout">
				<div class="list">
					<label for="Panoramica" class="Panoramica">
						<small class="Topic">Panoramica</small><br>
					</label>
					<label for="Dati_Account" class="Dati_Account">
						<small class="Topic">Dati Account</small><br>
					</label>
					<label for="Dati_personali" class="Dati_personali">
						<small class="Topic">Dati anagrafici</small><br>
					</label>
					<label for="Dati_spedizione" class="Dati_spedizione">
						<small class="Topic">Dati spedizione</small><br>
					</label>
					<label for="Ordini_effettuati" class="Ordini_effettuati">
						<small class="Topic">Ordini effettuati</small><br>
					</label>
					<label for="Prenotazioni" class="Prenotazioni">
						<small class="Topic">Prenotazioni</small><br>
					</label>
					<%if(ub.getRuolo().equals("admin")){ %>
					<label for="Lista_Utenti" class="Lista_Utenti">
						<small class="Topic">Utenti</small><br>
					</label>
					<label for="Lista_Prodotti" class="Lista_Prodotti">
						<small class="Topic">Prodotti</small><br>
					</label>
					<label for="Lista_Ordini" class="Lista_Ordini">
						<small class="Topic">Lista ordini</small><br>
					</label>
					<label for="Lista_Prenotazioni" class="Lista_Prenotazioni">
						<small class="Topic">Lista prenotazioni</small><br>
					</label>
					<%} %>
					<label for="Logout" class="Logout">
						<small class="Topic"><a href="LogoutServlet">Logout</a></small>
					</label>
					<div class="slider"></div>
				</div>
			</div>
		</div>
		<div class="container_testo">
				<div class="testo">
					<div id="Panorama">
						<h3>Ciao <%=ub.getUsername()%>!<br> Qui puoi modificare le informazioni del tuo profilo.</h3><br>
					</div>
				</div>
				<div class="testo">
					<form action="PersonalPageServlet" method="POST">
					<div id="Account" hidden="hidden">
						<h2 class="titolo">Dati Account</h2><br>
	    				<div class="inputContainer">
	    					<label for="username">Username:</label>
	    					<input class="testo2" type="text" id="username" name="username" value="<%=ub.getUsername()%>" placeholder="Username" readonly/><br><br>
	    					<small id="smallUname"></small>
	   					</div>
	   					<div class="inputContainer">
	   						<label for="email">Email:</label>
	   						<input class="testo2" type="text" id="email" name="email" value="<%=ub.getEmail()%>" placeholder="Email" readonly/><br><br>
	    					<small></small>
	   					</div>
	   					<div class="inputContainer">
	    					<label for="password">Password:</label>
	  						<input class="testo2" type="password" id="password" name="password" value="<%=ub.getPassword() %>" placeholder="Password" readonly/><br><br>
	   						<small></small>	
	  					</div>
	    				<div class="inputContainer">
	    					<label for="checkPassword">Conferma password:</label>
	    					<input class="testo2" type="password" id="checkPassword" name="checkPassword" value=<%=ub.getPassword()%> placeholder="Confirm password" readonly />
	    					<br><br>
	    					<small></small>
	    				</div>
	    				<input type="button" class="bottone" id="editClick1" value="Modifica">
						<input type="submit" class="bottone" id="salvaInfo1" value="Salva" onclick="checkUsername()">
						<input type="hidden" id="tipo" value="account">
					</div>
					</form>	
				</div>
				<div class="testo">
					<form action="PersonalPageServlet" method="POST">
					<div id="Anagrafici" hidden="hidden">
						<h2 class="titolo">Dati Anagrafici</h2><br>
						<div class="inputContainer">
							<label for="nome">Nome:</label>
		    				<input class="testo3" type="text" id="nome" name="nome" value=<%=dab.getNome()%>  placeholder="nome" autocomplete="false" readonly/><br><br>
		    				<small></small>
		    			</div>
			    		<div class="inputContainer">
			    			<label for="cognome">Cognome:</label>
			    			<input class="testo3" type="text" class="testo3" id="cognome" name="cognome" value=<%=dab.getCognome()%> placeholder="cognome" autocomplete="false" readonly/><br><br>
			    			<small></small>
			   			</div>
			    		<div class="inputContainer">
			    			<label for="phone">Numero di telefono:</label>
			    			<input class="testo3" type="text" id="phone" name="phone" value=<%=dab.getTelefono()%> placeholder="Numero di Telefono" readonly/><br><br>
			    			<small></small>
			    		</div>
			    			<div class="inputContainer">
			    			<label for="citta">Città:</label>
			   				<input class="testo3" id="citta" type="text" name="citta" value=<%=dab.getCitta()%> placeholder="Città" readonly/><br><br>
			   				<small></small>
			    		</div>
			   			<div class="inputContainer"> 
			   				<label for="cap">CAP:</label>
			   				<input class="testo3" id="cap" type="text" name="cap" value=<%=dab.getcap()%> placeholder="Cap" readonly/><br><br>
			   				<small></small>
		   	 			</div>
		    			<div class="inputContainer">
		    				<label for="data">Data di nascita:</label>
		    				<input class="testo3" id="data" type="date" value=<%=dab.getDataNascita()%> name="bday" readonly/><br><br>
		    				<small></small>
		    			</div>
		  				<input type="button" class="bottone" id="editClick3" value="Modifica">
		   				<input type="submit" class="bottone" id="salvaInfo3" value="Salva" onclick="checkSecondField()">
		 	 			<input type="hidden" id="tipo" value="dati_anagrafici">
		 	 		</div>  
		 	 		</form>
				</div>
				<div class="testo">
					<form action="PersonalPageServlet" method="POST">
					<div id="Spedizione"  hidden="hidden">
		  				<h2 class="titolo">Dati spedizione</h2><br>
			    		<div class="inputContainer">
			    			<label for="spedizione">Indirizzo di spedizione:</label>
			    			<%if(spedizione==null){ %>
			    				<input class="testo4" id="spedizione" type="text" name="indirizzo" value="Inserisci il tuo primo indirizzo di spedizione" placeholder="Indirizzo" readonly/><br><br>
			    			<%}else{%>
			    				<input class="testo4" id="spedizione" type="text" name="indirizzo" value=<%=spedizione.getIndirizzo() %> placeholder="Indirizzo" readonly/><br><br>
			    			<%} %>
			    			<small></small>
			    		</div>
			   			<div class="inputContainer">
			   				<label for="fatturazione">Indirizzo di fatturazione:</label>
			   				<%if(fatturazione==null){ %>
			   					<input class="testo4" id="fatturazione" type="text" name="indirizzo" value="Inserisci il tuo primo indirizzo di fatturazione" placeholder="Indirizzo" readonly/><br><br>
			   				<%}else{%>
			   					<input class="testo4" id="fatturazione" type="text" name="indirizzo" value=<%=fatturazione.getIndirizzo() %> placeholder="Indirizzo" readonly/><br><br>
			   				<%} %>
			   				<small></small>
			    		</div>
			   			<input type="button" class="bottone" id="editClick4" value="Modifica">
			   			<input type="submit" class="bottone" id="salvaInfo4" value="Salva" onclick="checkThirdField()">
		 	 			<input type="hidden" id="tipo" value="rubrica_indirizzi">
		 	 		</div>
		 	 		</form>
		 		 </div> 
		 		 <div class="testo">
		 		 	<div id="Ordini" hidden="hidden">
		 		 		<table>
		 		 			<tr>
		 		 				<th>Nome prodotto</th>
		 		 				<th>Numero dell'ordine</th>
		 		 				<th>Prezzo al momento dell'acquisto</th>
		 		 			</tr>
		 		 		<% OrdineImpl oi=new OrdineImpl();
		 		 		   for(OrdineBean ob:oi.getAllUserOrdine(ub.getUsername())){%>
		 		 			   <%ArrayList<ArticoliBean> al=ci.getCarrello(ob);
		 		 			   for(ArticoliBean ab:al){%>
		 		 			   <tr>
		 		 				    <td><a id=<%=ab.getCodiceA()%> onclick="redirectProdotto(this.id)"><%=ab.getNome()%></a></td>
		 		 			  		<td><%=ob.getNumOrdine() %></td>
		 		 			  		<td><%=ci.getPrezzoStorico(ob, ab) %></td>
		 		 			   </tr> 
		 		 			   <%}
		 		 		   }%>
		 		 		</table>
		 		 	</div>
		 		 </div> 
		 		  <div class="testo">
		 		 	<div id="Preno" hidden="hidden">
		 		 		<table>
		 		 			<tr>
		 		 				<th>Articoli prenotati</th>
		 		 			</tr>
		 		 			<%for(ArticoliBean ab:ci.getAllPrenotazioni(ub.getUsername())){ %>
		 		 				<tr>
		 		 					<td><%=ab.getNome()%></td>
		 		 				</tr>
		 		 			<%}%>
		 		 		</table>
		 		 	</div>
		 		 </div> 
		 		 <div class="testo">
		 		 <%if(ub.getRuolo().equals("admin")){%>
		 		 	<div id="Utenti" hidden="hidden">
		 		 		<ul id="listU">
                    		<%UserImpl ui=new UserImpl();
                    		  for(UserBean use:ui.getAllUser()){%>
                    				<li><%use.getUsername(); %></li>  
                    		  <% }%>
                    	</ul>
		 		 	</div>
		 		 	 <% }%>
		 		 </div>
		 		 <div class="testo">
		 		  <%if(ub.getRuolo().equals("admin")){%>
		 		 	<div id="Prodotti" hidden="hidden">
                    	<ul id="listP">
                    		<%ArticoliImpl aP=new ArticoliImpl();
                    		  for(ArticoliBean ab:aP.getAllArticoli()){%>
                    				<li><%ab.getNome();%></li>  
                    		  <% }%>
                    	</ul>
		 		 	</div>
		 		 	<% }%>
		 		 </div>
		 		  <div class="testo">
		 		  <%if(ub.getRuolo().equals("admin")){%>
		 		 	<div id="Lordini" hidden="hidden">
                    	
		 		 	</div>
		 		 	<% }%>
		 		 </div>
		 		  <div class="testo">
		 		  <%if(ub.getRuolo().equals("admin")){%>
		 		 	<div id="Lprenotazioni" hidden="hidden">
                    	<table>
		 		 			<tr>
		 		 				<th>Articoli prenotati dagli utenti</th>
		 		 			</tr>
		 		 			<%UserImpl ui=new UserImpl();
                    		  for(UserBean use:ui.getAllUser()){
		 		 				for(ArticoliBean ab:ci.getAllPrenotazioni(use.getUsername())){%>
		 		 				<tr>
		 		 					<td><%=use.getUsername() %>
		 		 					<td><%=ab.getNome()%></td>
		 		 				</tr>
		 		 			<%}%>
		 		 		</table>
		 		 	</div>
		 		 	<%}}%>
		 		 </div>
          	</div>
		</div>
	
<!-- Script per visualizzare solo il tab selezionato -->
<script>
$(document).ready(function(){
	  $("#Panoramica").click(function(){
		   $("#Panorama").show();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		   $("#Utenti").hide();
		   $("#Prodotti").hide();
		   $("#Ordini").hide();
		   $("#Preno").hide();
		   $("#Lordini").hide();
		   $("#Lprenotazioni").hide();
		});
});

$(document).ready(function(){
	  $("#Dati_Account").click(function(){
		   $("#Panorama").hide();
		   $("#Account").show();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		   $("#Ordini").hide();
		   $("#Preno").hide();
		   $("#Utenti").hide();
		   $("#Prodotti").hide();
		   $("#Lordini").hide();
		   $("#Lprenotazioni").hide();
		});
});

$(document).ready(function(){
	  $("#Dati_personali").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").show();
		   $("#Spedizione").hide();
		   $("#Ordini").hide();
		   $("#Preno").hide();
		   $("#Utenti").hide();
		   $("#Prodotti").hide();
		   $("#Lordini").hide();
		   $("#Lprenotazioni").hide();
		});
});

$(document).ready(function(){
	  $("#Dati_spedizione").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").show();
		   $("#Ordini").hide();
		   $("#Preno").hide();
		   $("#Utenti").hide();
		   $("#Prodotti").hide();
		   $("#Lordini").hide();
		   $("#Lprenotazioni").hide();
		});
});

$(document).ready(function(){
	  $("#Ordini_effettuati").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		   $("#Ordini").show();
		   $("#Preno").hide();
		   $("#Utenti").hide();
		   $("#Prodotti").hide();
		   $("#Lordini").hide();
		   $("#Lprenotazioni").hide();
		});
});

$(document).ready(function(){
	  $("#Prenotazioni").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		   $("#Ordini").hide();
		   $("#Preno").show();
		   $("#Utenti").hide();
		   $("#Prodotti").hide();
		   $("#Lordini").hide();
		   $("#Lprenotazioni").hide();
		});
});

$(document).ready(function(){
	  $("#Lista_Utenti").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		   $("#Ordini").hide();
		   $("#Preno").hide();
		   $("#Utenti").show();
		   $("#Prodotti").hide();
		   $("#Lordini").hide();
		   $("#Lprenotazioni").hide();
		});
});

$(document).ready(function(){
	  $("#Lista_prodotti").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		   $("#Ordini").hide();
		   $("#Preno").hide()
	       $("#Utenti").hide();
		   $("#Prodotti").show();
		   $("#Lordini").hide();
		   $("#Lprenotazioni").hide();
		});
});

$(document).ready(function(){
	  $("#Lista_Ordini").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		   $("#Ordini").show();
		   $("#Preno").hide();
		   $("#Utenti").hide();
		   $("#Prodotti").hide();
		   $("#Lordini").show();
		   $("#Lprenotazioni").hide();
		});
});

$(document).ready(function(){
	  $("#Lista_Prenotazioni").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		   $("#Ordini").hide();
		   $("#Preno").hide();
		   $("#Utenti").hide();
		   $("#Prodotti").hide();
		   $("#Lordini").hide();
		   $("#Lprenotazioni").show();
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

<!-- Check Form -->
<script>
	const capField=document.getElementById("cap");
	const checkPasswordField=document.querySelector("#checkPassword");
	const cittaField=document.getElementById("citta");	
	const cognomeField=document.getElementById("cognome");
	const dateField=document.getElementById("date");
	const emailField=document.querySelector("#email");
	const emailInfoField=document.getElementById("#emailInfo");
	const formField=document.getElementById("form");
	const nomeField=document.getElementById("nome");
	const passwordField=document.querySelector("#password");
	const phoneField=document.querySelector("#phone");
	const smallUname=document.getElementById("smallUname");
	const userNameField=document.querySelector("#username");
	const spedField=document.getElementById("spedizione");
	const fattField=document.getElementById("fatturazione");
	
	function redirectProdotto(id){
		var path="Prodotto.jsp?id="+id;
		location.replace(path);
	}
	
	function checkFirstField(){
		checkUsername();
		let emailValid=checkEmail();
		let passwordValid=checkPassword();
		let checkPasswordValid=checkSecondPassword();
		let smallCheck=checkSmallUname();
		let valid= emailValid && checkPasswordValid && passwordValid && smallCheck;
		
		return valid;
	}
	
	function checkSmallUname(){
		return isEmpty(smallUname.innerHTML);
	}
	
	function checkSecondField(){
		let phoneValid=checkPhone();
		let nomeValid=checkNome();
		let cognomeValid=checkCognome();
		let cittaValid=checkCitta();
		let capValid=checkCap();
		let dateValid=checkDate();
		
		return phoneValid && nomeValid && cognomeValid && cittaValid && capValid && dateValid;
	}
	
	function checkThirdField(){
		let sped = checkSped();
		let fatt = checkFatt();
		return SpedValid && fattValid;
	}
	
	function checkSped(){
		if(isEmpty(spedField.value.trim())){
			showError(spedField,"Qual è il tuo indirizzo di spedizione?");
			return false;
		}else{
			showSuccess(spedField);
			return true;
		}
	}
	
	function checkFatt(){
		if(isEmpty(spedField.value.trim())){
			showError(fattField,"Qual è il tuo indirizzo di fatturazione?");
			return false;
		}else{
			showSuccess(fattField);
			return true;
		}
	}
	
	function readJson(listJSON){
		var json = JSON.parse(listJSON) 
		var result=json.usernameInfo;
		
		if(result=="Username già preso"){
			showError(userNameField,result);
		}else if(result=="Username disponibile" ){
			showSuccess(userNameField);
		}else if(result=="Inserisci username"){
			showError(userNameField,result);
		}else if(result=="Non ci sono utenti registrati"){
			showSuccess(userNameField);
		}
	}
	
	function checkUsername(){
		var id="smallUname";
		var url="/games_basement/AjaxUsername";
		var param=userNameField.value.trim();
		var param2=userNameField.value.trim();
		var timeout=0;
		
		ajaxCall(id, url, readJson, param, param2, timeout);
	}
	
	function isEmpty(value){
		if(value==='')
			return true;
		else
			return false;
	}
	
	function isValidEmail(email){
		var regex=/[\w-\.]+@([\w-]+\.)+[\w-]{2,4}/g;
		
		return email.match(regex);
	}
	
	function isValidPassword(password){
		var regex=/^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$/g;
		
		return password.match(regex);
	}
	
	function isValidPhone(phone){
		/*
			(123) 456-7890
			+(123) 456-7890
			+(123)-456-7890
			+(123) - 456-7890
			+(123) - 456-78-90
			123-456-7890
			123.456.7890
			1234567890
			+31636363634
			075-63546725
		*/
		var regex=/^[+]*[(]{0,1}[0-9]{1,3}[)]{0,1}[-\s\./0-9]*$/g;
		
		return phone.match(regex);
	}
	
	function showError(inputField,messageError){
		var formField = inputField.parentElement; //accendo all'elemento padre dell'input field
		
		// aggiungo la classe "error" all'input
	    formField.classList.remove('success');
	    formField.classList.add('error');
	    
	    var error = formField.querySelector('small');//accedo al field dove visualizzerò il messagio
	    error.textContent = messageError; //aggiungo il messaggio
		error.style.color="red";
	}
	
	function showSuccess(inputField){
		var formField = inputField.parentElement; //accendo all'elemento padre dell'input field
		
		// aggiungo la classe "success" all'input
	    formField.classList.remove('error');
	    formField.classList.add('success');
	    
	    var success=formField.querySelector('small');//accedo al field dell'errore
	    success.textContent = ''; //rimuovo il messaggio di errore dall'input field
	}
	
	function checkEmail(){
		let valid = false;
	    const email = emailField.value.trim();
	    if (isEmpty(email)) {
	        showError(emailField, 'Inserisci una email.');
	    } else if (!isValidEmail(email)) {
	        showError(emailField, 'Email non valida.')
	    } else {
	        showSuccess(emailField);
	        valid = true;
	    }
	    return valid;
	}
	
	function checkNome(){
		if(isEmpty(nomeField.value.trim())){
			showError(nomeField,"Qual è il tuo nome?");
			return false;
		}else{
			showSuccess(nomeField);
			return true;
		}
	}
	
	function checkCognome(){
		if(isEmpty(cognomeField.value.trim())){
			showError(cognomeField,"Qual è il tuo cognome?");
			return false;
		}else{
			showSuccess(cognomeField);
			return true;
		}
	}
	
	function checkCitta(){
		if(isEmpty(cittaField.value.trim())){
			showError(cittaField,"Dove abiti?");
			return false;
		}else {
			showSuccess(cittaField);
			return true;
		}
	}
	
	function checkCap(){
		if(isEmpty(capField.value.trim())){
			showError(capField,"Inserisci un CAP.");
			return false;
		}else{
			showSuccess(capField);
			return true;
		}
	}
	
	function checkDate(){
		if(isEmpty(dateField.value)){
			return false;
		}else{
			showSuccess(dateField);
			return true;
		}
	}
	
	function checkPassword(){
		let valid = false;

		const password = passwordField.value.trim();
		    
		if (isEmpty(password)) {
			showError(passwordField, 'Inserisci una password.');
		} else if (!isValidPassword(password)) {
			showError(passwordField,'Inserire almeno 1 carattere maiuscolo,1 minuscolo,1 carattere numerico e 1 di questi caratteri(!@#$%^&*)');
		} else {
			showSuccess(passwordField);
			valid = true;
		}

		return valid;
	}
	
	function checkPhone(){
		let valid=false;
		
		const phone=phoneField.value.trim();
		
		if(isEmpty(phone)){
			showError(phoneField,'Inserisci un numero di telefono,');
		}else if(!isValidPhone(phone)){
			showError(phoneField,'Inserisci un numero di telefono valido.');
		}else{
			showSuccess(phoneField);
			valid=true;
		}
		return valid;
	}
	
	function checkSecondPassword(){
		let valid=false;
		
		var toCheck=passwordField.value.trim();
		var check=checkPasswordField.value.trim();
		
		if(isEmpty(check)){
			showError(checkPasswordField,"Reinserisci la password.");
		}else if(toCheck !== check){
			showError(checkPasswordField,"Le password non corrispondono.");
		}else{
			valid=true;
			showSuccess(checkPasswordField);
		}
		
		return valid;
	}
	
	
</script>
</body>
</html>