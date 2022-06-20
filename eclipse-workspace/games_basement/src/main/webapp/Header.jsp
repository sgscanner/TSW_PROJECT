<%@page import="bean.UserBean"%>
<%@page import="bean.ArticoliBean"%>
<%@page import="implementation.ArticoliImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
<%@include file="css/Header.css"%>
</style>
<script src="ajax/ajaxJSON.js"></script>
<script src="jQuery/jquery.js"></script>
<script src="jQuery/jquery-ui.min.js"></script>
<script>
	$("#search_option").hide();
	
	$(document).ready(function(){
		$("#input").on("keyup",function(){
			var value=$(this).val().toLowerCase();
			$("#search_option").filter(function(){
				if(value.lenght>1) $(this).toggle($(this).text().toLowerCase().indexOf(value)>-1);
				else  $(this).hide($(this).text().toLowerCase().indexOf(value)>-1);
			});
		});
	});
</script>
</head>
<body>
	<%UserBean ub=(UserBean)request.getSession().getAttribute("user"); %>
	<div class="topnav" id="myTopnav">
		<a href="#home" class="active">Home</a>
		
		<div class="dropdown">
			<button class="dropbtn">Articoli<i class="fa fa-caret-down"></i></button>
			
			<div class="dropdown-content">
				<a href="#">Nintendo</a>
				<a href="#">Playstation</a>
				<a href="#">Xbox</a>
			</div>
		</div>
		<div class="dropdown">
			<%if(ub == null){ %>
				<button class="dropbtn"> Guest <i class="fa fa-caret-down"></i></button>
				<div class="dropdown-content">
					<a href="Login.jsp">Login</a> 
					<a href="Register.jsp">Register</a> 
				</div>
			<%}else{%>
				<button class="dropbtn"> <%=ub.getUsername() %> <i class="fa fa-caret-down"></i></button>
				<div class="dropdown-content">
					<a href="PersonalPage.jsp">Area Personale</a> 
					<a href="Carrello.jsp">Carrello</a>
					<a href="LogoutServlet.java">Logout</a> 
				</div>
			<%} %>
			
		</div>
	</div>

	<div style="height: 10px;"></div>
</body>
</html>