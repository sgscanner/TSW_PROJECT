<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style><%@include file="Login.css"%></style>
</head>
<body>
	<div class="content">
	<form id="form_login">
	<fieldset>
	<legend>Information about you</legend>
		<label>Username</label>&nbsp;<input type="text" name="username" placeholder="Enter username"><br>
		<label>Password</label>&nbsp;<input type="password" name="password" placeholder="Enter password"><br>
	</fieldset>
		<button type="button" formmethod="POST" formaction="#">Login</button>
		<button type="button" formmethod="POST" formaction="#">Clear Fields</button>
	</form>
	</div>
</body>
</html>