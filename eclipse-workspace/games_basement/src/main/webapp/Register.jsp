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
<!-- multistep form -->
	<form id="msform" action="RegisterServlet" method="POST">
	  <!-- progressbar -->
	  <ul id="progressbar">
	    <li class="active">Account</li>
	    <li>Chi sei</li>
	    <li>Dati Anagrafici</li>
	  </ul>
	  <!-- fieldsets -->
	  <fieldset>
	    <h2 class="fs-title">Account</h2>
	    <input type="text" id="username" name="username" placeholder="Username" />
	    <input type="text" id="email" name="email" onkeyup="regexEmail()" placeholder="Email" />
	    <input type="password" id="password" name="password" onkeyup="validatePassword()" placeholder="Password" />
	    <input type="password" id="passwordDue" name="passwordDue" onkeyup="checkPassword()" placeholder="Confirm Password" />
	    <p id="alert"></p>
	    <input type="button" name="next" class="next action-button" value="Next" />
	  </fieldset>
	  <fieldset>
	    <h2 class="fs-title">Dati personali</h2>
		    <input type="text" id="nome" name="nome" placeholder="nome" />
		    <input type="text" id="cognome" name="cognome" placeholder="cognome" />
		    <input type="text" id="phone" name="phone" onchange="regexPhone(this.value)" placeholder="Numero di Telefono"  />
		    <span id="alert"></span>
		    <input type="button" name="previous" class="previous action-button" value="Previous" />
		    <input type="button" name="next" class="next action-button" value="Next" />
	  </fieldset>
	  <fieldset>
	    <h2 class="fs-title">Dati Anagrafici</h2>
		    <input type="text" name="citta" placeholder="Città" />
		    <input type="text" name="cap" placeholder="Cap" />
		    <input type="date" name="bday" />
		    <span id="alert"></span>
		    <input type="button" name="previous" class="previous action-button" value="Previous" />
		    <input type="submit" name="submit" class="submit action-button" value="Submit" />
	  </fieldset>
<script>
	function checkPassword(){
		var firstPassword=document.getElementById("password").value;
		var secondPassword=document.getElementById("passwordDue").value;
		
		if(firstPassword == secondPassword){
			document.getElementById("alert").style.color="#8CC63E";
			document.getElementById("alert").innerHTML='<span>Le password corrispondono!</span>';
		}else{
			document.getElementById("alert").style.color="#EE2B39";
			document.getElementById("alert").innerHTML='<span>Le password non corrispondono!</span>';
		}
	}

	function regexEmail(email){
		/*someText@someEmail.com(o un dominio compreso fra 2 e 4 caratteri)*/
		var regex=/\w+@\w+\.\w{2,4}/i;
		var result=email.match(regex);
		
		if(!result){
			document.getElementById("alert").style.color="#EE2B39";
			document.getElementById("alert").innerHTML="<span>Inserisci una email corretta.</span>";
		}else{
			document.getElementById("alert").innerHTML="";
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
			document.getElementById("alert").style.color="#EE2B39";
			document.getElementById("alert").innerHTML='<span>Numero di telefono non valido</span>';
		}else{
			document.getElementById("alert").innerHTML='';
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
			document.getElementById("alert").innerHTML="La password è corta e non contiene caratteri speciali";
		}else if(length>=8 && !pwd.match(specialRegex)){
			document.getElementById("alert").innerHTML="La password non contiene caratteri speciali";
		}else if(length>=8 && pwd.match(specialRegex)){
			document.getElementById("alert").innerHTML="Password forte";
		}
	}
	
	//jQuery time
	var current_fs, next_fs, previous_fs; //fieldsets
	var left, opacity, scale; //proprietà dei fieldset che andremo ad animare
	var animating; //flag per evitare dei click troppo veloci

	$(".next").click(function () {
	  if (animating) return false;
	  animating = true;

	  //assegno i fieldset "attuale" e "successivo" accedendo al tag "padre" di entrambi
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
</body>
</html>