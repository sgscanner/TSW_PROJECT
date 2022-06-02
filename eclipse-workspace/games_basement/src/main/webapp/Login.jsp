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
		<form id="msform" class="form_login" action="LoginServlet" method="POST">
			<fieldset>
			    <h2 class="fs-title">Login</h2>
			    <input type="text" id="username" name="username" placeholder="Username" />
			    <input type="password" id="password" name="password" placeholder="Password" />
			   	<a href="Register.jsp"><button class="button">Registrati</button></a>
			    <input type="button" name="next" class="button" value="Login" />
	 	 	</fieldset>
		</form>
	</div>
<script>
	

</script>	
</body>
</html>