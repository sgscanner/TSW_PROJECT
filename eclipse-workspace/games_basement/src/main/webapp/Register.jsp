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

		<form class="register_form" action="HomePage.html" method="post" id="contact_form" name="regForm">
			<h4>Dati Personali</h4><br>

				<!-- Nome-->

				<div class="form-group">
					<label>Nome</label><br>
					<input type="text" placeholder="Inserisci il tuo nome" id="Nome">
				</div>

				<!-- Cognome-->

				<div class="form-group">
					<label >Cognome</label><br>
					<input type="text" placeholder="Inserisci il tuo cognome" id="Cognome">
				</div> 

				<!-- Username-->

				<div class="form-group">
					<label >Username</label><br>
					<input type="text" placeholder="Scegli un username!" id="Username">
				</div> 

				<!-- Password-->

				<div class="form-group">
					<label >Password</label><br>
					<input type="password" placeholder="Inserisci la tua password" id="Password">
				</div> 

				<!-- Text input-->

				<div class="form-group">
					<label >Confirm Password</label><br>
					<input type="password" placeholder="Reinserisci la tua password" id="PasswordDue">
				</div> 

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">E-Mail</label><br>
					<input type="email" placeholder="Inserisci la tua e-mail" id="email">					
				</div> 


				<!-- Num. Telefono-->

				<div class="form-group">
					<label >Numero di Telefono</label><br>
					<input type="text" id="phone" onchange="checkPhone(this.value)" placeholder="Inserisci numero telefono">
				</div> 

				<!-- BDay -->
				<div class="form-group">
					<label>Data di nascita</label><br>
					<input type="date" placeholder="01/01/1901">
				</div> 
				
				<!-- Residenza -->
				<div class="form-group">
					<label>Indirizzo Residenza</label><br>
					<input type="text" placeholder="Via Roma 01">
				</div> 

				<!-- CAP -->
				<div class="form-group">
					<label>CAP</label><br>
					<input type="text" placeholder="00000">
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
			<img src="img/logo.jpeg" alt="Logo failed to load" style="width:150px;hiehgt:150px;">
		</a>
	</footer>
<script type="text/javascript">
	function checkPhone(phone){
		/*(123) 456-7890
		  (123)456-7890
		  123-456-7890
		  123.456.7890
		  1234567890
		  +31636363634
		  075-63546725*/
		var reg = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
	    var result=phone.match(reg);
	    if (result) {
	        console.log("(true)phone  "+phone);
	        return (true)
	    } else {
	        console.log("(error)phone "+phone);

	    }
	}
</script>
</body>
</html>