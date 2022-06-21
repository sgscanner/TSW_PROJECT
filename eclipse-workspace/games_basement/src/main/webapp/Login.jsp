<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style><%@include file="css/Login.css"%></style>
<script src="ajax/ajaxJSON.js"></script>
</head>
<body>
	
	<form id="form" class="form_login" action="LoginServlet" method="POST">
		<fieldset>
			<h2 class="fs-title">Login</h2> 
			
			    <div id="inputContainer">
			    	<input type="text" id="username" name="username" placeholder="Username" />
			    	<small id="smallUname"></small>
			    </div>
			    
			    <div id="inputContainer">
			    	<input type="password" id="password" name="password" placeholder="Password" />
			    	<small id="smallPwd" ></small>
			    </div>
			    
			    <input type="submit"  class="button" value="Login" />
			    
			    <a href="HomePage.jsp"><img src="img/logo.png" width="150 px" height="100 px"></a>
	 	 </fieldset>
	</form>

<script>
	const userNameField=document.querySelector("#username");
	const passwordField=document.querySelector("#password");
	const formField=document.getElementById("form");
	const smallUname=document.getElementBydId("smallUname");
	const smallPwd=document.getElementBydId("smallPwd");
	
	formField.addEventListener('submit',function(e){
		//al submit della form lo prevengo per fare un check degli input che vanno controllati
		e.preventDefault();
		
		checkUsername();
		checkPwd();
		
		if(isEmpty(smallUname.innerHTML) && isEmpty(smallPwd.innerHTML)){
			formField.submit();
		}
	});
	
	function unameJson(listJSON){
		var json = JSON.parse(listJSON) 
		var result = json.usernameInfo;
			
		if(result=="Username già preso"){
			validUname(false);
			showError(userNameField,result);
		}else if(result=="Username disponibile" ){
			validUname(true);
			showSuccess(userNameField);
		}else if(result=="Inserisci username"){
			showError(userNameField,result);
		}else if(result=="Non ci sono utentti registrati"){
			showSuccess(userNameField);
		}
	}
	
	function pwdJson(listJson){
		var json = JSON.parse(listJson);
		var result = json.passwordInfo;
		if(result=="Inserisci password"){
			validPwd(false);
			showError(passwordField,result);
		}else if(result=="Password errata"){
			validPwd(true);
			showError(passwordField,result);
		}
	}
	
	function checkUsername(){
		var id="smallUname";
		var url="/games_basement/AjaxUsername";
		var param=userNameField.value.trim();
		var param2=userNameField.value.trim();
		var timeout=0;
		
		ajaxCall(id, url, unameJson, param, param2, timeout);
	}
	
	function checkPwd(){
		var id="smallPwd";
		var url="/games_basement/AjaxPwd";
		var param=userNameField.value.trim();
		var param2=passwordField.value.trim();
		var timeout=0;
		
		ajaxCall(id, url, pwdJson, param, param2, timeout);
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
	
</script>	
</body>
</html>