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
			    <button class="button" formaction="Register.jsp" >Registrati</button>
			    <input type="button"  class="button" value="Login" />
			    <a href="HomePage.jsp"><img src="img/logo.png" width="150 px" height="100 px"></a>
	 	 	</fieldset>
		</form>
	</div>
<script>
	

</script>	
</body>
</html>