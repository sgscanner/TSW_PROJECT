<%@page import="bean.RubricaIndirizziBean"%>
<%@page import="bean.DatiAnagraficiBean"%>
<%@page import="bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
	<%@ include file="css/AccountUtente.css" %>
</style>
<meta charset="UTF-8">
<title>Area Personale</title>
<script src="ajax/ajaxJSON.js"></script>
<script src="jQuery/jquery.js"></script>
<script src='jQuery/jquery-ui.min.js'></script>
</head>
<body>
<%UserBean ub= (UserBean)request.getSession().getAttribute("user"); %>
	<%if(ub==null){
		request.getRequestDispatcher("ErrorRole.jsp").forward(request,response);
	}
	%>
	<%DatiAnagraficiBean dab=(DatiAnagraficiBean)request.getSession().getAttribute("user"); %>
	<%if(dab==null){
		request.getRequestDispatcher("ErrorRole.jsp").forward(request,response);
	}
	%>
	<%RubricaIndirizziBean rib=(RubricaIndirizziBean)request.getSession().getAttribute("user"); %>
	<%if(rib==null){
		request.getRequestDispatcher("ErrorRole.jsp").forward(request,response);
	}
	%>
	<h1>Hello <%=ub.getUsername() %></h1>
	<h2><a href="LogoutServlet">Logout</a></h2>
	<form id="form" action="RegisterServlet" method="POST">
		<div class="fields">
			<input class="valore" type="hidden" id="sezione" name="">
			<div class="field">
	    		<h2 class="fs-title">Dati Account</h2>
	    		<div class="inputContainer">
	    			<input class="testo1" type="text" id="username" name="username" value="<%=ub.getUsername()%>" placeholder="Username" readonly/>
	    			<small id="smallUname"></small>
	    		</div>
	    		<div class="inputContainer">
	    			<input class="testo1" type="text" id="email" name="email" value="<%=ub.getEmail()%>" placeholder="Email" readonly/><br>
	    			<small></small>
	    		</div>
	    		<div class="inputContainer">
	  	 			<input class="testo1" type="password" id="password" name="password" value="<%=ub.getPassword()%>" placeholder="Password" readonly/>
	  	 			<small></small>	
	   			</div>
	    		<div class="inputContainer">
	    			<input class="testo1" type="password" id="checkPassword" name="checkPassword" value="<%=ub.getPassword()%>" placeholder="Confirm password" readonly />
	    			<small></small>
	    		</div>
	    		<input type="button" id="editClick1" value="modifica">
				<input type="button" id="salvaInfo1" value="salva">
			</div>
			<div class="field">
				<h2 class="fs-title">Dati personali</h2>
		    		<div class="inputContainer">
		    			<input class="testo2" type="text" id="nome" name="nome" value="<%=dab.getNome()%>" placeholder="Nome" readonly/>
		    			<small></small>
		    		</div>
			    	<div class="inputContainer">
			    		<input class="testo2" type="text" id="cognome" name="cognome" value="<%=dab.getCognome()%>" placeholder="Cognome" readonly/>
			    		<small></small>
			    	</div>
			    	<div class="inputContainer">
			    		<input class="testo2" type="text" id="phone" name="phone" value="<%=dab.getTelefono()%>" placeholder="Numero di telefono" readonly/>
			    		<small></small>
			   		</div>
			    	<input type="button" id="editClick2" value="modifica">
			   		<input type="button" id="salvaInfo2" value="salva">
				</div>
			<div class="field">
		  		<h2 class="fs-title">Dati Anagrafici</h2>
			    	<div class="inputContainer">
			    		<input class="testo3" type="text" name="citta" value="<%=dab.getCitta()%>" placeholder="Città" readonly/>
			    		<small></small>
			    	</div>
			    	<div class="inputContainer"> 
			    		<input class="testo3" type="text" name="cap" value="<%=dab.getcap()%>" placeholder="Cap" readonly/>
			    		<small></small>
			   	 	</div>
			    	<div class="inputContainer">
			    		<input class="testo3" type="date" value="<%=dab.getDataNascita()%>" name="bday" readonly/>
			    		<small></small>
			    	</div>
			   		<input type="button" id="editClick3" value="modifica">
			   		<input type="button" id="salvaInfo3" value="salva">
		 	 </div>  
			<div class="field">
		  		<h2 class="fs-title">Indirizzi</h2>
			    	<div class="inputContainer">
			    		<input class="testo3" type="text" name="indirizzo" value="<%=rib.getIndirizzo()%>" placeholder="Indirizzo" readonly/>
			    		<small></small>
			    	</div>
			   		<input type="button" id="editClick3" value="modifica">
			   		<input type="button" id="salvaInfo3" value="salva">
		 	 </div>  
		</div>
	</form>
</body>
<script>

$(document).ready(function(){
	  $("#editClick1").click(function(){
		   $(".testo1").removeAttr("readonly");
		});
});

$(document).ready(function(){
	  $("#salvaInfo1").click(function(){
		   $(".testo1").attr("readonly", true);
		   $("#sezione").attr("name", "dati_account");
		});
});

$(document).ready(function(){
	  $("#editClick2").click(function(){
		   $(".testo2").removeAttr("readonly");
		});
});

$(document).ready(function(){
	  $("#salvaInfo2").click(function(){
		   $(".testo2").attr("readonly", true);
		   $("#sezione").attr("name", "dati_anagrafici");
		});
});

$(document).ready(function(){
	  $("#editClick3").click(function(){
		   $(".testo3").removeAttr("readonly");
		});
});

$(document).ready(function(){
	  $("#salvaInfo3").click(function(){
		   $(".testo3").attr("readonly", true);
		   $("#sezione").attr("name", "dati_personali");
		});
});
</script>
</body>
</html>