<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
<%@ include file="css/Register.css" %>
</style>
<head>
<meta charset="UTF-8">
<title>Registrazione</title>
<!-- import delle librerie utili -->
<script src="jQuery/jquery.js"></script>
<script src='jQuery/jquery-ui.min.js'></script>
</head>
<body>

	<form id="form" action="RegisterServlet" method="POST">
		  
		  <!-- progressbar -->
		  <ul id="progressbar">
		    <li class="active">Account</li>
		    <li>Chi sei</li>
		    <li>Dati Anagrafici</li>
		  </ul>
	
		  <fieldset id="firstField">
		    <h2 class="fs-title">Account</h2>
		    <div class="inputContainer" id="usernameDiv">
		    	<input type="text" id="username" name="username" placeholder="Username" autocomplete="false"/>
		    	<small id="smallUname"></small>
		    </div>
		    <div class="inputContainer">
		    	<input type="text" id="email" name="email" placeholder="Email" /><br>
		    	<small></small>
		    </div>
		    <div class="inputContainer">
		  	 	<input type="password" id="password" name="password" placeholder="Password" />
		  	 	<small></small>
		    </div>
		    <div class="inputContainer">
		    	<input type="password" id="checkPassword" name="checkPassword" placeholder="Confirm Password" />
		    	<small></small>
		    </div>
			<button class="action-button" name="login" id="LogButton" >Login</button>
		    <input type="button" name="next" class="next action-button" value="Next" />
		    <a href="HomePage.jsp"><img src="img/logo.png" width="150 px" height="100 px"></a>
		  </fieldset>
		  
		  <fieldset id="secondField">
		    <h2 class="fs-title">Dati personali</h2>
		    	<div class="inputContainer">
		    		<input type="text" id="nome" name="nome" placeholder="nome" autocomplete="false"/>
		    		<small></small>
		    	</div>
			    <div class="inputContainer">
			    	<input type="text" id="cognome" name="cognome" placeholder="cognome" autocomplete="false"/>
			    	<small></small>
			    </div>
			    <div class="inputContainer">
			    	<input type="text" id="phone" name="phone" placeholder="Numero di Telefono"  />
			    	<small></small>
			    </div>
			    <input type="button" name="previous" class="previous action-button" value="Previous" />
			    <input type="button" name="next" class="next action-button" value="Next" />
			    <a href="HomePage.jsp"><img src="img/logo.png" width="150 px" height="100 px"></a>
		  </fieldset>
		  
		  <fieldset id="thirdField">
		    <h2 class="fs-title">Dati Anagrafici</h2>
			    <div class="inputContainer">
			    	<input type="text" name="citta" placeholder="Città" autocomplete="false"/>
			    	<small></small>
			    </div>
			    <div class="inputContainer"> 
			    	<input type="text" name="cap" placeholder="Cap" />
			    	<small></small>
			    </div>
			    <div class="inputContainer">
			    	<input type="date" name="bday" />
			    	<small></small>
			    </div>
			    <input type="button" name="previous" class="previous action-button" value="Previous" />
			    <input type="submit" name="invio-dati" class="submit action-button" value="Submit" />
			    <a href="HomePage.jsp"><img src="img/logo.png" width="150 px" height="100 px"></a>
		  </fieldset>
	
	</form>
	
<!-- Animazione -->
<script>
 var current_fs, next_fs, previous_fs; //fieldsets
	var left, opacity, scale; //proprietà dei fieldset che andremo ad animare
	var animating; //flag per evitare dei click troppo veloci

	$(".next").click(function () {
	  if (animating) return false;
	  animating = true;

	  //assegno i fieldset "attuale" e "successivo" accedendo al tag "padre" di entrambi i pulsanti
	  current_fs = $(this).parent();
	  next_fs = $(this).parent().next();

	  //attiva il prossimo step sulla progess-bar usando l'indice di next_fs
	  $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

	  //mostra il prossimo fieldset
	  next_fs.show();
	  
	  //nascondi il corrente
	  current_fs.animate(
	    { opacity: 0 },
	    {
	      step: function (now, mx) {
	        //1. riduci current_fs a 80%
	        scale = 1 - (1 - now) * 0.2;
	        //2. scorri next_fs dalla destra(50%)
	        left = now * 50 + "%";
	        //3. incrementa l'opacità del next_fs di 1 appena entra
	        opacity = 1 - now;
	        current_fs.css({
	          transform: "scale(" + scale + ")",
	          position: "absolute"
	        });
	        next_fs.css({ left: left, opacity: opacity });
	      },
	      duration: 800,
	      complete: function () {
	        current_fs.hide();
	        animating = false;
	      },
	      //default dal plugin 
	      easing: "easeInOutBack"
	    }
	  );
	});

	$(".previous").click(function () {
	  if (animating) return false;
	  animating = true;

	  current_fs = $(this).parent();
	  previous_fs = $(this).parent().prev();

	  
	  //rimuove di 1 dalla progress-bar
	  $("#progressbar li")
	    .eq($("fieldset").index(current_fs))
	    .removeClass("active");

	  //mostra il precendente
	  previous_fs.show();
	  //nascondi l'attuale con stile
	  current_fs.animate(
	    { opacity: 0 },
	    {
	      step: function (now, mx) {
	        //1. scala il precedente da 80% a 100%
	        scale = 0.8 + (1 - now) * 0.2;
	        //2. prendi il successivo da destra(50%) - a 0%
	        left = (1 - now) * 50 + "%";
	        //3.incrementa l'opacità del precedente di 1 appena entra
	        opacity = 1 - now;
	        current_fs.css({ left: left });
	        previous_fs.css({
	          transform: "scale(" + scale + ")",
	          opacity: opacity
	        });
	      },
	      duration: 800,
	      complete: function () {
	        current_fs.hide();
	        animating = false;
	      },
	      //come prima
	      easing: "easeInOutBack"
	    }
	  );
	});
</script>

<!-- Check Form -->
<script>
	const passwordField=document.querySelector("#password");
	const checkPasswordField=document.querySelector("#checkPassword");
	const emailField=document.querySelector("#email");
	const phoneField=document.querySelector("#phone");
	const userNameField=document.querySelector("#username");
	const formField=document.getElementById("form");
	
	document.getElementById("LogButton").onclick=function(){
		location.href="Login.jsp";
	};
	
	formField.addEventListener('submit',function(e){
		//al submit della form lo prevengo per fare un check degli input che vanno controllati
		e.preventDefault();

		//controllo i vari input necessari da controllare
		let emailValid=checkEmail();
		let passwordValid=checkPassword();
		let checkPasswordValid=checkSecondPassword();
		let phoneValid=checkPhone();
		
		let formValid=emailValid && passwordValid && checkPasswordValid && phoneValid;
		
		//ora che ho controllato tutto posso fare la submit
		if(formValid){
			formField.submit();
		}
	});
	
	function checkUsername(){
		var userName=userNameField.value.trim();
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
		    document.getElementById("txtHint").innerHTML = this.responseText;
		}
		xhttp.open("GET", "RegisterAjax?username="+userName);
		xhttp.send();
		xhttp.onreadystatechange=function(){
			if(xmlHttp.readyState==4)  {  
				document.form.firstField.usernameDiv.smallUname=xhttp.response.Text;			
			}
		};
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
			showSuccess(checkPasswordField);
			valid=true;
		}
		
		return valid;
	}
</script>
</body>
</html>