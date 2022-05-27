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
</head>
<body>

	<div class="container">

		<form class="register_form" action="RegisterServlet" method="post" id="contact_form" name="regForm">
			<h4>Dati Personali</h4><br>

				
				<div class="form-group">
					<!-- Nome -->
					<input type="text" placeholder="Inserisci il tuo nome" id="Nome">
					<!-- Cognome -->
					<input type="text" placeholder="Inserisci il tuo cognome" id="Cognome">
					
					<!-- Numero Telefono -->
					<input type="text" id="phone" onchange="regexPhone(this.value)" placeholder="Inserisci numero telefono">
					<p id="checkPhone"></p>
				
					<!-- BDAY -->
					<input type="date" placeholder="01/01/1901">
					
					<!-- Residenza -->
					<input type="text" placeholder="Via Roma 01">
					
					<!-- Cap -->
					<input type="text" placeholder="CAP">
				</div>
			
				<div class="form-group">
				<!-- Password -->
					<input type="password" onkeyup="validatePassword()" placeholder="Inserisci la tua password" id="password">
					<img src="img/eyeClose.png" width="30" height="25" id="eye" onclick="showPwd()">
					<p id="strongPwd"></p>
				</div>
			
			
				<div class="form-group">
					<!--  Username -->
					<input type="text" placeholder="Scegli un username!" id="Username">
				
					<!-- CheckPassword -->
					<input type="password" placeholder="Reinserisci la tua password" id="passwordDue" onkeyup="checkPassword()">
					<p id="alertPassword">
					<!-- Email-->	
					<input type="email" onchange="regexEmail(this.value)" placeholder="Inserisci la tua e-mail" id="email">	
					<p id="checkEmail"></p>		
				</div> 
				
				<!-- Button -->
				<div class="form-group">
					<input type="submit" value="Registrati!">&nbsp;
					<input type="reset" value="Clear All">&nbsp;
					Già registrato?<a href="Login.jsp">Clicca qui!</a>
				</div>
		</form>
	</div><br>
	<footer>
		<a href="HomePage.html">
			<img src="img/logo.jpeg" alt="Logo failed to load" style="width:150px;heihgt:150px;">
		</a>
	</footer >
<script>
	function checkPassword(){
		var firstPassword=document.getElementById("password").value;
		var secondPassword=document.getElementById("passwordDue").value;
		
		if(firstPassword == secondPassword){
			document.getElementById("alertPassword").style.color="#8CC63E";
			document.getElementById("alertPassword").innerHTML='<span>Le password corrispondono!</span>';
		}else{
			document.getElementById("alertPassword").style.color="#EE2B39";
			document.getElementById("alertPassword").innerHTML='<span>Le password non corrispondono!</span>';
		}
	}

	function regexEmail(email){
		/*someText@someEmail.com(o un dominio compreso fra 2 e 4 caratteri)*/
		var regex=/\w+@\w+\.\w{2,4}/i;
		var result=email.match(regex);
		
		if(!result){
			document.getElementById("checkEmail").style.color="#EE2B39";
			document.getElementById("checkEmail").innerHTML="<span>Inserisci una email corretta.</span>";
		}else{
			document.getElementById("checkEmail").innerHTML="";
		}
	}
	
	function regexPhone(phone){
		/*(123) 456-7890
		  (123)456-7890
		  123-456-7890
		  123.456.7890
		  1234567890
		  +31636363634
		  075-63546725*/
		var reg = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
	    var result=phone.match(reg);
	
		if(!result){
			document.getElementById("checkPhone").style.color="#EE2B39";
			document.getElementById("checkPhone").innerHTML='<span>Numero di telefono non valido</span>';
		}else{
			document.getElementById("checkPhone").innerHTML='';
		}
	}
	
	function showPwd(){
		var pwd=document.getElementById("password");
		var img=document.getElementById("eye");
		
		if(pwd.getAttribute("type")==="password"){
			pwd.setAttribute("type","text");
			img.src="img/eye.png";
		}else{
			pwd.setAttribute("type","password");
			img.src="img/eyeClose.png";
		}
	}
	
	function validatePassword(){
		var pwd=document.getElementById("password").value;
		var specialRegex=/\W|_/;
		var length=pwd.length;
		
		if(length<=8 && !pwd.match(specialRegex)){
			document.getElementById("strongPwd").innerHTML="La password è corta e non contiene caratteri speciali";
		}else if(length>=8 && !pwd.match(specialRegex)){
			document.getElementById("strongPwd").innerHTML="La password non contiene caratteri speciali";
		}else if(length>=8 && pwd.match(specialRegex)){
			document.getElementById("strongPwd").innerHTML="Password forte";
		}
	}
	
</script>
</body>
</html>