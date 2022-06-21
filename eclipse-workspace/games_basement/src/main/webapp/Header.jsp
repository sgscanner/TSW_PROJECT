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
<!--  <script>
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
</script> -->
</head>
<body>
   <div class="navbar">
   
   
   
     <form class="form"></form>
                  <img src="img/logo.png" class="logo">
                        
                    <input type="text" placeholder="Search..." id="input" list="languages" autocomplete="off">
                    <input type="submit" value="Search">
                    <datalist id="languages">
						  
					</datalist>
					
   
   
   
   
   
   
           
       <div class="container">
                    <a class="logobrand" href="/img/logo.png"></a>
                   
           <div class="coll" id="navColl">
                <ul class="navEle">
                     
                        <li><a href="Login.jsp">Accedi</a></li>
                        
                        <li><a href="PersonalPage.jsp"></a></li>
                        <li><a href="Register.jsp">Registrati</a></li>
                    <li><a href="Carrello.jsp"> Carrello </a></li>
                </ul>
            <ul class="first">
                <li><a href="HomePage.jsp">Home</a></li>
                
            </ul>
            
            
          
					
					
					
			
			       
                        
                        
                        
                     
                        
                        
                        
                        
                        
                        
                        
                     
                    
                    
                    
                    
                    
                        </div>
                    
                    
                    
                    
                    
                    
                    </div>
                 
           




           </div>



	
</body>
</html>