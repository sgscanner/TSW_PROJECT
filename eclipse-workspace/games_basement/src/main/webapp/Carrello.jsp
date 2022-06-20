<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrello</title>
</head>
<body>
	<%@include file="Header.jsp"%>
	<div>
		<div>
			<table style="border:1px solid black;" class=tabella>
				<tr style="border:1px solid black;" class="prodotto">
					<td style="border:1px solid black;"class=nome><br><img src="img/PlayStation5.jpg" class="image"></td>
					<td style="border:1px solid black;"class=desc><b> Descrizione</b></td>
					<td style="border:1px solid black;"class=q><b> Quantita</b></td>
					<td style="border:1px solid black;"class=prezzo><b>Prezzo</b></td>
				</tr>
				<tr style="border:1px solid black;">
					<td style="border:1px solid black;"class=rigaNome>PlayStation5</td>
					<td style="border:1px solid black;"class=rigaDesc>PlayStation console modello 2022</td>
					<td style="border:1px solid black;"class=rigaQ><b>1</b></td>
					<td style="border:1px solid black;"class=rigaPrezzo>800</td>
				</tr>
			</table>


				<a href="Checkout.jsp"><button onclick="procedi">Procedi</button> </a>
				
				<a href=""><button onclick="Svuota"> Svuota Carrello</button></a>
		
		</div>
	</div>

</body>
</html>