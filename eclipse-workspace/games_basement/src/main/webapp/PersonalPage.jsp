<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="bean.UserBean"%>
 <%@page import="bean.DatiAnagraficiBean"%>
 <%@page import="bean.RubricaIndirizziBean"%>
 <%@page import="bean.ArticoliBean" %>
<%@page import="implementation.ArticoliImpl" %>
<%@page import="implementation.UserImpl" %>
<%@page import="implementation.DatiAnagrificiImpl" %>
<%@page import="implementation.RubricaIndirizziImpl" %>
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
<%UserBean ub=(UserBean)request.getSession().getAttribute("user"); %>
<%if(ub==null){
	request.getRequestDispatcher("ErrorRole.jsp").forward(request,response);
}
%>
<%DatiAnagrificiImpl dai = new DatiAnagrificiImpl();
	DatiAnagraficiBean dab = dai.searchDatiAnagrafici(ub.getUsername());
%>
<%RubricaIndirizziImpl ri = new RubricaIndirizziImpl();
	RubricaIndirizziBean rib = ri.searchRubrica(ub.getUsername());
%>
<form id="form" action="PersonalPageServlet" method="POST" onsubmit="event.preventDefault();">
	<div class="contenitore">
		<div class="container">
			<div class="content">
				<input type="radio" name="slider" id="Panoramica">
      			<input type="radio" name="slider" id="Dati_Account">
      			<input type="radio" name="slider" id="Dati_personali">
      			<input type="radio" name="slider" id="Dati_spedizione">
      			<input type="radio" name="slider" id="Lista_Utenti">
      			<input type="radio" name="slider" id="Lista_Prodotti">
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
					<%if(ub.getRuolo().equals("admin")){ %>
					<label for="Lista_Utenti" class="Lista_Utenti">
						<span class="Topic">Lista utenti</span>
					</label>
					<label for="Lista_Prodotti" class="Lista_Prodotti">
						<span class="Topic">Lista prodotti</span>
					</label>
					<%} %>
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
						<h3>Ciao <%=ub.getUsername()%>!<br> Qui puoi modificare le informazioni del tuo profilo.</h3><br>
					</div>
				</div>
				<div class="testo">
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
	  						<input class="testo2" type="password" id="password" name="password" value="<%=ub.getPassword()%>" placeholder="Password" readonly/><br><br>
	   						<small></small>	
	  					</div>
	    				<div class="inputContainer">
	    					<label for="checkPassword">Conferma password:</label>
	    					<input class="testo2" type="password" id="checkPassword" name="checkPassword" value="<%=ub.getPassword()%>ub.getPassword()" placeholder="Confirm password" readonly />
	    					<br><br>
	    					<small></small>
	    				</div>
	    				<input type="button" class="bottone" id="editClick1" value="modifica">
						<input type="submit" class="bottone" id="salvaInfo1" value="salva" onclick="checkFirstField()">
					</div>
				</div>
				<div class="testo">
					<div id="Anagrafici" hidden="hidden">
						<h2 class="titolo">Dati Anagrafici</h2><br>
						<div class="inputContainer">
							<label for="nome">Nome:</label>
		    				<input class="testo3" type="text" id="nome" name="nome" value="<%=dab.getNome()%>" placeholder="nome" autocomplete="false" readonly/><br><br>
		    				<small></small>
		    			</div>
			    		<div class="inputContainer">
			    			<label for="cognome">Cognome:</label>
			    			<input class="testo3" type="text" class="testo3" id="cognome" name="cognome" value="<%=dab.getCognome()%>" placeholder="cognome" autocomplete="false" readonly/><br><br>
			    			<small></small>
			   			</div>
			    		<div class="inputContainer">
			    			<label for="phone">Numero di telefono:</label>
			    			<input class="testo3" type="text" id="phone" name="phone" value="<%=dab.getTelefono()%>" placeholder="Numero di Telefono" readonly/><br><br>
			    			<small></small>
			    		</div>
			    			<div class="inputContainer">
			    			<label for="città">Città:</label>
			   				<input class="testo3" id="città" type="text" name="citta" value="<%=dab.getCitta()%>" placeholder="Città" readonly/><br><br>
			   				<small></small>
			    		</div>
			   			<div class="inputContainer"> 
			   				<label for="cap">CAP:</label>
			   				<input class="testo3" id="cap" type="text" name="cap" value="<%=dab.getcap()%>" placeholder="Cap" readonly/><br><br>
			   				<small></small>
		   	 			</div>
		    			<div class="inputContainer">
		    				<label for="data">Data di nascita:</label>
		    				<input class="testo3" id="data" type="date" value="<%=dab.getDataNascita()%>" name="bday" readonly/><br><br>
		    				<small></small>
		    			</div>
		  				<input type="button" class="bottone" id="editClick3" value="modifica">
		   				<input type="submit" class="bottone" id="salvaInfo3" value="salva" onclick="checkSecondField()">
		 	 		</div>  
				</div>
				<div class="testo">
					<div id="Spedizione"  hidden="hidden">
		  				<h2 class="titolo">Dati spedizione</h2><br>
			    		<div class="inputContainer">
			    			<label for="indirizzo1">Indirizzo di spedizione:</label>
			    			<input class="testo4" id="indirizzo1" type="text" name="indirizzo" value="<%=rib.getIndirizzo()%>" placeholder="Indirizzo" readonly/><br><br>
			    			<small></small>
			    		</div>
			   			<div class="inputContainer">
			   				<label for="indirizzo2">Indirizzo di fatturazione:</label>
			   				<input class="testo4" id="indirizzo2" type="text" name="indirizzo" value="<%=rib.getIndirizzo()%>" placeholder="Indirizzo" readonly/><br><br>
			   				<small></small>
			    		</div>
			   			<input type="button" class="bottone" id="editClick4" value="modifica">
			   			<input type="submit" class="bottone" id="salvaInfo4" value="salva" onclick="checkThirdField()">
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
                    				<li><%ab.getNome(); %></li>  
                    		  <% }%>
                    	</ul>
		 		 	</div>
		 		 	<% }%>
		 		 </div>
          	</div>
		</div>
	</form>
	
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
		});
});

