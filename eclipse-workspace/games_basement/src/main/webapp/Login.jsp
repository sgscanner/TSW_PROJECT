<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style><%@include file="css/Login.css"%></style>
</head>
<body>
	<div class="container">
		<form class="form_login" action="HomePage.html" method="POST">
			<h4>Inserisci le tue informazioni</h4>
				<!-- Username -->
				<div class="form-group"> 
					<label>Username</label>&nbsp;
					<input type="text" name="username" placeholder="Inserisci username"><br>
					<p id="checkUsername"></p>
				</div>
				
				<!-- Password -->
				<div class="form-group">
					<label>Password</label>&nbsp;<input type="password" name="password" placeholder="Inserisci password"><br>
				</div>
				
				<!-- Buttons -->
				<div class="form-group">
					<input type="submit" value="Login">&nbsp;
					<input type="reset" value="Clear">&nbsp;
					Non ancora un utente?<a href="Register.jsp">Registrati!</a>
				</div>
		</form>
	</div>
	<footer>
		<a href="HomePage.html" >Home</a>
	</footer>
<script>
	

</script>	
</body>
</html>