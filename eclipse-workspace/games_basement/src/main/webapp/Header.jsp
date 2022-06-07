<%@page import="bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<style><%@include file="css/Header.css" %></style>
</head>
 <body>
 		<%UserBean ub=(UserBean)request.getSession().getAttribute("user"); %>
 
        <div class="header">
            <nav>
                <img src="img/logo.png" class="logo">
                <form class="form">
                    <input type="text" placeholder="Search..." id="input" list="languages" autocomplete="off">
                    <datalist id="languages">
						  
					</datalist>
                    <input type="submit" value="Search">
                </form>	
                <ul class="nav-links">
                	<%if(ub==null){%>
                    	<li><a href="Login.jsp">Accedi</a></li>
                    <%}else{ %>
                    	<%System.out.println("username: "+ub.getUsername()); %>
						<li><a href="PersonalPage.jsp"><%=ub.getUsername() %></a></li>
                    <%}%>
                    <li><a href="Register.jsp">Registrati</a></li>
                    <li><a href="Carrello.jsp"><img src="img/carrello.jpg" class="carrello"></a></li>
                </ul>
            </nav>
             <ul class="first">
                <li><a href="">Home</a></li>
                <li><a href="">Contatti</a></li>
                <li><a href="">PlayStation</a></li>
                <li><a href="">Xbox</a></li>
                <li><a href="">Nintendo</a></li>
            </ul>
        </div>
        
        <div style="height: 10px;"></div>
<script>
var input=document.getElementById("input");

input.addEventListener("keyup",(e)=>{
	var test = [
		"lunedì",
		"martedì",
		"mercoledì",
		"giovedì",
		"venerdì",
		"sabato",
		"domenica"];
	var option='';
	
	for(var i=0;i<test.length;i++){
		option+="<option value='"+test[i]+"'/>";
	}
	
	document.getElementById("languages").innerHTML=option;
});


</script>
</body>
</html>