$(document).ready(function(){
	  $("#Dati_Account").click(function(){
		   $("#Panorama").hide();
		   $("#Account").show();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		   $("#Utenti").hide();
		   $("#Prodotti").hide();
		});
});

$(document).ready(function(){
	  $("#Dati_personali").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").show();
		   $("#Spedizione").hide();
		   $("#Utenti").hide();
		   $("#Prodotti").hide();
		});
});

$(document).ready(function(){
	  $("#Dati_spedizione").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").show();
		   $("#Utenti").hide();
		   $("#Prodotti").hide();
		});
});

$(document).ready(function(){
	  $("#Lista_Utenti").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		   $("#Utenti").show();
		   $("#Prodotti").hide();
		});
});

$(document).ready(function(){
	  $("#Lista_prodotti").click(function(){
		   $("#Panorama").hide();
		   $("#Account").hide();
		   $("#Anagrafici").hide();
		   $("#Spedizione").hide();
		   $("#Utenti").hide();
		   $("#Prodotti").show();
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
	const cittaField=document.getElementById("città");
	const cognomeField=document.getElementById("cognome");
	const dateField=document.getElementById("date");
	const indirizzo1Field=document.getElementbyId("indirizzo1");
	const indirizzo2Field=document.getElementById("indirizzo2");
	const emailField=document.querySelector("#email");
	const emailInfoField=document.getElementById("#emailInfo");
	const formField=document.getElementById("form");
	const nomeField=document.getElementById("nome");
	const passwordField=document.querySelector("#password");
	const phoneField=document.querySelector("#phone");
	const smallUname=document.getElementById("smallUname");
	const userNameField=document.querySelector("#username");
	
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
		let valid= phoneValid && nomeValid && cognomeValid && cittaValid && capValid && dateValid;
		
		if(valid){
			formField.submit();
		}
		return phoneValid && nomeValid && cognomeValid;
	}
	
	function checkThirdField(){
		let fattValid=checkFatt();
		lef spedValid=checkSped();
		let valid= fattValid && spedValid;
		
		return valid;
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
		var formField = inputField.parentElement; //accedo all'elemento padre dell'input field
		
		// aggiungo la classe "error" all'input
	    formField.classList.remove('success');
	    formField.classList.add('error');
	    
	    var error = formField.querySelector('small');//accedo al field dove visualizzerò il messagio
	    error.textContent = messageError; //aggiungo il messaggio
		error.style.color="red";
	}
	
	function showSuccess(inputField){
		var formField = inputField.parentElement; //accedo all'elemento padre dell'input field
		
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
	
	function checkSped(){
		if(isEmpty(indirizzo1Field.value.trim())){
			showError(indirizzo1Field,"Inserisci un indirizzo di spedizione.");
			return false;
		}else{
			showSuccess(indirizzo1Field);
			return true;
		}
	}
	
	function checkFatt(){
		if(isEmpty(indirizzo2Field.value.trim())){
			showError(indirizzo2Field,"Inserisci un indirizzo di fatturazione.");
			return false;
		}else{
			showSuccess(indirizzo2Field);
			return true;
		}
	}
	
</script>
</body>
</html>