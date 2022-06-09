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
	<form id="form" class="form_login" action="LoginFilter" method="POST">
		<fieldset>
			<h2 class="fs-title">Login</h2> 
			
			    <div id="inputContainer">
			    	<input type="text" id="username" name="username" placeholder="Username" />
			    </div>
			    
			    <div id="inputContainer">
			    	<input type="password" id="password" name="password" placeholder="Password" />
			    	<small id="error"></small>
			    </div>
			    
			    <button class="button" id="RegButton" >Registrati</button>
			    <input type="submit"  class="button" value="Login" />
			    
			    <a href="HomePage.jsp"><img src="img/logo.png" width="150 px" height="100 px"></a>
	 	 </fieldset>
	</form>
<script>
	const username=document.querySelector("#username");
	const password=document.querySelector("#password");
	const form=document.querySelector("#form");

	document.getElementById("RegButton").onclick=function(){
		location.href="Register.jsp";
	}
	
	form.addEventListener('submit',function(e){
		//al submit della form lo prevengo per fare un check degli input che vanno controllati
		e.preventDefault();
		
		if(!isEmpty(username.value.trim()) && !isEmpty(password.value.trim())){
			var uNameVal=username.value.trim();
			var passwordVal=password.value.trim();
			
			
		}
	});
	
	function isEmpty(value){
		if(value==='')
			return true;
		else
			return false;
	}
</script>	
</body>
</html>