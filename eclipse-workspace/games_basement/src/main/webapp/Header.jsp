<%@page import="bean.UserBean"%>
<%@page import="bean.ArticoliBean" %>
<%@page import="implementation.ArticoliImpl" %>
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
                    <input type="text" placeholder="Search..." id="input" autocomplete="off">
                    <input type="submit" value="Search">
                    <div id="search_option">
                    	<ul id="search_list">
                    		<%ArticoliImpl ai=new ArticoliImpl();
                    		  for(ArticoliBean ab:ai.getAllArticoli()){%>
                    				<li><%ab.getNome(); %></li>  
                    		  <% }%>
                    	</ul>
                    </div>
                </form>	
                <ul class="nav-links">
                	<%if(ub==null){%>
                    	<li><a href="Login.jsp">Accedi</a></li>
                    <%}else{ %>
						<li><a href="PersonalPage.jsp"><%=ub.getUsername() %></a></li>
                    <%}%>
                    <li><a href="Register.jsp">Registrati</a></li>
                    <li><a href="Carrello.jsp"><img src="img/carrello.jpg" class="carrello"></a></li>
                    <li><button class="nav">Navigation</button></li>
                </ul>
            </nav>
            <!--  <ul class="first">
                <li><a href="">Home</a></li>
                <li><a href="">Contatti</a></li>
                <li><a href="">PlayStation</a></li>
                <li><a href="">Xbox</a></li>
                <li><a href="">Nintendo</a></li>
            </ul>--> 
        </div>
        
        <div style="height: 10px;"></div>
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
</body>
</html>