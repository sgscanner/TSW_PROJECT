<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recensione prodotto</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<style><%@include file="css/Feedback.css"%></style>
</head>
<body>
	
	<%@include file="Header.jsp" %>
		<p class="par"><b>Crea recensione</b></p>
		
		<div style="display: grid; grid-template-columns: auto auto">
			<div>
				<img class="pitcure" src="img/rec.jpg" alt="1" style="max-width:100%">
			</div>
			<div>
				<p class="pro">Marvel's Spider-Man</p>
			</div>
		</div>
		
		<div class="line"></div>
		
		<p class="val"><b>Valutazione complessiva</b></p>
	<form action="" method="post" id="com">	
		<div style="margin-left:300px">
			<%@include file="Star.jsp" %>
		</div>
		
		<div class="line"></div>
	
		<div>
			<p class="val"><b>Aggiungi un titolo</b></p>
			<input class="bar" type="text" placeholder="Quali sono le cose più importanti da sapere ?">
		</div>
		
		<div class="line"></div>
		
		<p class="val"><b>Aggiungi una recensione scritta</b></p>
		
		<div style="margin-left:300px">
			
				<textarea class="t" name="comments" rows="10" cols="70" placeholder="Lascia una recensione..." maxlength="500" form="com"></textarea><br>
				<input class="button" type="submit" value="Invia">
		</div>
	</form>
	
	<div style="margin-top: 25px;">
		<%@include file="Footer.jsp" %>
	</div>
	
</body>
</html>